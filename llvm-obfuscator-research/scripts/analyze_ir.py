#!/usr/bin/env python3
"""
LLVM IR Analysis Script
Analyzes LLVM IR to understand optimization passes and complexity
"""

import subprocess
import os
import re
import json
import csv
from pathlib import Path
from collections import Counter
from datetime import datetime

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
SRC_DIR = PROJECT_ROOT / "src"
IR_DIR = PROJECT_ROOT / "ir"
ANALYSIS_DIR = PROJECT_ROOT / "analysis"

# Ensure directories exist
IR_DIR.mkdir(exist_ok=True)
ANALYSIS_DIR.mkdir(exist_ok=True)

# Test programs
TEST_PROGRAMS = [
    "factorial_recursive.c",
    "factorial_iterative.c",
    "factorial_lookup.c"
]

# Optimization levels to test
OPT_LEVELS = ["0", "1", "2", "3"]


def run_command(cmd, capture_output=True):
    """Execute shell command and return result"""
    try:
        if capture_output:
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
            return result.returncode, result.stdout, result.stderr
        else:
            result = subprocess.run(cmd, shell=True, timeout=30)
            return result.returncode, "", ""
    except subprocess.TimeoutExpired:
        return -1, "", "Timeout"
    except Exception as e:
        return -1, "", str(e)


def generate_llvm_ir(source_file, output_file, opt_level=None):
    """Generate LLVM IR from C source"""
    opt_flag = f"-O{opt_level}" if opt_level else ""
    cmd = f"clang -S -emit-llvm {opt_flag} {source_file} -o {output_file}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0, stderr


def optimize_ir(input_ir, output_ir, opt_level):
    """Run opt on IR file"""
    cmd = f"opt -O{opt_level} -S {input_ir} -o {output_ir}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0, stderr


def get_optimization_passes(ir_file, opt_level):
    """Get list of optimization passes applied"""
    # Note: -print-after-all can be very verbose, so we'll use a simpler approach
    cmd = f"opt -O{opt_level} -debug-pass=Arguments {ir_file} -o /dev/null 2>&1"
    returncode, stdout, stderr = run_command(cmd)

    passes = []
    # Parse the output to extract pass names
    combined_output = stdout + stderr
    for line in combined_output.split('\n'):
        if 'Pass Arguments:' in line:
            # Extract pass names
            pass_line = line.split('Pass Arguments:')[1] if 'Pass Arguments:' in line else ""
            passes = [p.strip() for p in pass_line.split() if p.strip().startswith('-')]

    return passes


def count_ir_instructions(ir_file):
    """Count different types of IR instructions"""
    if not os.path.exists(ir_file):
        return {}

    with open(ir_file, 'r') as f:
        content = f.read()

    instruction_types = Counter()

    # Common LLVM IR instruction patterns
    patterns = {
        'alloca': r'\balloca\b',
        'store': r'\bstore\b',
        'load': r'\bload\b',
        'call': r'\bcall\b',
        'ret': r'\bret\b',
        'br': r'\bbr\b',
        'add': r'\badd\b',
        'sub': r'\bsub\b',
        'mul': r'\bmul\b',
        'div': r'\b[us]div\b',
        'icmp': r'\bicmp\b',
        'phi': r'\bphi\b',
        'getelementptr': r'\bgetelementptr\b',
        'bitcast': r'\bbitcast\b',
        'zext': r'\bzext\b',
        'sext': r'\bsext\b',
        'trunc': r'\btrunc\b'
    }

    for inst_type, pattern in patterns.items():
        count = len(re.findall(pattern, content))
        instruction_types[inst_type] = count

    return dict(instruction_types)


def count_functions(ir_file):
    """Count functions in IR"""
    if not os.path.exists(ir_file):
        return 0

    with open(ir_file, 'r') as f:
        content = f.read()

    # Count function definitions
    return len(re.findall(r'^define\s+', content, re.MULTILINE))


