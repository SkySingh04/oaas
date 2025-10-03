#!/usr/bin/env python3
"""
Exhaustive LLVM Flag Optimization Search

This module implements a comprehensive exhaustive search algorithm to find the optimal
combination of LLVM compilation flags for maximum code obfuscation. Unlike the greedy
sequential approach, this performs a full combinatorial search.

The algorithm tests every possible combination of flags (or a large subset) to find
the configuration that produces the highest obfuscation score.
"""

from __future__ import annotations

import itertools
import json
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Sequence, Set, Tuple

# Add parent directory to path for imports
CURRENT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = CURRENT_DIR.parent
RESEARCH_DIR = PROJECT_ROOT / "llvm-obfuscator-research"

# Add paths for imports
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))
if str(RESEARCH_DIR) not in sys.path:
    sys.path.append(str(RESEARCH_DIR))

# Try to import from research directory first (has radare2 support)
try:
    sys.path.insert(0, str(RESEARCH_DIR))
    from scripts.flag_optimizer import (
        CompileMetrics,
        calculate_obfuscation_score,
        collect_metrics,
        compile_source,
    )
    sys.path.pop(0)
except ImportError:
    # Fallback to main scripts directory
    from scripts.flag_optimizer import (
        CompileMetrics,
        calculate_obfuscation_score,
        collect_metrics,
        compile_source,
    )

from scripts import flags as flag_catalog


@dataclass
class OptimizationResult:
    """Result from testing a flag combination."""

    flags: List[str]
    score: float
    metrics: CompileMetrics
    binary_path: str
    compilation_success: bool
    error_message: str = ""
    combination_index: int = 0
    total_combinations: int = 0


@dataclass
class ExhaustiveSearchState:
    """Tracks the state of the exhaustive search."""

    best_result: Optional[OptimizationResult] = None
    all_results: List[OptimizationResult] = field(default_factory=list)
    tested_combinations: int = 0
    total_combinations: int = 0
    failed_compilations: int = 0
    baseline_metrics: Optional[CompileMetrics] = None

    def update_best(self, result: OptimizationResult) -> bool:
        """Update best result if the new one is better. Returns True if updated."""
        if not result.compilation_success:
            return False

        if self.best_result is None or result.score > self.best_result.score:
            self.best_result = result
            return True
        return False

    def to_dict(self) -> Dict:
        """Convert to dictionary for JSON serialization."""
        return {
            "tested_combinations": self.tested_combinations,
            "total_combinations": self.total_combinations,
            "failed_compilations": self.failed_compilations,
            "success_rate": round(
                (self.tested_combinations - self.failed_compilations) / self.tested_combinations * 100, 2
            ) if self.tested_combinations > 0 else 0.0,
            "best_result": {
                "flags": self.best_result.flags,
                "score": self.best_result.score,
                "metrics": self.best_result.metrics.to_dict(),
                "binary_path": self.best_result.binary_path,
            } if self.best_result else None,
            "baseline_metrics": self.baseline_metrics.to_dict() if self.baseline_metrics else None,
        }


def _expand_flag_strings(flag_strings: Sequence[str]) -> List[str]:
    """Split flag strings into individual tokens."""
    import shlex
    expanded: List[str] = []
    for raw in flag_strings:
        if not raw:
            continue
        expanded.extend(shlex.split(raw))
    return expanded


def _generate_flag_combinations(
    flags: Sequence[str],
    min_size: int = 1,
    max_size: Optional[int] = None,
    exclude_conflicts: bool = True,
) -> List[List[str]]:
    """
    Generate all possible flag combinations.

    Args:
        flags: List of flags to combine
        min_size: Minimum number of flags in a combination
        max_size: Maximum number of flags in a combination (None = all)
        exclude_conflicts: Whether to exclude conflicting flags

    Returns:
        List of flag combinations
    """
    if max_size is None:
        max_size = len(flags)

    # Define conflicting flag patterns
    conflicts = [
        # Optimization levels conflict with each other
        {"-O0", "-O1", "-O2", "-O3", "-Os", "-Oz", "-Ofast", "-Og"},
        # LTO types conflict
        {"-flto", "-flto=thin", "-flto=full"},
        # Inlining conflicts
        {"-finline-functions", "-fno-inline", "-fno-inline-functions"},
        {"-finline-limit=1000", "-finline-limit=10000", "-finline-limit=999999"},
        # Frame pointer conflicts
        {"-fomit-frame-pointer", "-fno-omit-frame-pointer"},
        # Loop unrolling conflicts
        {"-funroll-loops", "-funroll-all-loops", "-fno-unroll-loops"},
        # Vectorization conflicts
        {"-fvectorize", "-fno-vectorize"},
        {"-fslp-vectorize", "-fno-slp-vectorize"},
        # Math optimization conflicts
        {"-ffp-contract=fast", "-ffp-contract=off"},
        # Control flow protection conflicts
        {"-fcf-protection=none", "-fcf-protection=branch", "-fcf-protection=return", "-fcf-protection=full"},
        # Register allocator conflicts
        {"-mllvm -regalloc=greedy", "-mllvm -regalloc=basic", "-mllvm -regalloc=fast", "-mllvm -regalloc=pbqp"},
        # Constant merging conflicts
        {"-fmerge-constants", "-fmerge-all-constants", "-fno-merge-constants"},
        # Aliasing conflicts
        {"-fstrict-aliasing", "-fno-strict-aliasing"},
        # Sibling call conflicts
        {"-foptimize-sibling-calls", "-fno-optimize-sibling-calls"},
    ]

    def has_conflict(combination: Tuple[str, ...]) -> bool:
        """Check if a combination has conflicting flags."""
        if not exclude_conflicts:
            return False

        combo_set = set(combination)
        for conflict_group in conflicts:
            if len(combo_set & conflict_group) > 1:
                return True
        return False

    all_combinations: List[List[str]] = []

    for size in range(min_size, max_size + 1):
        for combo in itertools.combinations(flags, size):
            if not has_conflict(combo):
                all_combinations.append(list(combo))

    return all_combinations


