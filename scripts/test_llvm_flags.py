#!/usr/bin/env python3
"""
LLVM Flag Testing Script
Tests different compilation flags and measures obfuscation effectiveness
"""

import subprocess
import os
import json
import csv
from pathlib import Path
from datetime import datetime

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
SRC_DIR = PROJECT_ROOT / "src"
BIN_DIR = PROJECT_ROOT / "bin"
ANALYSIS_DIR = PROJECT_ROOT / "analysis"

# Ensure directories exist
BIN_DIR.mkdir(exist_ok=True)
ANALYSIS_DIR.mkdir(exist_ok=True)

# Test programs
TEST_PROGRAMS = [
    "factorial_recursive.c",
    "factorial_iterative.c",
    "factorial_lookup.c"
]

# Flag combinations to test
FLAG_COMBINATIONS = [
    {
        "name": "baseline_O0",
        "flags": ["-O0"],
        "description": "No optimization baseline"
    },
    {
        "name": "opt_O1",
        "flags": ["-O1"],
        "description": "Basic optimization"
    },
    {
        "name": "opt_O2",
        "flags": ["-O2"],
        "description": "Moderate optimization"
    },
    {
        "name": "opt_O3",
        "flags": ["-O3"],
        "description": "Aggressive optimization"
    },
    {
        "name": "size_Os",
        "flags": ["-Os"],
        "description": "Optimize for size"
    },
    {
        "name": "size_Oz",
        "flags": ["-Oz"],
        "description": "Aggressively optimize for size"
    },
    {
        "name": "obf_basic",
        "flags": ["-O3", "-fno-asynchronous-unwind-tables", "-fno-ident"],
        "description": "Basic obfuscation - remove debug info"
    },
    {
        "name": "obf_frame_omit",
        "flags": ["-O3", "-fomit-frame-pointer", "-fno-asynchronous-unwind-tables"],
        "description": "Omit frame pointer"
    },
    {
        "name": "obf_aggressive",
        "flags": ["-O3", "-fno-asynchronous-unwind-tables", "-fno-ident",
                  "-fomit-frame-pointer", "-ffast-math"],
        "description": "Aggressive obfuscation"
    },
    {
        "name": "obf_inline",
        "flags": ["-O3", "-finline-functions", "-finline-limit=1000"],
        "description": "Aggressive inlining"
    },
    {
        "name": "obf_unroll",
        "flags": ["-O3", "-funroll-loops", "-fno-asynchronous-unwind-tables"],
        "description": "Loop unrolling"
    },
    {
        "name": "obf_combined",
        "flags": ["-O3", "-ffast-math", "-funroll-loops", "-finline-functions",
                  "-fomit-frame-pointer", "-fno-asynchronous-unwind-tables", "-fno-ident"],
        "description": "Combined obfuscation techniques"
    },
    {
        "name": "obf_lto",
        "flags": ["-O3", "-flto", "-fno-asynchronous-unwind-tables"],
        "description": "Link-time optimization"
    },
    {
        "name": "obf_visibility",
        "flags": ["-O3", "-fvisibility=hidden", "-fno-asynchronous-unwind-tables"],
        "description": "Hidden symbol visibility"
    },
    {
        "name": "obf_pic",
        "flags": ["-O3", "-fPIC", "-fno-asynchronous-unwind-tables"],
        "description": "Position independent code"
    }
]


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


def compile_program(source_file, output_file, flags):
    """Compile a C program with specified flags"""
    flags_str = " ".join(flags)
    cmd = f"clang {flags_str} {source_file} -o {output_file}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0, stderr


def get_binary_size(binary_path):
    """Get size of compiled binary in bytes"""
    try:
        return os.path.getsize(binary_path)
    except:
        return 0


def count_strings(binary_path):
    """Count visible strings in binary"""
    cmd = f"strings {binary_path} | wc -l"
    returncode, stdout, stderr = run_command(cmd)
    if returncode == 0:
        try:
            return int(stdout.strip())
        except:
            return 0
    return 0