def count_basic_blocks(ir_file):
    """Count basic blocks in IR"""
    if not os.path.exists(ir_file):
        return 0

    with open(ir_file, 'r') as f:
        content = f.read()

    # Basic blocks typically start with a label (ends with :)
    # But we need to be inside a function definition
    in_function = False
    bb_count = 0

    for line in content.split('\n'):
        line = line.strip()
        if line.startswith('define '):
            in_function = True
        elif in_function and line == '}':
            in_function = False
        elif in_function and line.endswith(':') and not line.startswith(';'):
            bb_count += 1

    return bb_count


def get_ir_file_size(ir_file):
    """Get size of IR file"""
    if not os.path.exists(ir_file):
        return 0
    return os.path.getsize(ir_file)


def count_ir_lines(ir_file):
    """Count non-empty, non-comment lines in IR"""
    if not os.path.exists(ir_file):
        return 0

    with open(ir_file, 'r') as f:
        lines = f.readlines()

    count = 0
    for line in lines:
        stripped = line.strip()
        if stripped and not stripped.startswith(';'):
            count += 1

    return count


def calculate_ir_complexity(ir_metrics):
    """Calculate a complexity score for IR"""
    # Weighted sum of various metrics
    complexity = 0

    complexity += ir_metrics.get('function_count', 0) * 10
    complexity += ir_metrics.get('basic_block_count', 0) * 5
    complexity += ir_metrics.get('instruction_count', 0)

    # Certain instructions indicate complexity
    instructions = ir_metrics.get('instructions', {})
    complexity += instructions.get('phi', 0) * 3  # PHI nodes indicate control flow merging
    complexity += instructions.get('br', 0) * 2   # Branches
    complexity += instructions.get('call', 0) * 2  # Function calls

    return complexity


def analyze_ir_file(ir_file, opt_level, source_name):
    """Analyze a single IR file and return metrics"""
    metrics = {
        'source': source_name,
        'opt_level': opt_level,
        'file_size': get_ir_file_size(ir_file),
        'line_count': count_ir_lines(ir_file),
        'function_count': count_functions(ir_file),
        'basic_block_count': count_basic_blocks(ir_file),
    }

    # Count instructions
    instructions = count_ir_instructions(ir_file)
    metrics['instructions'] = instructions
    metrics['instruction_count'] = sum(instructions.values())

    # Get optimization passes
    if os.path.exists(ir_file):
        passes = get_optimization_passes(ir_file, opt_level)
        metrics['passes'] = passes
        metrics['pass_count'] = len(passes)
    else:
        metrics['passes'] = []
        metrics['pass_count'] = 0

    # Calculate complexity
    metrics['complexity'] = calculate_ir_complexity(metrics)

    return metrics


def compare_ir_files(base_ir, opt_ir):
    """Compare two IR files and show differences"""
    if not os.path.exists(base_ir) or not os.path.exists(opt_ir):
        return {}

    base_metrics = {
        'functions': count_functions(base_ir),
        'basic_blocks': count_basic_blocks(base_ir),
        'instructions': count_ir_instructions(base_ir),
        'lines': count_ir_lines(base_ir)
    }

    opt_metrics = {
        'functions': count_functions(opt_ir),
        'basic_blocks': count_basic_blocks(opt_ir),
        'instructions': count_ir_instructions(opt_ir),
        'lines': count_ir_lines(opt_ir)
    }

    diff = {
        'function_reduction': base_metrics['functions'] - opt_metrics['functions'],
        'basic_block_reduction': base_metrics['basic_blocks'] - opt_metrics['basic_blocks'],
        'line_reduction': base_metrics['lines'] - opt_metrics['lines'],
        'instruction_reduction': sum(base_metrics['instructions'].values()) - sum(opt_metrics['instructions'].values())
    }

    return diff


