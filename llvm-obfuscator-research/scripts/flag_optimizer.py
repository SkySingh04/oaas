"""Utility helpers for compiling with LLVM flags and scoring obfuscation."""

from __future__ import annotations

import json
import os
import shlex
import shutil
import subprocess
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Any, Dict, Iterable, List, Optional, Sequence, Tuple


RADARE2 = shutil.which("r2") or shutil.which("radare2")


# ---------------------------------------------------------------------------
# Command utilities
# ---------------------------------------------------------------------------


def _run_command(
    args: Sequence[str], *, timeout: int = 60, capture_output: bool = True
) -> Tuple[int, str, str]:
    """Execute a subprocess command safely."""

    try:
        result = subprocess.run(
            list(args),
            check=False,
            timeout=timeout,
            capture_output=capture_output,
            text=True,
        )
    except FileNotFoundError as exc:  # command missing (e.g., objdump)
        return -1, "", str(exc)
    except subprocess.TimeoutExpired:
        return -1, "", "timeout"

    stdout = result.stdout if capture_output else ""
    stderr = result.stderr if capture_output else ""
    return result.returncode, stdout, stderr


def _expand_flag_strings(flag_strings: Iterable[str]) -> List[str]:
    """Split a sequence of flag strings into individual command arguments."""

    expanded: List[str] = []
    for raw in flag_strings:
        if not raw:
            continue
        expanded.extend(shlex.split(raw))
    return expanded


# ---------------------------------------------------------------------------
# Metric collection helpers
# ---------------------------------------------------------------------------


def _count_strings(binary_path: Path) -> Tuple[int, List[str]]:
    rc, stdout, _ = _run_command(["strings", str(binary_path)])
    if rc != 0:
        return 0, []
    lines = stdout.splitlines()
    return len(lines), lines


def _count_symbols(binary_path: Path) -> int:
    rc, stdout, _ = _run_command(["nm", str(binary_path)])
    if rc != 0:
        return 0
    try:
        return len(stdout.splitlines())
    except ValueError:
        return 0


def _count_functions(binary_path: Path) -> int:
    rc, stdout, _ = _run_command(["nm", str(binary_path)])
    if rc != 0:
        return 0
    return sum(1 for line in stdout.splitlines() if " T " in line)


def _count_instructions(binary_path: Path) -> int:
    rc, stdout, _ = _run_command(["objdump", "-d", str(binary_path)])
    if rc != 0:
        return 0
    # objdump addresses end with ':'; count instruction lines heuristically
    return sum(1 for line in stdout.splitlines() if line.lstrip().startswith("0"))


def _radare2_json(binary_path: Path, command: str, *, log: bool = False) -> Optional[Any]:
    if not RADARE2:
        return None
    cmd = [RADARE2, "-A", "-qq", "-c", command, str(binary_path)]
    if log:
        print(f"[radare2] {binary_path.name} :: {command}", flush=True)
    rc, stdout, stderr = _run_command(cmd)
    if log:
        stdout_stripped = stdout.strip()
        stderr_stripped = stderr.strip()
        if stdout_stripped:
            print(stdout_stripped, flush=True)
        if stderr_stripped:
            print(stderr_stripped, file=sys.stderr, flush=True)
    if rc != 0:
        return None
    stdout = stdout.strip()
    if not stdout:
        return None
    try:
        return json.loads(stdout)
    except json.JSONDecodeError:
        return None


