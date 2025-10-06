#!/usr/bin/env python3
"""
Obfuscation Impact Profiler
Measures performance and security impact of each protection layer
"""

import subprocess
import time
import os
import json
import hashlib
from pathlib import Path
from typing import Dict, List, Tuple
from dataclasses import dataclass, asdict


@dataclass
class PerformanceMetrics:
    """Performance measurement results"""
    execution_time_ms: float
    memory_usage_kb: int
    cpu_cycles: int
    binary_size_bytes: int


@dataclass
class SecurityMetrics:
    """Security measurement results"""
    symbol_count: int
    function_count: int
    string_count: int
    entropy: float
    complexity_score: float
    estimated_analysis_time_hours: float


@dataclass
class LayerImpact:
    """Impact of a protection layer"""
    layer_name: str
    performance_before: PerformanceMetrics
    performance_after: PerformanceMetrics
    security_before: SecurityMetrics
    security_after: SecurityMetrics
    overhead_percent: float
    security_improvement: float


class ObfuscationProfiler:
    """Measure impact of each protection layer"""

    def __init__(self, test_runs: int = 10):
        """
        Initialize profiler

        Args:
            test_runs: Number of test runs for averaging
        """
        self.test_runs = test_runs

    def measure_impact(
        self,
        original_binary: str,
        protected_binary: str,
        test_command: str = None
    ) -> Dict:
        """
        Measure impact of protection

        Args:
            original_binary: Path to original binary
            protected_binary: Path to protected binary
            test_command: Optional test command to run (default: just execute binary)

        Returns:
            Dictionary with comprehensive metrics
        """

        # Measure performance
        perf_original = self._measure_performance(original_binary, test_command)
        perf_protected = self._measure_performance(protected_binary, test_command)

        # Measure security
        sec_original = self._measure_security(original_binary)
        sec_protected = self._measure_security(protected_binary)

        # Calculate impact
        overhead = self._calculate_overhead(perf_original, perf_protected)
        improvement = self._calculate_security_improvement(sec_original, sec_protected)

        return {
            'performance': {
                'original': asdict(perf_original),
                'protected': asdict(perf_protected),
                'overhead_percent': overhead
            },
            'security': {
                'original': asdict(sec_original),
                'protected': asdict(sec_protected),
                'improvement_score': improvement
            },
            'summary': {
                'worth_it': overhead < 10 and improvement > 2.0,
                'overhead_acceptable': overhead < 10,
                'security_gain_significant': improvement > 2.0
            }
        }

    def _measure_performance(self, binary: str, test_command: str = None) -> PerformanceMetrics:
        """Measure performance metrics"""

        if not os.path.exists(binary):
            raise FileNotFoundError(f"Binary not found: {binary}")

        # Measure binary size
        binary_size = os.path.getsize(binary)

        # Measure execution time
        execution_times = []
        for _ in range(self.test_runs):
            start = time.perf_counter()

            if test_command:
                subprocess.run(test_command, shell=True, capture_output=True)
            else:
                subprocess.run([binary], capture_output=True)

            elapsed = (time.perf_counter() - start) * 1000  # Convert to ms
            execution_times.append(elapsed)

        avg_time = sum(execution_times) / len(execution_times)

        # Measure memory usage (using time command)
        try:
            result = subprocess.run(
                f"/usr/bin/time -l {binary} 2>&1",
                shell=True,
                capture_output=True,
                text=True
            )
            # Parse output for memory usage
            memory_kb = self._parse_memory_usage(result.stderr)
        except:
            memory_kb = 0

        # CPU cycles (estimated from execution time)
        cpu_cycles = int(avg_time * 2.4e6)  # Assume 2.4 GHz CPU

        return PerformanceMetrics(
            execution_time_ms=avg_time,
            memory_usage_kb=memory_kb,
            cpu_cycles=cpu_cycles,
            binary_size_bytes=binary_size
        )

    def _parse_memory_usage(self, time_output: str) -> int:
        """Parse memory usage from time command output"""

        # Look for "maximum resident set size"
        import re
        match = re.search(r'(\d+)\s+maximum resident set size', time_output)
        if match:
            return int(match.group(1)) // 1024  # Convert to KB

        return 0

    def _measure_security(self, binary: str) -> SecurityMetrics:
        """Measure security metrics"""

        if not os.path.exists(binary):
            raise FileNotFoundError(f"Binary not found: {binary}")

        # Count symbols
        symbol_count = self._count_symbols(binary)

        # Count functions
        function_count = self._count_functions(binary)

        # Count strings
        string_count = self._count_strings(binary)

        # Calculate entropy
        entropy = self._calculate_entropy(binary)

        # Estimate complexity
        complexity = self._estimate_complexity(binary)

        # Estimate analysis time
        analysis_time = self._estimate_analysis_time(
            symbol_count, function_count, entropy, complexity
        )

        return SecurityMetrics(
            symbol_count=symbol_count,
            function_count=function_count,
            string_count=string_count,
            entropy=entropy,
            complexity_score=complexity,
            estimated_analysis_time_hours=analysis_time
        )

    def _count_symbols(self, binary: str) -> int:
        """Count symbols in binary"""

        try:
            result = subprocess.run(
                ['nm', binary],
                capture_output=True,
                text=True
            )
            return len(result.stdout.strip().split('\n'))
        except:
            return 0

    def _count_functions(self, binary: str) -> int:
        """Count functions in binary"""

        try:
            result = subprocess.run(
                ['nm', '-U', binary],
                capture_output=True,
                text=True
            )
            # Count lines with ' T ' (text/code symbols)
            functions = [line for line in result.stdout.split('\n') if ' T ' in line]
            return len(functions)
        except:
            return 0

    def _count_strings(self, binary: str) -> int:
        """Count strings in binary"""

        try:
            result = subprocess.run(
                ['strings', binary],
                capture_output=True,
                text=True
            )
            # Count strings longer than 4 characters
            strings = [s for s in result.stdout.split('\n') if len(s) > 4]
            return len(strings)
        except:
            return 0

    def _calculate_entropy(self, binary: str) -> float:
        """Calculate Shannon entropy of binary"""

        with open(binary, 'rb') as f:
            data = f.read()

        if not data:
            return 0.0

        # Calculate byte frequency
        frequency = [0] * 256
        for byte in data:
            frequency[byte] += 1

        # Calculate entropy
        import math
        entropy = 0.0
        data_len = len(data)

        for count in frequency:
            if count == 0:
                continue
            p = count / data_len
            entropy -= p * math.log2(p)

        return entropy

    def _estimate_complexity(self, binary: str) -> float:
        """Estimate code complexity"""

        # Simple heuristic based on binary characteristics
        size = os.path.getsize(binary)
        symbol_count = self._count_symbols(binary)
        entropy = self._calculate_entropy(binary)

        # Normalize and combine
        size_score = min(size / 100000, 10)  # Larger = more complex
        symbol_score = max(10 - symbol_count / 10, 1)  # Fewer symbols = more complex
        entropy_score = entropy  # Higher entropy = more complex

        complexity = (size_score + symbol_score + entropy_score) / 3

        return round(complexity, 2)

    def _estimate_analysis_time(
        self,
        symbols: int,
        functions: int,
        entropy: float,
        complexity: float
    ) -> float:
        """Estimate human analysis time in hours"""

        # Base time: 1 hour for simple binary
        base_time = 1.0

        # Fewer symbols = harder (reverse correlation)
        symbol_multiplier = max(20 / max(symbols, 1), 1)

        # More functions = harder (but with diminishing returns)
        function_multiplier = 1 + (functions ** 0.5) / 10

        # Higher entropy = harder
        entropy_multiplier = entropy / 5

        # Higher complexity = harder
        complexity_multiplier = complexity / 5

        total_time = base_time * symbol_multiplier * function_multiplier * entropy_multiplier * complexity_multiplier

        return round(total_time, 2)

    def _calculate_overhead(
        self,
        before: PerformanceMetrics,
        after: PerformanceMetrics
    ) -> float:
        """Calculate performance overhead percentage"""

        if before.execution_time_ms == 0:
            return 0.0

        overhead = ((after.execution_time_ms - before.execution_time_ms) /
                    before.execution_time_ms * 100)

        return round(overhead, 2)

    def _calculate_security_improvement(
        self,
        before: SecurityMetrics,
        after: SecurityMetrics
    ) -> float:
        """Calculate security improvement score"""

        # Lower is better for symbols/functions/strings
        symbol_improvement = before.symbol_count / max(after.symbol_count, 1)
        function_improvement = before.function_count / max(after.function_count, 1)

        # Higher is better for entropy/complexity
        entropy_improvement = after.entropy / max(before.entropy, 1)
        complexity_improvement = after.complexity_score / max(before.complexity_score, 1)

        # Analysis time ratio
        time_improvement = after.estimated_analysis_time_hours / max(before.estimated_analysis_time_hours, 0.1)

        # Weighted average
        score = (
            symbol_improvement * 0.25 +
            function_improvement * 0.20 +
            entropy_improvement * 0.15 +
            complexity_improvement * 0.20 +
            time_improvement * 0.20
        )

        return round(score, 2)

    def generate_report(self, measurements: List[LayerImpact], output_file: str):
        """Generate comprehensive report"""

        report = {
            'measurements': [asdict(m) for m in measurements],
            'summary': {
                'total_layers': len(measurements),
                'total_overhead': sum(m.overhead_percent for m in measurements),
                'total_security_gain': sum(m.security_improvement for m in measurements),
                'recommended_layers': [
                    m.layer_name for m in measurements
                    if m.overhead_percent < 10 and m.security_improvement > 1.5
                ]
            }
        }

        with open(output_file, 'w') as f:
            json.dump(report, f, indent=2)

        print(f"✓ Report generated: {output_file}")


def main():
    """CLI interface for profiling"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Profile obfuscation impact'
    )
    parser.add_argument('original', help='Original binary')
    parser.add_argument('protected', help='Protected binary')
    parser.add_argument(
        '--test-command',
        help='Test command to run'
    )
    parser.add_argument(
        '--runs',
        type=int,
        default=10,
        help='Number of test runs (default: 10)'
    )
    parser.add_argument(
        '--output',
        help='Output file for report (JSON)'
    )

    args = parser.parse_args()

    # Profile
    profiler = ObfuscationProfiler(test_runs=args.runs)
    results = profiler.measure_impact(
        args.original,
        args.protected,
        args.test_command
    )

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            json.dump(results, f, indent=2)
        print(f"✓ Results written to {args.output}")
    else:
        print(json.dumps(results, indent=2))


if __name__ == '__main__':
    main()
