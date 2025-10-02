#!/usr/bin/env python3
"""Automatic LLVM flag selection for obfuscation.

This script compiles a C/C++ source file with all compatible flag combinations,
measures the obfuscation score using radare2 when available (falls back to
objdump/nm heuristics otherwise), and reports the configuration that maximises
the obfuscation metric.

Usage:
    python3 scripts/auto_obfuscate.py --source path/to/program.cpp

Results are written to analysis/auto_obfuscator/ and binaries to bin/auto/.
"""

from __future__ import annotations

import argparse
import json
import shlex
import shutil
import subprocess
import sys
from dataclasses import dataclass, asdict
from datetime import datetime
from itertools import combinations
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Sequence, Tuple

PROJECT_ROOT = Path(__file__).resolve().parent.parent
SRC_DIR = PROJECT_ROOT / "src"
BIN_ROOT = PROJECT_ROOT / "bin"
AUTO_BIN_DIR = BIN_ROOT / "auto"
ANALYSIS_ROOT = PROJECT_ROOT / "analysis"
AUTO_ANALYSIS_DIR = ANALYSIS_ROOT / "auto_obfuscator"

AUTO_BIN_DIR.mkdir(parents=True, exist_ok=True)
AUTO_ANALYSIS_DIR.mkdir(parents=True, exist_ok=True)

RADARE2 = shutil.which("r2") or shutil.which("radare2")


@dataclass(frozen=True)
class FlagOption:
    """Represents a single candidate flag (or small bundle)."""

    identifier: str
    flags: Tuple[str, ...]
    description: str


FLAG_POOL: Tuple[FlagOption, ...] = (
    FlagOption("O3", ("-O3",), "High optimisation level"),
    FlagOption("NoUnwind", ("-fno-asynchronous-unwind-tables",), "Remove unwind tables"),
    FlagOption("NoIdent", ("-fno-ident",), "Strip compiler identification"),
    FlagOption("OmitFramePtr", ("-fomit-frame-pointer",), "Omit frame pointer"),
    FlagOption("Inline", ("-finline-functions",), "Aggressive inlining"),
    FlagOption("InlineLimit", ("-finline-limit=1000",), "Raise inlining threshold"),
    FlagOption("LoopUnroll", ("-funroll-loops",), "Loop unrolling"),
    FlagOption("FastMath", ("-ffast-math",), "Relaxed math rules"),
    FlagOption("HiddenVisibility", ("-fvisibility=hidden",), "Hide symbols by default"),
)


@dataclass
class CompileResult:
    identifier_chain: Tuple[str, ...]
    flags: Tuple[str, ...]
    binary: Path
    metrics: Dict[str, float]
    score: float
    tool: str
    success: bool
    stderr: Optional[str] = None


class CommandError(RuntimeError):
    pass