def _collect_metrics_radare2(binary_path: Path, *, log: bool = False) -> Optional[Dict[str, Any]]:
    functions = _radare2_json(binary_path, "aflj", log=log)
    strings = _radare2_json(binary_path, "izj", log=log)

    if not isinstance(functions, list):
        return None

    func_dicts = [f for f in functions if isinstance(f, dict)]
    function_count = float(len(func_dicts))

    total_instructions = float(sum(f.get("ninstrs", 0) for f in func_dicts))
    total_blocks = float(sum(f.get("nbbs", 0) for f in func_dicts))
    total_complexity = float(sum(f.get("cc", 0) for f in func_dicts))

    if function_count > 0.0:
        avg_blocks = total_blocks / function_count
        avg_complexity = total_complexity / function_count
    else:
        avg_blocks = 0.0
        avg_complexity = 0.0

    extracted_strings: List[str] = []
    if isinstance(strings, list):
        for entry in strings:
            if isinstance(entry, dict):
                value = entry.get("string") or entry.get("name")
                if isinstance(value, str):
                    extracted_strings.append(value)
    string_count = len(extracted_strings)

    return {
        "function_count": int(function_count),
        "total_instructions": int(total_instructions),
        "avg_basic_blocks": round(avg_blocks, 4),
        "avg_cyclomatic_complexity": round(avg_complexity, 4),
        "string_count": string_count,
        "analysis_tool": "radare2",
        "strings": extracted_strings,
    }


@dataclass
class CompileMetrics:
    size: int
    string_count: int
    symbol_count: int
    function_count: int
    instruction_count: int
    specific_strings_found: int
    found_strings: List[str] = field(default_factory=list)
    avg_basic_blocks: float = 0.0
    avg_cyclomatic_complexity: float = 0.0
    analysis_tool: str = "objdump"

    def to_dict(self) -> Dict[str, Any]:
        return {
            "size": self.size,
            "string_count": self.string_count,
            "symbol_count": self.symbol_count,
            "function_count": self.function_count,
            "instruction_count": self.instruction_count,
            "specific_strings_found": self.specific_strings_found,
            "found_strings": ",".join(self.found_strings),
            "avg_basic_blocks": self.avg_basic_blocks,
            "avg_cyclomatic_complexity": self.avg_cyclomatic_complexity,
            "analysis_tool": self.analysis_tool,
        }


def collect_metrics(
    binary_path: Path,
    sensitive_strings: Sequence[str],
    *,
    prefer_radare2: bool = True,
    require_radare2: bool = False,
    log_radare2: bool = False,
) -> CompileMetrics:
    """Gather obfuscation-related metrics for a compiled binary."""

    size = binary_path.stat().st_size if binary_path.exists() else 0
    strings_out: List[str] = []
    analysis_tool = "objdump"
    avg_blocks = 0.0
    avg_complexity = 0.0

    radare_metrics: Optional[Dict[str, Any]] = None
    if prefer_radare2 and RADARE2:
        radare_metrics = _collect_metrics_radare2(binary_path, log=log_radare2)
        if radare_metrics:
            analysis_tool = "radare2"

    if require_radare2 and analysis_tool != "radare2":
        raise RuntimeError("radare2 analysis requested but radare2 executable not found or analysis failed")

    if radare_metrics:
        function_count = radare_metrics.get("function_count", 0)
        instruction_count = radare_metrics.get("total_instructions", 0)
        string_count = radare_metrics.get("string_count", 0)
        avg_blocks = radare_metrics.get("avg_basic_blocks", 0.0)
        avg_complexity = radare_metrics.get("avg_cyclomatic_complexity", 0.0)
        strings_out = radare_metrics.get("strings", [])
    else:
        string_count, strings_out = _count_strings(binary_path)
        function_count = _count_functions(binary_path)
        instruction_count = _count_instructions(binary_path)

    symbol_count = _count_symbols(binary_path)

    sensitive_found = []
    if sensitive_strings and strings_out:
        lower_strings = {s.lower() for s in strings_out}
        for needle in sensitive_strings:
            if needle.lower() in lower_strings:
                sensitive_found.append(needle)

    return CompileMetrics(
        size=size,
        string_count=string_count,
        symbol_count=symbol_count,
        function_count=function_count,
        instruction_count=instruction_count,
        specific_strings_found=len(sensitive_found),
        found_strings=sensitive_found,
        avg_basic_blocks=avg_blocks,
        avg_cyclomatic_complexity=avg_complexity,
        analysis_tool=analysis_tool,
    )