def exhaustive_search(
    source_file: Path,
    output_dir: Path,
    candidate_flags: Sequence[str],
    base_flags: Optional[Sequence[str]] = None,
    sensitive_strings: Optional[Sequence[str]] = None,
    min_flags: int = 1,
    max_flags: Optional[int] = None,
    exclude_conflicts: bool = True,
    prefer_radare2: bool = True,
    require_radare2: bool = False,
    log_radare2: bool = False,
    save_all_binaries: bool = False,
    progress_callback: Optional[callable] = None,
) -> ExhaustiveSearchState:
    """
    Perform exhaustive search over all flag combinations.

    Args:
        source_file: Source file to compile
        output_dir: Directory for output binaries
        candidate_flags: Flags to test in combinations
        base_flags: Flags always applied (e.g., -O3)
        sensitive_strings: Strings that should disappear
        min_flags: Minimum flags per combination
        max_flags: Maximum flags per combination
        exclude_conflicts: Whether to exclude conflicting flags
        prefer_radare2: Use radare2 for analysis if available
        require_radare2: Require radare2 (fail if unavailable)
        log_radare2: Show radare2 command output
        save_all_binaries: Keep all binaries (otherwise only best)
        progress_callback: Function called with (current, total, result)

    Returns:
        ExhaustiveSearchState with all results
    """
    if not source_file.exists():
        raise FileNotFoundError(f"Source file not found: {source_file}")

    output_dir.mkdir(parents=True, exist_ok=True)

    # Setup
    sensitive_strings = list(sensitive_strings or [])
    base_flag_tokens = _expand_flag_strings(base_flags or [])
    source_stem = source_file.stem

    # Generate all combinations
    print(f"Generating flag combinations (min={min_flags}, max={max_flags or 'all'})...")
    combinations = _generate_flag_combinations(
        candidate_flags,
        min_size=min_flags,
        max_size=max_flags,
        exclude_conflicts=exclude_conflicts,
    )

    state = ExhaustiveSearchState()
    state.total_combinations = len(combinations)

    print(f"Total combinations to test: {state.total_combinations}")
    print(f"This will test EVERY possible combination incrementally.\n")

    # Compile baseline
    print("Compiling baseline...")
    baseline_path = output_dir / f"{source_stem}_baseline"
    baseline_success, baseline_error = compile_source(source_file, baseline_path, base_flag_tokens)

    if not baseline_success:
        raise RuntimeError(f"Baseline compilation failed: {baseline_error}")

    # Try calling with radare2 params, fall back to simple version
    try:
        state.baseline_metrics = collect_metrics(
            baseline_path,
            sensitive_strings,
            prefer_radare2=prefer_radare2,
            require_radare2=require_radare2,
            log_radare2=log_radare2,
        )
    except TypeError:
        # Simple version without radare2 support
        state.baseline_metrics = collect_metrics(baseline_path, sensitive_strings)

    print(f"Baseline compiled successfully.")
    print(f"Baseline metrics: {state.baseline_metrics.to_dict()}\n")

    # Test all combinations
    print("Starting exhaustive search...\n")

    for idx, flag_combo in enumerate(combinations, start=1):
        combo_flags = _expand_flag_strings(flag_combo)
        combined_flags = base_flag_tokens + combo_flags

        # Create unique binary path
        combo_hash = hash(tuple(flag_combo)) % 1000000
        binary_path = output_dir / f"{source_stem}_combo_{combo_hash:06d}"

        # Compile
        success, error = compile_source(source_file, binary_path, combined_flags)

        result = OptimizationResult(
            flags=flag_combo,
            score=0.0,
            metrics=None,
            binary_path=str(binary_path),
            compilation_success=success,
            error_message=error,
            combination_index=idx,
            total_combinations=state.total_combinations,
        )

        if not success:
            state.failed_compilations += 1
            state.all_results.append(result)

            # Clean up failed binary
            binary_path.unlink(missing_ok=True)

            if progress_callback:
                progress_callback(idx, state.total_combinations, result)

            state.tested_combinations += 1
            continue

        # Collect metrics
        try:
            metrics = collect_metrics(
                binary_path,
                sensitive_strings,
                prefer_radare2=prefer_radare2,
                require_radare2=require_radare2,
                log_radare2=log_radare2,
            )
        except TypeError:
            metrics = collect_metrics(binary_path, sensitive_strings)

        # Calculate score
        score = calculate_obfuscation_score(metrics, state.baseline_metrics)

        result.metrics = metrics
        result.score = score

        # Update state
        state.all_results.append(result)
        is_new_best = state.update_best(result)

        # Log progress
        status = "NEW BEST!" if is_new_best else ""
        print(f"[{idx}/{state.total_combinations}] Score: {score:6.2f} {status}")
        print(f"  Flags: {' '.join(flag_combo[:3])}{'...' if len(flag_combo) > 3 else ''}")

        if is_new_best:
            print(f"  Best score so far: {score}")
            print(f"  Metrics: strings={metrics.string_count}, symbols={metrics.symbol_count}, funcs={metrics.function_count}")

        # Clean up binary unless we want to save all or it's the best
        if not save_all_binaries and not is_new_best:
            binary_path.unlink(missing_ok=True)

        if progress_callback:
            progress_callback(idx, state.total_combinations, result)

        state.tested_combinations += 1

    print(f"\nExhaustive search complete!")
    print(f"Tested: {state.tested_combinations} combinations")
    print(f"Failed: {state.failed_compilations} compilations")
    print(f"Success rate: {(state.tested_combinations - state.failed_compilations) / state.tested_combinations * 100:.2f}%")

    if state.best_result:
        print(f"\nBest combination found:")
        print(f"  Score: {state.best_result.score}")
        print(f"  Flags: {' '.join(state.best_result.flags)}")
        print(f"  Binary: {state.best_result.binary_path}")

    return state