def run_subprocess(cmd: Sequence[str], *, timeout: int = 120) -> Tuple[int, str, str]:
    """Execute a command and return (returncode, stdout, stderr)."""

    try:
        completed = subprocess.run(
            list(cmd),
            check=False,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
    except subprocess.TimeoutExpired as exc:  # pragma: no cover - defensive
        raise CommandError(f"Command timed out: {' '.join(cmd)}") from exc

    return completed.returncode, completed.stdout, completed.stderr


def run_binary(binary: Path, args: Sequence[str]) -> Tuple[int, str, str]:
    cmd = [str(binary)]
    cmd.extend(args)
    return run_subprocess(cmd)


def detect_compiler(source_path: Path, override: Optional[str] = None) -> str:
    if override:
        return override
    suffix = source_path.suffix.lower()
    if suffix == ".c":
        return "clang"
    if suffix in {".cpp", ".cc", ".cxx", ".cp", ".c++"}:
        return "clang++"
    raise ValueError(f"Unsupported source extension: {source_path.suffix}")


def compile_source(
    source_path: Path,
    output_path: Path,
    compiler: str,
    flags: Sequence[str],
    extra_ldflags: Optional[Sequence[str]] = None,
) -> Tuple[bool, Optional[str]]:
    """Compile source with the provided flags."""

    cmd = [compiler]
    cmd.extend(flags)
    if extra_ldflags:
        cmd.extend(extra_ldflags)
    cmd.append(str(source_path))
    cmd.extend(["-o", str(output_path)])

    returncode, _stdout, stderr = run_subprocess(cmd)
    return returncode == 0, stderr if returncode != 0 else None


def flatten_flags(flags: Sequence[Sequence[str]]) -> List[str]:
    flat: List[str] = []
    for subset in flags:
        flat.extend(subset)
    return flat


def is_selection_compatible(selection: Sequence[FlagOption]) -> bool:
    optimisation_options = [flag for flag in selection if flag.identifier.startswith("O")]
    return len(optimisation_options) <= 1


def analyse_with_radare2(binary_path: Path) -> Optional[Dict[str, float]]:
    if not RADARE2:
        return None

    def r2_json(command: str) -> Optional[object]:
        cmd = [RADARE2, "-A", "-qq", "-c", command, str(binary_path)]
        returncode, stdout, stderr = run_subprocess(cmd)
        if returncode != 0:
            return None
        stdout = stdout.strip()
        if not stdout:
            return None
        try:
            return json.loads(stdout)
        except json.JSONDecodeError:
            return None

    functions = r2_json("aflj")
    strings = r2_json("izj")

    if functions is None:
        return None

    func_list = [f for f in functions if isinstance(f, dict)] if isinstance(functions, list) else []

    if not func_list:
        func_list = []

    function_count = float(len(func_list))
    total_instructions = float(sum(f.get("ninstrs", 0) for f in func_list))
    avg_nbbs = float(sum(f.get("nbbs", 0) for f in func_list))
    avg_complexity = float(sum(f.get("cc", 0) for f in func_list))

    if function_count:
        avg_nbbs /= function_count
        avg_complexity /= function_count
    else:
        avg_nbbs = 0.0
        avg_complexity = 0.0

    string_count = 0.0
    if isinstance(strings, list):
        string_count = float(len(strings))

    return {
        "function_count": function_count,
        "total_instructions": total_instructions,
        "avg_basic_blocks": avg_nbbs,
        "avg_cyclomatic_complexity": avg_complexity,
        "string_count": string_count,
    }


def analyse_with_objdump(binary_path: Path) -> Optional[Dict[str, float]]:
    """Fallback heuristic analysis using objdump/nm/strings."""

    if not binary_path.exists():
        return None

    metrics: Dict[str, float] = {}

    # Instructions via objdump
    cmd = ["objdump", "-d", str(binary_path)]
    returncode, stdout, _ = run_subprocess(cmd)
    if returncode == 0:
        instructions = [line for line in stdout.splitlines() if line.strip() and ":\t" in line]
        metrics["total_instructions"] = float(len(instructions))
    else:
        metrics["total_instructions"] = 0.0

    # Functions via nm
    cmd = ["nm", str(binary_path)]
    returncode, stdout, _ = run_subprocess(cmd)
    if returncode == 0:
        functions = [line for line in stdout.splitlines() if " T " in line]
        metrics["function_count"] = float(len(functions))
    else:
        metrics["function_count"] = 0.0

    # Visible strings
    cmd = ["strings", str(binary_path)]
    returncode, stdout, _ = run_subprocess(cmd)
    if returncode == 0:
        metrics["string_count"] = float(len(stdout.splitlines()))
    else:
        metrics["string_count"] = 0.0

    # Approximate averages
    metrics.setdefault("function_count", 0.0)
    metrics.setdefault("total_instructions", 0.0)

    if metrics["function_count"] > 0:
        metrics["avg_basic_blocks"] = max(metrics["total_instructions"] / metrics["function_count"] / 10.0, 0.0)
        metrics["avg_cyclomatic_complexity"] = metrics["avg_basic_blocks"] / 2.0
    else:
        metrics["avg_basic_blocks"] = 0.0
        metrics["avg_cyclomatic_complexity"] = 0.0

    return metrics


def compute_score(metrics: Dict[str, float], baseline: Dict[str, float]) -> float:
    score = 0.0

    def ratio_improvement(key: str, weight: float, *, more_is_better: bool) -> None:
        nonlocal score
        base = baseline.get(key, 0.0)
        new = metrics.get(key, 0.0)
        if base <= 0.0:
            return
        if more_is_better:
            score += ((new / base) - 1.0) * weight
        else:
            score += (1.0 - (new / base)) * weight

    ratio_improvement("avg_basic_blocks", 35.0, more_is_better=True)
    ratio_improvement("avg_cyclomatic_complexity", 25.0, more_is_better=True)
    ratio_improvement("total_instructions", 15.0, more_is_better=True)
    ratio_improvement("function_count", 25.0, more_is_better=False)
    ratio_improvement("string_count", 40.0, more_is_better=False)

    return round(score, 4)


def run_analysis(binary_path: Path) -> Tuple[Optional[Dict[str, float]], str]:
    metrics = analyse_with_radare2(binary_path)
    if metrics is not None:
        return metrics, "radare2"
    metrics = analyse_with_objdump(binary_path)
    return metrics, "objdump"


def evaluate_flags(
    source_path: Path,
    compiler: str,
    base_flags: Sequence[str],
    selected_flags: Sequence[FlagOption],
    baseline_metrics: Optional[Dict[str, float]],
    extra_ldflags: Optional[Sequence[str]] = None,
) -> CompileResult:
    identifiers = tuple(flag.identifier for flag in selected_flags)
    all_flags = list(base_flags)

    # Remove conflicting optimisation levels before applying new ones
    optimisation_flags = ["-O0", "-O1", "-O2", "-O3", "-Os", "-Oz"]
    if any(flag.identifier.startswith("O") for flag in selected_flags):
        all_flags = [f for f in all_flags if f not in optimisation_flags]

    all_flags.extend(flatten_flags(flag.flags for flag in selected_flags))

    binary_name = f"{source_path.stem}_{'_'.join(identifiers) if identifiers else 'baseline'}"
    binary_path = AUTO_BIN_DIR / binary_name

    ok, stderr = compile_source(source_path, binary_path, compiler, all_flags, extra_ldflags)
    if not ok:
        return CompileResult(identifiers, tuple(all_flags), binary_path, {}, float("-inf"), "", False, stderr)

    metrics, tool = run_analysis(binary_path)
    if metrics is None:
        return CompileResult(identifiers, tuple(all_flags), binary_path, {}, float("-inf"), tool, False, "Analysis failed")

    if baseline_metrics is None:
        score = 0.0
    else:
        score = compute_score(metrics, baseline_metrics)

    return CompileResult(identifiers, tuple(all_flags), binary_path, metrics, score, tool, True)


def enumerate_flag_selections(
    flag_pool: Sequence[FlagOption],
    *,
    max_size: Optional[int] = None,
) -> Iterable[Tuple[FlagOption, ...]]:
    total_flags = len(flag_pool)
    upper = total_flags if max_size is None else min(max_size, total_flags)
    for r in range(1, upper + 1):
        for subset in combinations(flag_pool, r):
            if is_selection_compatible(subset):
                yield subset


def count_flag_selections(
    flag_pool: Sequence[FlagOption], *, max_size: Optional[int] = None
) -> int:
    return sum(1 for _ in enumerate_flag_selections(flag_pool, max_size=max_size))


def exhaustive_search(
    source_path: Path,
    compiler: str,
    base_flags: Sequence[str],
    extra_ldflags: Optional[Sequence[str]],
    flag_pool: Sequence[FlagOption],
    max_combination_size: Optional[int],
) -> Tuple[List[CompileResult], CompileResult, CompileResult]:
    results: List[CompileResult] = []

    baseline_result = evaluate_flags(
        source_path,
        compiler,
        base_flags,
        selected_flags=[],
        baseline_metrics=None,
        extra_ldflags=extra_ldflags,
    )

    if not baseline_result.success:
        raise CommandError(f"Baseline compilation failed: {baseline_result.stderr}")

    baseline_metrics = baseline_result.metrics
    baseline_result.score = 0.0
    results.append(baseline_result)

    best_overall = baseline_result

    for selection in enumerate_flag_selections(flag_pool, max_size=max_combination_size):
        result = evaluate_flags(
            source_path,
            compiler,
            base_flags,
            selected_flags=list(selection),
            baseline_metrics=baseline_metrics,
            extra_ldflags=extra_ldflags,
        )
        results.append(result)

        if result.success and result.score > best_overall.score:
            best_overall = result

    return results, best_overall, baseline_result


def parse_args(argv: Optional[Sequence[str]] = None) -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Automatic LLVM obfuscation flag selector")
    parser.add_argument("--source", type=Path, default=SRC_DIR / "factorial_recursive.c", help="Path to the source file to compile")
    parser.add_argument("--compiler", type=str, default=None, help="Explicit compiler to use (clang or clang++)")
    parser.add_argument("--base-flags", nargs="*", default=["-O0"], help="Base compiler flags applied to every build")
    parser.add_argument("--ldflags", nargs="*", default=None, help="Additional linker flags")
    parser.add_argument("--max-combination-size", type=int, default=None, help="Limit the maximum number of flag bundles to combine (default: all)")
    parser.add_argument("--emit-json", action="store_true", help="Write detailed JSON report to analysis directory")
    parser.add_argument("--verify-args", action="append", default=[], help="Argument string to verify functional equivalence (repeatable); use quotes, e.g. \"5 3\"")
    return parser.parse_args(argv)


def main(argv: Optional[Sequence[str]] = None) -> int:
    args = parse_args(argv)
    source_path = args.source
    if not source_path.is_absolute():
        source_path = (PROJECT_ROOT / source_path).resolve()

    if not source_path.exists():
        print(f"[!] Source file not found: {source_path}")
        return 1

    try:
        compiler = detect_compiler(source_path, args.compiler)
    except ValueError as exc:
        print(f"[!] {exc}")
        return 1

    print("LLVM Auto Obfuscator")
    print("=====================")
    print(f"Source       : {source_path.relative_to(PROJECT_ROOT)}")
    print(f"Compiler     : {compiler}")
    print(f"Analysis tool: {'radare2' if RADARE2 else 'objdump fallback'}")
    print("Candidate flags:")
    for option in FLAG_POOL:
        print(f"  - {option.identifier:<14} {' '.join(option.flags)} :: {option.description}")

    try:
        total_candidates = count_flag_selections(FLAG_POOL, max_size=args.max_combination_size)
        print(f"Evaluating {total_candidates} flag combinations (excluding baseline)...")

        results, best, baseline = exhaustive_search(
            source_path,
            compiler,
            base_flags=args.base_flags,
            extra_ldflags=args.ldflags,
            flag_pool=FLAG_POOL,
            max_combination_size=args.max_combination_size,
        )
    except CommandError as exc:
        print(f"[!] {exc}")
        return 1

    print("\nEvaluations:")
    for result in results:
        name = "+".join(result.identifier_chain) if result.identifier_chain else "baseline"
        status = "OK" if result.success else "FAIL"
        score = f"{result.score:+.3f}" if result.success else "--"
        tool = result.tool or "--"
        print(f"  {name:<40} {status:<4} score={score:<8} tool={tool:<8} -> {result.binary.relative_to(PROJECT_ROOT)}")

    successful = [res for res in results if res.success]
    if successful:
        leaderboard = sorted(successful, key=lambda r: r.score, reverse=True)[:10]
        print("\nTop configurations:")
        for idx, res in enumerate(leaderboard, 1):
            name = "+".join(res.identifier_chain) if res.identifier_chain else "baseline"
            print(f"  {idx:>2}. {name:<40} score={res.score:+.3f}")

    if best.success:
        chosen = "+".join(best.identifier_chain) if best.identifier_chain else "(none)"
        print("\nBest configuration:")
        print(f"  Flags   : {' '.join(best.flags)}")
        print(f"  Options : {chosen}")
        print(f"  Score   : {best.score:+.3f}")
        print(f"  Binary  : {best.binary.relative_to(PROJECT_ROOT)}")
        print(f"  Metrics : {json.dumps(best.metrics, indent=2)}")
    else:
        print("\nNo successful obfuscation configuration found")

    verification_report: List[Dict[str, object]] = []
    verification_ok = True
    if args.verify_args:
        if not best.success:
            print("\n[!] Skipping verification because no successful obfuscated binary was produced")
            verification_ok = False
        else:
            print("\nVerifying functional equivalence:")
            for raw in args.verify_args:
                arg_vector = shlex.split(raw)
                baseline_rc, baseline_out, baseline_err = run_binary(baseline.binary, arg_vector)
                best_rc, best_out, best_err = run_binary(best.binary, arg_vector)

                matched = (
                    baseline_rc == best_rc
                    and baseline_out == best_out
                    and baseline_err == best_err
                )

                verification_report.append(
                    {
                        "args": arg_vector,
                        "baseline": {
                            "returncode": baseline_rc,
                            "stdout": baseline_out,
                            "stderr": baseline_err,
                        },
                        "obfuscated": {
                            "returncode": best_rc,
                            "stdout": best_out,
                            "stderr": best_err,
                        },
                        "matched": matched,
                    }
                )

                status = "✓" if matched else "✗"
                display_args = raw or "(no args)"
                print(f"  {status} args='{display_args}' -> rc {baseline_rc}/{best_rc}")

                if not matched:
                    verification_ok = False
            if verification_ok:
                print("✓ Functional equivalence confirmed for provided inputs")
            else:
                print("[!] Functional mismatch detected")

    exit_code = 0
    if not best.success:
        exit_code = 1
    if args.verify_args and not verification_ok:
        exit_code = 2

    if args.emit_json:
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        report_path = AUTO_ANALYSIS_DIR / f"auto_obfuscator_{timestamp}.json"
        payload = {
            "source": str(source_path.relative_to(PROJECT_ROOT)),
            "compiler": compiler,
            "analysis_tool": best.tool,
            "base_flags": args.base_flags,
            "results": [
                {
                    **asdict(r),
                    "binary": str(r.binary.relative_to(PROJECT_ROOT)) if r.binary.exists() else str(r.binary),
                }
                for r in results
            ],
            "best": {
                **asdict(best),
                "binary": str(best.binary.relative_to(PROJECT_ROOT)) if best.binary.exists() else str(best.binary),
            },
        }
        payload["baseline"] = {
            **asdict(baseline),
            "binary": str(baseline.binary.relative_to(PROJECT_ROOT)) if baseline.binary.exists() else str(baseline.binary),
        }
        if args.verify_args:
            payload["verification"] = verification_report
        with report_path.open("w", encoding="utf-8") as fh:
            json.dump(payload, fh, indent=2)
        print(f"\nDetailed report written to {report_path.relative_to(PROJECT_ROOT)}")

    return exit_code


if __name__ == "__main__":  # pragma: no cover
    sys.exit(main())
