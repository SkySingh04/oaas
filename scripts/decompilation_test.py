#!/usr/bin/env python3
"""
Decompilation Analysis Script
Analyzes binaries to assess how difficult they are to reverse engineer
"""

import subprocess
import os
import re
import json
import csv
from pathlib import Path
from datetime import datetime
from collections import Counter

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
BIN_DIR = PROJECT_ROOT / "bin"
ASM_DIR = PROJECT_ROOT / "asm"
ANALYSIS_DIR = PROJECT_ROOT / "analysis"

# Ensure directories exist
ASM_DIR.mkdir(exist_ok=True)
ANALYSIS_DIR.mkdir(exist_ok=True)


def run_command(cmd, capture_output=True):
    """Execute shell command and return result"""
    try:
        if capture_output:
            result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=60)
            return result.returncode, result.stdout, result.stderr
        else:
            result = subprocess.run(cmd, shell=True, timeout=60)
            return result.returncode, "", ""
    except subprocess.TimeoutExpired:
        return -1, "", "Timeout"
    except Exception as e:
        return -1, "", str(e)


def disassemble_binary(binary_path, output_file):
    """Disassemble binary using objdump"""
    cmd = f"objdump -d {binary_path} > {output_file}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0


def get_assembly_stats(asm_file):
    """Extract statistics from disassembly"""
    if not os.path.exists(asm_file):
        return {}

    with open(asm_file, 'r') as f:
        content = f.read()

    stats = {}

    # Count total instructions
    instruction_pattern = r'^\s*[0-9a-f]+:\s+[0-9a-f\s]+\s+([a-z]+)'
    instructions = re.findall(instruction_pattern, content, re.MULTILINE | re.IGNORECASE)
    stats['total_instructions'] = len(instructions)

    # Count unique instruction types
    instruction_types = Counter(instructions)
    stats['unique_instructions'] = len(instruction_types)
    stats['instruction_distribution'] = dict(instruction_types.most_common(10))

    # Count functions (look for function boundaries)
    function_pattern = r'^[0-9a-f]+ <(.+)>:'
    functions = re.findall(function_pattern, content, re.MULTILINE)
    stats['function_count'] = len(functions)
    stats['function_names'] = functions

    # Count basic blocks (approximate - count jump targets)
    jump_instructions = ['jmp', 'je', 'jne', 'jz', 'jnz', 'jg', 'jge', 'jl', 'jle', 'ja', 'jb', 'call', 'ret']
    jump_count = sum(1 for inst in instructions if inst in jump_instructions)
    stats['control_flow_instructions'] = jump_count

    # Count call instructions (function calls)
    call_count = sum(1 for inst in instructions if inst == 'call')
    stats['call_instructions'] = call_count

    # Look for crypto/obfuscation patterns
    crypto_instructions = ['xor', 'rol', 'ror', 'bswap']
    crypto_count = sum(instruction_types.get(inst, 0) for inst in crypto_instructions)
    stats['crypto_like_instructions'] = crypto_count

    return stats


def calculate_cyclomatic_complexity(asm_file):
    """
    Estimate cyclomatic complexity from assembly
    Simplified: V(G) = E - N + 2P where E=edges, N=nodes, P=connected components
    Approximation: count conditional branches + 1
    """
    if not os.path.exists(asm_file):
        return 0

    with open(asm_file, 'r') as f:
        content = f.read()

    # Count conditional branch instructions
    branch_pattern = r'^\s*[0-9a-f]+:\s+[0-9a-f\s]+(j[a-z]+|call|ret)'
    branches = re.findall(branch_pattern, content, re.MULTILINE | re.IGNORECASE)

    # Filter out unconditional jumps and rets for better approximation
    conditional_branches = [b for b in branches if b not in ['jmp', 'ret', 'call']]

    return len(conditional_branches) + 1