def save_results(state: ExhaustiveSearchState, output_path: Path) -> None:
    """Save exhaustive search results to JSON."""

    results_data = {
        "summary": state.to_dict(),
        "all_results": [
            {
                "flags": r.flags,
                "score": r.score,
                "metrics": r.metrics.to_dict() if r.metrics else {},
                "binary_path": r.binary_path,
                "success": r.compilation_success,
                "error": r.error_message,
            }
            for r in state.all_results
        ],
        "top_10": [
            {
                "rank": i + 1,
                "flags": r.flags,
                "score": r.score,
                "metrics": r.metrics.to_dict(),
            }
            for i, r in enumerate(
                sorted(
                    [r for r in state.all_results if r.compilation_success],
                    key=lambda x: x.score,
                    reverse=True,
                )[:10]
            )
        ],
    }

    output_path.parent.mkdir(parents=True, exist_ok=True)
    with open(output_path, "w") as f:
        json.dump(results_data, f, indent=2)

    print(f"\nResults saved to: {output_path}")


def main():
    """CLI entry point for exhaustive search."""
    import argparse

    parser = argparse.ArgumentParser(
        description="Exhaustive LLVM flag optimization search"
    )
    parser.add_argument("source", type=Path, help="Source file to compile")
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path("bin/exhaustive_search"),
        help="Output directory",
    )
    parser.add_argument("--base-flag", action="append", help="Base flags (always applied)")
    parser.add_argument("--category", action="append", help="Flag categories to include")
    parser.add_argument("--priority", action="append", help="Flag priorities to include")
    parser.add_argument("--min-flags", type=int, default=1, help="Minimum flags per combination")
    parser.add_argument("--max-flags", type=int, help="Maximum flags per combination")
    parser.add_argument(
        "--no-exclude-conflicts",
        action="store_true",
        help="Don't exclude conflicting flags",
    )
    parser.add_argument(
        "--save-all-binaries",
        action="store_true",
        help="Save all binaries (not just best)",
    )
    parser.add_argument(
        "--results-file",
        type=Path,
        default=Path("analysis/exhaustive_search_results.json"),
        help="Output JSON file for results",
    )

    args = parser.parse_args()

    # Filter flags
    categories = args.category or []
    priorities = args.priority or []

    def matches_filter(flag_entry: Dict) -> bool:
        cat_ok = not categories or flag_entry.get("category", "") in categories
        pri_ok = not priorities or flag_entry.get("priority", "") in priorities
        return cat_ok and pri_ok

    candidate_flags = [
        f["flag"]
        for f in flag_catalog.comprehensive_flags
        if matches_filter(f)
    ]

    print(f"Selected {len(candidate_flags)} flags for exhaustive search")

    # Run exhaustive search
    state = exhaustive_search(
        source_file=args.source,
        output_dir=args.output_dir,
        candidate_flags=candidate_flags,
        base_flags=args.base_flag or [],
        min_flags=args.min_flags,
        max_flags=args.max_flags,
        exclude_conflicts=not args.no_exclude_conflicts,
        save_all_binaries=args.save_all_binaries,
    )

    # Save results
    save_results(state, args.results_file)

    return 0


if __name__ == "__main__":
    sys.exit(main())