def calculate_obfuscation_score(
    metrics: CompileMetrics, baseline: CompileMetrics
) -> float:
    """Reuse the weighted scoring heuristic from earlier experiments."""

    score = 0.0

    if baseline.size > 0:
        size_ratio = metrics.size / baseline.size
        score -= (size_ratio - 1.0) * 10

    if baseline.string_count > 0:
        string_ratio = metrics.string_count / baseline.string_count
        score += (1.0 - string_ratio) * 30

    if baseline.symbol_count > 0:
        symbol_ratio = metrics.symbol_count / baseline.symbol_count
        score += (1.0 - symbol_ratio) * 25

    if baseline.function_count > 0:
        func_ratio = metrics.function_count / baseline.function_count
        score += (1.0 - func_ratio) * 20

    if baseline.instruction_count > 0:
        inst_ratio = metrics.instruction_count / baseline.instruction_count
        score += (inst_ratio - 1.0) * 15

    delta_sensitive = (
        baseline.specific_strings_found - metrics.specific_strings_found
    ) * 10
    score += delta_sensitive

    return round(score, 2)


# ---------------------------------------------------------------------------
# Compilation and optimization workflow
# ---------------------------------------------------------------------------


def _select_compiler(source_path: Path) -> str:
    suffix = source_path.suffix.lower()
    cpp_suffixes = {".cpp", ".cc", ".cxx", ".cp", ".c++"}
    if suffix in cpp_suffixes:
        return os.environ.get("CXX", "clang++")
    return os.environ.get("CC", "clang")


def compile_source(
    source_path: Path, output_path: Path, flags: Sequence[str]
) -> Tuple[bool, str]:
    """Compile a source file with clang/clang++ and return success flag plus stderr."""

    output_path.parent.mkdir(parents=True, exist_ok=True)
    compiler = _select_compiler(source_path)
    cmd = [compiler, *flags, str(source_path), "-o", str(output_path)]
    rc, _, stderr = _run_command(cmd)
    return rc == 0, stderr.strip()


def _compile_and_measure(
    *,
    source_path: Path,
    output_path: Path,
    flags: Sequence[str],
    sensitive_strings: Sequence[str],
    baseline: Optional[CompileMetrics] = None,
    prefer_radare2: bool = True,
    require_radare2: bool = False,
    log_radare2: bool = False,
) -> Dict[str, Any]:
    """Compile and gather metrics in one helper."""

    compiled, error = compile_source(source_path, output_path, flags)
    result: Dict[str, Any] = {
        "binary_path": str(output_path),
        "flags": list(flags),
        "success": compiled,
        "error": error,
    }

    if not compiled or not Path(output_path).exists():
        return result

    metrics = collect_metrics(
        output_path,
        sensitive_strings,
        prefer_radare2=prefer_radare2,
        require_radare2=require_radare2,
        log_radare2=log_radare2,
    )
    result.update({
        "metrics": metrics,
        "metrics_dict": metrics.to_dict(),
    })

    if baseline is not None:
        result["obfuscation_score"] = calculate_obfuscation_score(metrics, baseline)
    else:
        result["obfuscation_score"] = 0.0

    return result