def assess_readability(asm_file, binary_path):
    """
    Assess how readable/reverse-engineerable the binary is
    Returns a score where higher = harder to reverse
    """
    if not os.path.exists(asm_file):
        return 0

    score = 0

    # Get assembly stats
    stats = get_assembly_stats(asm_file)

    # Check for symbol information
    cmd = f"nm {binary_path} 2>/dev/null"
    returncode, stdout, stderr = run_command(cmd)

    if returncode == 0:
        # Count readable symbols
        readable_symbols = [line for line in stdout.split('\n') if line and ' T ' in line]
        mangled_symbols = [s for s in readable_symbols if '_Z' in s or s.startswith('__')]

        # More readable symbols = easier to reverse (negative score)
        score -= len(readable_symbols) * 2
        # Mangled symbols are slightly better
        score += len(mangled_symbols) * 0.5

    # Check function names in assembly
    function_names = stats.get('function_names', [])
    meaningful_names = [f for f in function_names if not (f.startswith('_') or '@' in f or '.' in f)]

    # Meaningful function names make it easier to understand (negative score)
    score -= len(meaningful_names) * 3

    # More unique instructions = more complex (positive score)
    score += stats.get('unique_instructions', 0) * 0.5

    # Higher complexity = harder to understand (positive score)
    complexity = calculate_cyclomatic_complexity(asm_file)
    score += complexity * 0.3

    # Crypto-like instructions suggest obfuscation (positive score)
    score += stats.get('crypto_like_instructions', 0) * 2

    # Check for visible strings
    cmd = f"strings {binary_path} | wc -l"
    returncode, stdout, stderr = run_command(cmd)
    if returncode == 0:
        string_count = int(stdout.strip())
        # More visible strings = easier to understand (negative score)
        score -= string_count * 0.1

    return round(score, 2)


def extract_strings(binary_path):
    """Extract strings from binary"""
    cmd = f"strings {binary_path}"
    returncode, stdout, stderr = run_command(cmd)

    if returncode == 0:
        strings = [s.strip() for s in stdout.split('\n') if s.strip()]
        return strings
    return []


def check_security_features(binary_path):
    """Check for security/obfuscation features in binary"""
    features = {}

    # Check for PIE (Position Independent Executable)
    cmd = f"otool -hv {binary_path} 2>/dev/null | grep PIE"
    returncode, stdout, stderr = run_command(cmd)
    features['pie'] = returncode == 0 and 'PIE' in stdout

    # Check for stack canaries (look for __stack_chk symbols)
    cmd = f"nm {binary_path} 2>/dev/null | grep stack_chk"
    returncode, stdout, stderr = run_command(cmd)
    features['stack_canary'] = returncode == 0 and stdout.strip() != ''

    # Check if stripped
    cmd = f"nm {binary_path} 2>&1"
    returncode, stdout, stderr = run_command(cmd)
    features['stripped'] = 'no symbols' in stdout.lower() or 'no name list' in stdout.lower()

    # Get file type info
    cmd = f"file {binary_path}"
    returncode, stdout, stderr = run_command(cmd)
    features['file_info'] = stdout.strip() if returncode == 0 else ""

    return features


def analyze_binary(binary_path):
    """Comprehensive analysis of a single binary"""
    if not os.path.exists(binary_path):
        return None

    binary_name = os.path.basename(binary_path)
    asm_file = ASM_DIR / f"{binary_name}.asm"

    # Disassemble
    if not disassemble_binary(str(binary_path), str(asm_file)):
        print(f"  Warning: Failed to disassemble {binary_name}")
        return None

    # Collect metrics
    metrics = {
        'binary': binary_name,
        'binary_size': os.path.getsize(binary_path),
    }

    # Assembly statistics
    asm_stats = get_assembly_stats(str(asm_file))
    metrics.update(asm_stats)

    # Complexity
    metrics['cyclomatic_complexity'] = calculate_cyclomatic_complexity(str(asm_file))

    # Readability score
    metrics['readability_score'] = assess_readability(str(asm_file), str(binary_path))

    # Security features
    security = check_security_features(str(binary_path))
    metrics['security_features'] = security

    # String analysis
    strings = extract_strings(str(binary_path))
    metrics['string_count'] = len(strings)

    # Look for specific revealing strings
    revealing_strings = ['factorial', 'recursive', 'iterative', 'lookup',
                         'Factorial Calculator', 'Version', 'Author']
    found_revealing = [s for s in strings if any(r.lower() in s.lower() for r in revealing_strings)]
    metrics['revealing_strings_count'] = len(found_revealing)
    metrics['revealing_strings'] = found_revealing[:10]  # Limit to first 10

    return metrics