def check_specific_strings(binary_path, search_strings):
    """Check if specific strings are visible in binary"""
    cmd = f"strings {binary_path}"
    returncode, stdout, stderr = run_command(cmd)
    if returncode != 0:
        return []

    found = []
    for search_str in search_strings:
        if search_str in stdout:
            found.append(search_str)
    return found


def count_symbols(binary_path):
    """Count symbols in binary"""
    cmd = f"nm {binary_path} 2>/dev/null | wc -l"
    returncode, stdout, stderr = run_command(cmd)
    if returncode == 0:
        try:
            return int(stdout.strip())
        except:
            return 0
    return 0


def count_functions(binary_path):
    """Count functions in binary using nm"""
    cmd = f"nm {binary_path} 2>/dev/null | grep ' T ' | wc -l"
    returncode, stdout, stderr = run_command(cmd)
    if returncode == 0:
        try:
            return int(stdout.strip())
        except:
            return 0
    return 0


def count_instructions(binary_path):
    """Count assembly instructions"""
    cmd = f"objdump -d {binary_path} 2>/dev/null | grep -c '^\s*[0-9a-f].*:'"
    returncode, stdout, stderr = run_command(cmd)
    if returncode == 0:
        try:
            return int(stdout.strip())
        except:
            return 0
    return 0


def test_binary_functional(binary_path):
    """Test if binary produces correct output"""
    test_values = [1, 5, 10]
    expected = {
        1: "1",
        5: "120",
        10: "3628800"
    }

    for val in test_values:
        cmd = f"{binary_path} {val}"
        returncode, stdout, stderr = run_command(cmd)
        if returncode != 0:
            return False, f"Failed on input {val}"
        if str(expected[val]) not in stdout:
            return False, f"Incorrect output for {val}"

    return True, "All tests passed"


def strip_binary(binary_path, output_path):
    """Strip symbols from binary"""
    cmd = f"strip --strip-all {binary_path} -o {output_path} 2>/dev/null || strip {binary_path} -o {output_path}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0


def calculate_obfuscation_score(metrics, baseline_metrics):
    """
    Calculate obfuscation score based on various metrics
    Higher score = better obfuscation
    """
    score = 0

    # Size increase is somewhat bad (weight: -10)
    if baseline_metrics['size'] > 0:
        size_ratio = metrics['size'] / baseline_metrics['size']
        score -= (size_ratio - 1) * 10

    # Fewer visible strings is good (weight: +30)
    if baseline_metrics['string_count'] > 0:
        string_ratio = metrics['string_count'] / baseline_metrics['string_count']
        score += (1 - string_ratio) * 30

    # Fewer symbols is good (weight: +25)
    if baseline_metrics['symbol_count'] > 0:
        symbol_ratio = metrics['symbol_count'] / baseline_metrics['symbol_count']
        score += (1 - symbol_ratio) * 25

    # Fewer functions is good (weight: +20)
    if baseline_metrics['function_count'] > 0:
        func_ratio = metrics['function_count'] / baseline_metrics['function_count']
        score += (1 - func_ratio) * 20

    # More instructions can indicate obfuscation (weight: +15)
    if baseline_metrics['instruction_count'] > 0:
        inst_ratio = metrics['instruction_count'] / baseline_metrics['instruction_count']
        score += (inst_ratio - 1) * 15

    # Specific strings not visible is very good (weight: +10)
    score += (baseline_metrics['specific_strings_found'] - metrics['specific_strings_found']) * 10

    return round(score, 2)