def main():
    """Main execution function"""
    print("LLVM IR Analysis")
    print("=" * 60)
    print(f"Analyzing {len(TEST_PROGRAMS)} programs at {len(OPT_LEVELS)} optimization levels")
    print()

    all_results = []

    for i, program in enumerate(TEST_PROGRAMS):
        print(f"\n[{i+1}/{len(TEST_PROGRAMS)}] Processing {program}")
        source_file = SRC_DIR / program
        base_name = program.replace('.c', '')

        # Generate baseline IR (no optimization)
        print("  Generating baseline IR...")
        base_ir = IR_DIR / f"{base_name}.ll"
        success, error = generate_llvm_ir(str(source_file), str(base_ir))

        if not success:
            print(f"  ✗ Failed to generate IR: {error}")
            continue

        # Analyze baseline
        print("  Analyzing baseline IR...")
        base_metrics = analyze_ir_file(str(base_ir), "0", program)
        all_results.append(base_metrics)

        # Generate and analyze optimized versions
        for opt_level in OPT_LEVELS:
            if opt_level == "0":
                continue  # Already did baseline

            print(f"  Generating O{opt_level} IR...")
            opt_ir = IR_DIR / f"{base_name}_opt{opt_level}.ll"

            # Generate IR with optimization
            success, error = generate_llvm_ir(str(source_file), str(opt_ir), opt_level)

            if not success:
                print(f"  ✗ Failed to generate O{opt_level} IR: {error}")
                continue

            # Analyze optimized IR
            print(f"  Analyzing O{opt_level} IR...")
            opt_metrics = analyze_ir_file(str(opt_ir), opt_level, program)
            all_results.append(opt_metrics)

            # Compare with baseline
            diff = compare_ir_files(str(base_ir), str(opt_ir))
            print(f"    Functions: {base_metrics['function_count']} → {opt_metrics['function_count']} (Δ {diff.get('function_reduction', 0)})")
            print(f"    Basic blocks: {base_metrics['basic_block_count']} → {opt_metrics['basic_block_count']} (Δ {diff.get('basic_block_reduction', 0)})")
            print(f"    Instructions: {base_metrics['instruction_count']} → {opt_metrics['instruction_count']} (Δ {diff.get('instruction_reduction', 0)})")

    # Write results to JSON
    print("\n\nWriting results...")
    json_path = ANALYSIS_DIR / f"ir_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"

    # Prepare data for JSON (convert Counter objects to dicts)
    json_results = []
    for result in all_results:
        json_result = result.copy()
        if 'instructions' in json_result:
            json_result['instructions'] = dict(json_result['instructions'])
        json_results.append(json_result)

    with open(json_path, 'w') as f:
        json.dump(json_results, f, indent=2)

    print(f"JSON results written to: {json_path}")

    # Write summary CSV
    csv_path = ANALYSIS_DIR / f"ir_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.csv"

    fieldnames = [
        'source', 'opt_level', 'file_size', 'line_count',
        'function_count', 'basic_block_count', 'instruction_count',
        'pass_count', 'complexity'
    ]

    with open(csv_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for result in all_results:
            row = {k: result.get(k, 0) for k in fieldnames}
            writer.writerow(row)

    print(f"CSV results written to: {csv_path}")

    # Print summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)

    for program in TEST_PROGRAMS:
        print(f"\n{program}:")
        program_results = [r for r in all_results if r['source'] == program]

        if program_results:
            # Find baseline
            baseline = next((r for r in program_results if r['opt_level'] == '0'), None)
            if baseline:
                print(f"  Baseline: {baseline['function_count']} functions, {baseline['instruction_count']} instructions")

                for result in program_results:
                    if result['opt_level'] != '0':
                        func_reduction = baseline['function_count'] - result['function_count']
                        inst_reduction = baseline['instruction_count'] - result['instruction_count']
                        print(f"  O{result['opt_level']}: {result['function_count']} functions ({func_reduction:+d}), "
                              f"{result['instruction_count']} instructions ({inst_reduction:+d})")

    print("\n✓ IR analysis complete!")


if __name__ == "__main__":
    main()
