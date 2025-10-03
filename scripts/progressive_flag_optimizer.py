#!/usr/bin/env python3
"""
Progressive Flag Optimizer
Starts with proven baseline and progressively adds flags, locking in improvements
"""

import json
import subprocess
import sys
from pathlib import Path
from typing import Dict, List, Optional, Sequence
from dataclasses import dataclass, asdict
import time

# Add parent directory to path for imports
sys.path.insert(0, str(Path(__file__).parent.parent))

from scripts.flags import comprehensive_flags as ALL_FLAGS

@dataclass
class BinaryMetrics:
    """Metrics for a compiled binary"""
    size: int = 0
    symbols: int = 0
    functions: int = 0
    strings: int = 0
    instructions: int = 0
    entropy: float = 0.0
    jumps: int = 0

    def to_dict(self) -> Dict:
        return asdict(self)


def collect_binary_metrics(binary_path: Path) -> BinaryMetrics:
    """Collect all metrics from a binary using system tools"""
    metrics = BinaryMetrics()

    # 1. Binary size
    try:
        result = subprocess.run(['stat', '-f%z', str(binary_path)],
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            metrics.size = int(result.stdout.strip())
    except:
        pass

    # 2. Symbol count
    try:
        result = subprocess.run(['nm', str(binary_path)],
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            metrics.symbols = len(result.stdout.strip().split('\n'))
    except:
        pass

    # 3. Function count (T symbols)
    try:
        result = subprocess.run(['nm', str(binary_path)],
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            metrics.functions = result.stdout.count(' T ')
    except:
        pass

    # 4. String count
    try:
        result = subprocess.run(['strings', str(binary_path)],
                              capture_output=True, text=True, timeout=5)
        if result.returncode == 0:
            metrics.strings = len(result.stdout.strip().split('\n'))
    except:
        pass

    # 5. Instruction count
    try:
        result = subprocess.run(['objdump', '-d', str(binary_path)],
                              capture_output=True, text=True, timeout=10)
        if result.returncode == 0:
            import re
            metrics.instructions = len(re.findall(r'^\s*[0-9a-f]+:', result.stdout, re.MULTILINE))
    except:
        pass

    # 6. Entropy
    try:
        with open(binary_path, 'rb') as f:
            data = f.read()
        from collections import Counter
        import math
        freq = Counter(data)
        entropy = -sum((count/len(data)) * math.log2(count/len(data)) for count in freq.values())
        metrics.entropy = round(entropy, 4)
    except:
        pass

    # 7. Jump count
    try:
        result = subprocess.run(['objdump', '-d', str(binary_path)],
                              capture_output=True, text=True, timeout=10)
        if result.returncode == 0:
            import re
            metrics.jumps = len(re.findall(r'\bj[a-z]+\b', result.output))
    except:
        pass

    return metrics


def calculate_obfuscation_score(baseline: BinaryMetrics, current: BinaryMetrics) -> float:
    """
    Calculate weighted obfuscation score comparing current to baseline
    Positive score = improvement over baseline
    """
    score = 0.0

    # Symbol reduction (40% weight)
    if baseline.symbols > 0:
        symbol_reduction = ((baseline.symbols - current.symbols) / baseline.symbols) * 100
        score += symbol_reduction * 0.40

    # Function reduction (30% weight)
    if baseline.functions > 0:
        function_reduction = ((baseline.functions - current.functions) / baseline.functions) * 100
        score += function_reduction * 0.30

    # Size reduction (20% weight)
    if baseline.size > 0:
        size_reduction = ((baseline.size - current.size) / baseline.size) * 100
        score += min(size_reduction, 50) * 0.20 * 2  # Cap at 50% reduction

    # Entropy bonus (10% weight)
    if current.entropy > baseline.entropy:
        entropy_increase = ((current.entropy - baseline.entropy) / baseline.entropy) * 100
        score += min(entropy_increase, 20) * 0.10 * 5  # Cap at 20% increase

    return round(score, 2)


def compile_with_flags(source: Path, output: Path, flags: List[str]) -> bool:
    """Compile source with given flags"""
    try:
        cmd = ['clang'] + flags + [str(source), '-o', str(output)]
        result = subprocess.run(cmd, capture_output=True, text=True, timeout=30)
        return result.returncode == 0 and output.exists()
    except:
        return False


def progressive_optimization(
    source_file: Path,
    output_dir: Path,
    starting_flags: List[str],
    candidate_flags: List[str],
    improvement_threshold: float = 0.1
) -> Dict:
    """
    Progressive optimization that locks in improvements

    Args:
        source_file: Source file to compile
        output_dir: Directory for output binaries
        starting_flags: Proven baseline flags to start with
        candidate_flags: Additional flags to test
        improvement_threshold: Minimum score improvement to lock in a flag
    """

    output_dir.mkdir(parents=True, exist_ok=True)

    # Compile baseline
    baseline_binary = output_dir / "baseline"
    print(f"🔧 Compiling baseline with: {' '.join(starting_flags)}")
    if not compile_with_flags(source_file, baseline_binary, starting_flags):
        print("❌ Failed to compile baseline!")
        return {"error": "baseline compilation failed"}

    baseline_metrics = collect_binary_metrics(baseline_binary)
    print(f"📊 Baseline metrics: {baseline_metrics.symbols} symbols, {baseline_metrics.functions} functions")

    # Track current best
    current_flags = starting_flags.copy()
    current_metrics = baseline_metrics
    current_score = 0.0  # Score relative to baseline

    # Track all results
    results = {
        "starting_flags": starting_flags,
        "baseline_metrics": baseline_metrics.to_dict(),
        "iterations": [],
        "final_flags": current_flags,
        "final_metrics": current_metrics.to_dict(),
        "final_score": current_score,
        "improvements_found": 0
    }

    print(f"\n🚀 Testing {len(candidate_flags)} candidate flags...\n")

    # Test each candidate flag
    for i, flag in enumerate(candidate_flags, 1):
        # Skip if already in current flags
        if flag in current_flags:
            continue

        print(f"[{i}/{len(candidate_flags)}] Testing: {flag}")

        # Compile with current + new flag
        test_flags = current_flags + [flag]
        test_binary = output_dir / f"test_{i}"

        if not compile_with_flags(source_file, test_binary, test_flags):
            print(f"  ⚠️  Compilation failed, skipping")
            results["iterations"].append({
                "iteration": i,
                "flag": flag,
                "status": "compilation_failed"
            })
            continue

        # Collect metrics
        test_metrics = collect_binary_metrics(test_binary)

        # Calculate score improvement over current best
        score = calculate_obfuscation_score(current_metrics, test_metrics)

        iteration_data = {
            "iteration": i,
            "flag": flag,
            "status": "tested",
            "metrics": test_metrics.to_dict(),
            "score": score,
            "symbols": test_metrics.symbols,
            "functions": test_metrics.functions,
            "size": test_metrics.size
        }

        # Check for improvement
        if score >= improvement_threshold:
            print(f"  🔥 IMPROVEMENT! Score: +{score}")
            print(f"     Symbols: {current_metrics.symbols} → {test_metrics.symbols}")
            print(f"     Functions: {current_metrics.functions} → {test_metrics.functions}")
            print(f"     Size: {current_metrics.size} → {test_metrics.size}")
            print(f"  🔒 LOCKING IN FLAG: {flag}\n")

            # Lock in this flag
            current_flags.append(flag)
            current_metrics = test_metrics
            current_score += score
            results["improvements_found"] += 1

            iteration_data["status"] = "locked_in"
            iteration_data["cumulative_score"] = current_score

            # Save best binary
            best_binary = output_dir / f"best_{results['improvements_found']}"
            test_binary.rename(best_binary)
        else:
            if score > 0:
                print(f"  ↗️  Minor improvement: +{score} (below threshold {improvement_threshold})")
            else:
                print(f"  ↘️  No improvement: {score}")

        results["iterations"].append(iteration_data)

        # Clean up test binary if not saved
        if test_binary.exists():
            test_binary.unlink()

    # Update final results
    results["final_flags"] = current_flags
    results["final_metrics"] = current_metrics.to_dict()
    results["final_score"] = current_score

    # Save final binary
    final_binary = output_dir / "final_optimized"
    compile_with_flags(source_file, final_binary, current_flags)

    return results


def main():
    import argparse

    parser = argparse.ArgumentParser(description='Progressive flag optimization')
    parser.add_argument('source', type=Path, help='Source file to compile')
    parser.add_argument('--output-dir', type=Path, default=Path('bin/progressive'),
                       help='Output directory for binaries')
    parser.add_argument('--threshold', type=float, default=0.1,
                       help='Minimum score improvement to lock in flag (default: 0.1)')
    parser.add_argument('--starting-flags', type=str,
                       default='-flto -fvisibility=hidden -O3 -fno-builtin',
                       help='Starting flags (space-separated)')
    parser.add_argument('--exclude-flag', action='append', default=[],
                       help='Flags to exclude from testing')
    parser.add_argument('--category', action='append', default=[],
                       help='Only test flags from these categories')
    parser.add_argument('--priority', action='append', default=[],
                       help='Only test flags with these priorities')

    args = parser.parse_args()

    # Parse starting flags
    starting_flags = args.starting_flags.split()

    # Build candidate flag list
    candidate_flags = []
    for flag_info in ALL_FLAGS:
        flag = flag_info['flag']

        # Skip if in starting flags or excluded
        if flag in starting_flags or flag in args.exclude_flag:
            continue

        # Filter by category if specified
        if args.category and flag_info.get('category') not in args.category:
            continue

        # Filter by priority if specified
        if args.priority and flag_info.get('priority') not in args.priority:
            continue

        candidate_flags.append(flag)

    print("╔════════════════════════════════════════════════════════════════════════╗")
    print("║              PROGRESSIVE FLAG OPTIMIZATION                             ║")
    print("╚════════════════════════════════════════════════════════════════════════╝")
    print(f"\nSource: {args.source}")
    print(f"Starting flags: {' '.join(starting_flags)}")
    print(f"Candidate flags to test: {len(candidate_flags)}")
    print(f"Improvement threshold: {args.threshold}")
    print(f"Output directory: {args.output_dir}\n")

    start_time = time.time()

    # Run progressive optimization
    results = progressive_optimization(
        source_file=args.source,
        output_dir=args.output_dir,
        starting_flags=starting_flags,
        candidate_flags=candidate_flags,
        improvement_threshold=args.threshold
    )

    elapsed = time.time() - start_time

    # Print summary
    print("\n" + "="*76)
    print("PROGRESSIVE OPTIMIZATION COMPLETE")
    print("="*76)
    print(f"Time elapsed: {elapsed:.1f}s")
    print(f"Flags tested: {len(results['iterations'])}")
    print(f"Improvements found: {results['improvements_found']}")
    print(f"Final score: +{results['final_score']}")
    print(f"\nFinal flags ({len(results['final_flags'])} total):")
    print(' '.join(results['final_flags']))

    if results['improvements_found'] > 0:
        print(f"\n🎉 Found {results['improvements_found']} improvement(s)!")
        print("\nLocked-in flags:")
        locked_flags = [f for f in results['final_flags'] if f not in starting_flags]
        for flag in locked_flags:
            print(f"  • {flag}")
    else:
        print("\n✅ No improvements found - starting configuration is optimal!")

    # Save results
    results_file = args.output_dir / "progressive_results.json"
    with open(results_file, 'w') as f:
        json.dump(results, f, indent=2)
    print(f"\nResults saved to: {results_file}")

    # Create summary markdown
    summary_file = args.output_dir / "progressive_summary.md"
    with open(summary_file, 'w') as f:
        f.write("# Progressive Flag Optimization Results\n\n")
        f.write(f"**Source:** `{args.source}`\n")
        f.write(f"**Date:** {time.strftime('%Y-%m-%d %H:%M:%S')}\n")
        f.write(f"**Time elapsed:** {elapsed:.1f}s\n\n")

        f.write("## Starting Configuration\n\n")
        f.write(f"```bash\n{' '.join(starting_flags)}\n```\n\n")
        f.write(f"**Baseline metrics:**\n")
        f.write(f"- Symbols: {results['baseline_metrics']['symbols']}\n")
        f.write(f"- Functions: {results['baseline_metrics']['functions']}\n")
        f.write(f"- Size: {results['baseline_metrics']['size']} bytes\n\n")

        f.write("## Final Configuration\n\n")
        f.write(f"```bash\n{' '.join(results['final_flags'])}\n```\n\n")
        f.write(f"**Final metrics:**\n")
        f.write(f"- Symbols: {results['final_metrics']['symbols']}\n")
        f.write(f"- Functions: {results['final_metrics']['functions']}\n")
        f.write(f"- Size: {results['final_metrics']['size']} bytes\n")
        f.write(f"- **Score improvement:** +{results['final_score']}\n\n")

        if results['improvements_found'] > 0:
            f.write("## Improvements Found\n\n")
            locked_flags = [f for f in results['final_flags'] if f not in starting_flags]
            for flag in locked_flags:
                f.write(f"- `{flag}`\n")
            f.write("\n")

        f.write("## All Iterations\n\n")
        f.write("| # | Flag | Status | Score | Symbols | Functions | Size |\n")
        f.write("|---|------|--------|-------|---------|-----------|------|\n")
        for it in results['iterations']:
            status_emoji = "🔒" if it['status'] == 'locked_in' else "⚠️" if it['status'] == 'compilation_failed' else "·"
            score = f"+{it['score']}" if it.get('score', 0) >= 0 else str(it.get('score', ''))
            f.write(f"| {it['iteration']} | `{it['flag']}` | {status_emoji} {it['status']} | {score} | ")
            f.write(f"{it.get('symbols', '-')} | {it.get('functions', '-')} | {it.get('size', '-')} |\n")

    print(f"Summary saved to: {summary_file}")


if __name__ == "__main__":
    main()