def optimize_flags(
    *,
    source_file: Path,
    output_dir: Path,
    candidate_flags: Sequence[str],
    base_flags: Optional[Sequence[str]] = None,
    sensitive_strings: Optional[Sequence[str]] = None,
    improvement_threshold: float = 0.0,
    prefer_radare2: bool = True,
    require_radare2: bool = False,
    cleanup_intermediates: bool = False,
    stream_radare2_logs: bool = False,
) -> Dict[str, Any]:
    """Sequentially add flags when they improve the obfuscation score."""

    if not source_file.exists():
        raise FileNotFoundError(f"Source file not found: {source_file}")

    output_dir.mkdir(parents=True, exist_ok=True)

    sensitive_strings = list(sensitive_strings or [])
    base_flag_tokens = _expand_flag_strings(base_flags or [])

    source_stem = source_file.stem
    baseline_path = output_dir / f"{source_stem}_baseline"

    baseline_result = _compile_and_measure(
        source_path=source_file,
        output_path=baseline_path,
        flags=base_flag_tokens,
        sensitive_strings=sensitive_strings,
        prefer_radare2=prefer_radare2,
        require_radare2=require_radare2,
        log_radare2=stream_radare2_logs,
    )

    if not baseline_result.get("success"):
        return {
            "status": "error",
            "message": "Baseline compilation failed",
            "details": baseline_result.get("error"),
        }

    baseline_metrics: CompileMetrics = baseline_result["metrics"]
    baseline_result["obfuscation_score"] = 0.0

    accepted_tokens: List[str] = []
    accepted_flags: List[str] = []
    current_score = 0.0
    current_result = {
        "metrics": baseline_metrics,
        "binary_path": baseline_result["binary_path"],
        "obfuscation_score": current_score,
    }

    history: List[Dict[str, Any]] = []
    intermediate_paths: List[Path] = []

    for index, candidate in enumerate(candidate_flags, start=1):
        candidate_tokens = _expand_flag_strings([candidate])

        # Skip duplicate flags that are already applied
        if all(token in accepted_tokens for token in candidate_tokens):
            continue

        combined_tokens = [*base_flag_tokens, *accepted_tokens, *candidate_tokens]
        candidate_path = output_dir / f"{source_stem}_candidate_{index}"

        run_result = _compile_and_measure(
            source_path=source_file,
            output_path=candidate_path,
            flags=combined_tokens,
            sensitive_strings=sensitive_strings,
            baseline=baseline_metrics,
            prefer_radare2=prefer_radare2,
            require_radare2=require_radare2,
            log_radare2=stream_radare2_logs,
        )

        log_entry: Dict[str, Any] = {
            "flag": candidate,
            "binary_path": run_result.get("binary_path"),
            "success": run_result.get("success", False),
        }

        if not run_result.get("success"):
            log_entry.update({
                "status": "compile_failed",
                "error": run_result.get("error"),
            })
            history.append(log_entry)
            Path(run_result.get("binary_path", "")).unlink(missing_ok=True)
            continue

        score = run_result.get("obfuscation_score", 0.0)
        improvement = score - current_score

        log_entry.update({
            "status": "accepted" if improvement > improvement_threshold else "rejected",
            "score": score,
            "improvement": round(improvement, 2),
            "metrics": run_result.get("metrics_dict"),
        })

        if improvement > improvement_threshold:
            accepted_tokens.extend(token for token in candidate_tokens if token not in accepted_tokens)
            accepted_flags.append(candidate)
            current_score = score
            current_result = run_result
            intermediate_paths.append(Path(run_result.get("binary_path", "")))
        else:
            Path(run_result.get("binary_path", "")).unlink(missing_ok=True)

        history.append(log_entry)

    final_binary = output_dir / f"{source_stem}_obfuscated"
    final_source_tokens = [*base_flag_tokens, *accepted_tokens]

    best_path = Path(current_result.get("binary_path", "")) if current_result.get("binary_path") else None

    if best_path and best_path.exists():
        shutil.copy2(best_path, final_binary)
    else:
        # Worst-case fallback: recompile the last accepted combination
        _compile_and_measure(
            source_path=source_file,
            output_path=final_binary,
            flags=final_source_tokens,
            sensitive_strings=sensitive_strings,
            baseline=baseline_metrics,
            prefer_radare2=prefer_radare2,
            require_radare2=require_radare2,
            log_radare2=stream_radare2_logs,
        )

    if cleanup_intermediates:
        for path in intermediate_paths:
            if not path:
                continue
            if best_path and path == best_path:
                continue
            if path == baseline_path:
                continue
            Path(path).unlink(missing_ok=True)
        # Remove the best intermediate after copying to avoid duplicates
        if best_path and best_path.exists() and best_path != baseline_path:
            best_path.unlink(missing_ok=True)

    summary = {
        "status": "completed",
        "baseline": {
            "binary": baseline_result["binary_path"],
            "metrics": baseline_metrics.to_dict(),
            "flags": base_flag_tokens,
        },
        "final_binary": str(final_binary),
        "final_score": round(current_score, 2),
        "accepted_flags": accepted_flags,
        "applied_flags": final_source_tokens,
        "history": history,
        "analysis_tool": baseline_metrics.analysis_tool,
    }

    return summary


__all__ = [
    "collect_metrics",
    "calculate_obfuscation_score",
    "compile_source",
    "optimize_flags",
]