def main():
    """Main execution function"""
    print("Decompilation Analysis")
    print("=" * 60)

    # Find all binaries
    if not BIN_DIR.exists():
        print(f"Error: Binary directory {BIN_DIR} does not exist")
        print("Run test_llvm_flags.py first to generate binaries")
        return

    binaries = list(BIN_DIR.glob("*"))
    binaries = [b for b in binaries if b.is_file() and os.access(b, os.X_OK)]

    if not binaries:
        print(f"No binaries found in {BIN_DIR}")
        print("Run test_llvm_flags.py first to generate binaries")
        return

    print(f"Found {len(binaries)} binaries to analyze\n")

    all_results = []

    for i, binary_path in enumerate(binaries, 1):
        print(f"[{i}/{len(binaries)}] Analyzing {binary_path.name}...")
        result = analyze_binary(str(binary_path))

        if result:
            all_results.append(result)
            print(f"  Size: {result['binary_size']} bytes")
            print(f"  Instructions: {result.get('total_instructions', 0)}")
            print(f"  Functions: {result.get('function_count', 0)}")
            print(f"  Complexity: {result.get('cyclomatic_complexity', 0)}")
            print(f"  Readability score: {result.get('readability_score', 0)}")

    if not all_results:
        print("\nNo binaries successfully analyzed")
        return

    # Write detailed JSON results
    print(f"\n\nWriting results...")
    json_path = ANALYSIS_DIR / f"decompilation_analysis_{datetime.now().strftime('%Y%m%d_%H%M%S')}.json"

    # Prepare for JSON serialization
    json_results = []
    for result in all_results:
        json_result = result.copy()
        # Convert any non-serializable objects
        if 'instruction_distribution' in json_result:
            json_result['instruction_distribution'] = dict(json_result['instruction_distribution'])
        json_results.append(json_result)

    with open(json_path, 'w') as f:
        json.dump(json_results, f, indent=2)

    print(f"Detailed results written to: {json_path}")

    # Write summary CSV
    csv_path = ANALYSIS_DIR / f"decompilation_summary_{datetime.now().strftime('%Y%m%d_%H%M%S')}.csv"

    fieldnames = [
        'binary', 'binary_size', 'total_instructions', 'unique_instructions',
        'function_count', 'control_flow_instructions', 'call_instructions',
        'cyclomatic_complexity', 'readability_score', 'string_count',
        'revealing_strings_count', 'crypto_like_instructions'
    ]

    with open(csv_path, 'w', newline='') as f:
        writer = csv.DictWriter(f, fieldnames=fieldnames)
        writer.writeheader()

        for result in all_results:
            row = {k: result.get(k, 0) for k in fieldnames}
            writer.writerow(row)

    print(f"Summary CSV written to: {csv_path}")

    # Print analysis summary
    print("\n" + "=" * 60)
    print("SUMMARY - Hardest to Reverse Engineer (by readability score)")
    print("=" * 60)

    # Sort by readability score (higher = harder to reverse)
    sorted_results = sorted(all_results, key=lambda x: x.get('readability_score', 0), reverse=True)

    print("\nTop 10 most obfuscated binaries:")
    for i, result in enumerate(sorted_results[:10], 1):
        print(f"{i}. {result['binary']}")
        print(f"   Score: {result.get('readability_score', 0)}")
        print(f"   Functions: {result.get('function_count', 0)}, "
              f"Instructions: {result.get('total_instructions', 0)}, "
              f"Complexity: {result.get('cyclomatic_complexity', 0)}")
        print(f"   Strings visible: {result.get('string_count', 0)}, "
              f"Revealing: {result.get('revealing_strings_count', 0)}")

    print("\n✓ Decompilation analysis complete!")


if __name__ == "__main__":
    main()