def analyze_program(source_name, flag_config, baseline_metrics=None):
    """Compile and analyze a program with specific flags"""
    source_file = SRC_DIR / source_name
    base_name = source_name.replace('.c', '')
    binary_name = f"{base_name}_{flag_config['name']}"
    binary_path = BIN_DIR / binary_name

    # Compile
    success, error = compile_program(str(source_file), str(binary_path), flag_config['flags'])

    if not success:
        return {
            'source': source_name,
            'config': flag_config['name'],
            'success': False,
            'error': error
        }

    # Gather metrics
    metrics = {
        'source': source_name,
        'config': flag_config['name'],
        'description': flag_config['description'],
        'flags': ' '.join(flag_config['flags']),
        'success': True,
        'size': get_binary_size(str(binary_path)),
        'string_count': count_strings(str(binary_path)),
        'symbol_count': count_symbols(str(binary_path)),
        'function_count': count_functions(str(binary_path)),
        'instruction_count': count_instructions(str(binary_path))
    }

    # Check for specific strings
    search_strings = ["Factorial Calculator", "Version", "Author", "Research Team"]
    found_strings = check_specific_strings(str(binary_path), search_strings)
    metrics['specific_strings_found'] = len(found_strings)
    metrics['found_strings'] = ','.join(found_strings)

    # Test functionality
    functional, msg = test_binary_functional(str(binary_path))
    metrics['functional'] = functional
    metrics['functional_msg'] = msg

    # Calculate obfuscation score
    if baseline_metrics:
        metrics['obfuscation_score'] = calculate_obfuscation_score(metrics, baseline_metrics)
    else:
        metrics['obfuscation_score'] = 0.0

    # Create stripped version
    stripped_path = BIN_DIR / f"{binary_name}_stripped"
    if strip_binary(str(binary_path), str(stripped_path)):
        metrics['stripped_size'] = get_binary_size(str(stripped_path))
        metrics['stripped_symbol_count'] = count_symbols(str(stripped_path))
    else:
        metrics['stripped_size'] = 0
        metrics['stripped_symbol_count'] = 0

    return metrics


def main():
    """Main execution function"""
    print("LLVM Obfuscation Flag Testing")
    print("=" * 60)
    print(f"Testing {len(TEST_PROGRAMS)} programs with {len(FLAG_COMBINATIONS)} flag combinations")
    print()

    all_results = []
    baseline_metrics_map = {}

    # First pass: get baseline metrics
    print("Phase 1: Establishing baselines...")
    for program in TEST_PROGRAMS:
        baseline_config = FLAG_COMBINATIONS[0]  # O0 is baseline
        print(f"  Baseline for {program}...")
        baseline_metrics = analyze_program(program, baseline_config)
        baseline_metrics_map[program] = baseline_metrics
        all_results.append(baseline_metrics)

    print("\nPhase 2: Testing optimization flags...")
    # Second pass: test all other configurations
    for i, program in enumerate(TEST_PROGRAMS):
        print(f"\n[{i+1}/{len(TEST_PROGRAMS)}] Testing {program}")
        baseline = baseline_metrics_map[program]

        for j, flag_config in enumerate(FLAG_COMBINATIONS[1:], 1):
            print(f"  [{j}/{len(FLAG_COMBINATIONS)-1}] {flag_config['name']}...", end=" ")
            result = analyze_program(program, flag_config, baseline)

            if result['success']:
                print(f"✓ (score: {result['obfuscation_score']})")
            else:
                print("✗ FAILED")

            all_results.append(result)

    # Write results to CSV
    print("\n\nWriting results to CSV...")
    csv_path = ANALYSIS_DIR / f"flag_test_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.csv"

    fieldnames = [
        'source', 'config', 'description', 'flags', 'success',
        'size', 'stripped_size', 'string_count', 'specific_strings_found', 'found_strings',
        'symbol_count', 'stripped_symbol_count', 'function_count',
        'instruction_count', 'obfuscation_score', 'functional', 'functional_msg'
    ]

    with open(csv_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(all_results)

    print(f"Results written to: {csv_path}")

    # Write JSON for easier processing
    json_path = ANALYSIS_DIR / f"flag_test_results_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"
    with open(json_path, 'w') as f:
        json.dump(all_results, f, indent=2)

    print(f"JSON results written to: {json_path}")

    # Print summary
    print("\n" + "=" * 60)
    print("SUMMARY")
    print("=" * 60)

    for program in TEST_PROGRAMS:
        print(f"\n{program}:")
        program_results = [r for r in all_results if r['source'] == program and r['success']]
        if program_results:
            sorted_results = sorted(program_results, key=lambda x: x['obfuscation_score'], reverse=True)
            print(f"  Top 3 obfuscation configurations:")
            for i, result in enumerate(sorted_results[:3], 1):
                print(f"    {i}. {result['config']}: score={result['obfuscation_score']}")

    print("\n✓ Testing complete!")


if __name__ == "__main__":
    main()
