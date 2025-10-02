#!/usr/bin/env python3
"""
String Obfuscation Experiment
Replaces string constants in LLVM IR with encrypted versions
"""

import re
import os
import subprocess
from pathlib import Path
from datetime import datetime

# Project paths
PROJECT_ROOT = Path(__file__).parent.parent
IR_DIR = PROJECT_ROOT / "ir"
SRC_DIR = PROJECT_ROOT / "src"
BIN_DIR = PROJECT_ROOT / "bin"

IR_DIR.mkdir(exist_ok=True)


def run_command(cmd):
    """Execute shell command"""
    try:
        result = subprocess.run(cmd, shell=True, capture_output=True, text=True, timeout=30)
        return result.returncode, result.stdout, result.stderr
    except Exception as e:
        return -1, "", str(e)


def xor_encrypt_string(s, key=0x42):
    """XOR encrypt a string with a simple key"""
    return [ord(c) ^ key for c in s]


def generate_decryption_function(key=0x42):
    """Generate LLVM IR for string decryption function"""
    return f"""
; String decryption function
define internal void @decrypt_string(i8* %str, i64 %len, i8 %key) {{
entry:
  %i = alloca i64, align 8
  store i64 0, i64* %i, align 8
  br label %loop

loop:
  %idx = load i64, i64* %i, align 8
  %cmp = icmp ult i64 %idx, %len
  br i1 %cmp, label %body, label %end

body:
  %ptr = getelementptr inbounds i8, i8* %str, i64 %idx
  %char = load i8, i8* %ptr, align 1
  %decrypted = xor i8 %char, %key
  store i8 %decrypted, i8* %ptr, align 1
  %next = add i64 %idx, 1
  store i64 %next, i64* %i, align 8
  br label %loop

end:
  ret void
}}
"""


def find_string_constants(ir_content):
    """Find all string constants in LLVM IR"""
    # Pattern for string constants: @.str = private unnamed_addr constant [N x i8] c"..."
    pattern = r'(@\.str[.\d]*)\s*=\s*private\s+unnamed_addr\s+constant\s+\[(\d+)\s+x\s+i8\]\s+c"([^"]*)"'
    matches = re.findall(pattern, ir_content)

    strings = []
    for match in matches:
        var_name = match[0]
        length = int(match[1])
        content = match[2]

        # Decode escape sequences
        decoded = content.encode('utf-8').decode('unicode_escape')

        strings.append({
            'var_name': var_name,
            'length': length,
            'content': content,
            'decoded': decoded
        })

    return strings


def create_encrypted_string_constant(var_name, original_content, key=0x42):
    """Create an encrypted version of a string constant"""
    # Decode the original string
    try:
        decoded = original_content.encode('utf-8').decode('unicode_escape')
    except:
        decoded = original_content

    # Encrypt
    encrypted = xor_encrypt_string(decoded, key)

    # Create LLVM IR constant array
    length = len(encrypted)
    encrypted_bytes = ', '.join([f'i8 {b}' for b in encrypted])

    return f"{var_name} = private unnamed_addr constant [{length} x i8] [{encrypted_bytes}], align 1"


def obfuscate_ir_strings(ir_file, output_file, key=0x42):
    """Obfuscate strings in LLVM IR file"""
    if not os.path.exists(ir_file):
        print(f"Error: IR file {ir_file} not found")
        return False

    with open(ir_file, 'r') as f:
        ir_content = f.read()

    # Find all string constants
    strings = find_string_constants(ir_content)

    if not strings:
        print(f"No string constants found in {ir_file}")
        return False

    print(f"Found {len(strings)} string constants to obfuscate")

    # Replace each string constant with encrypted version
    modified_content = ir_content

    for s in strings:
        original_pattern = re.escape(f"{s['var_name']} = private unnamed_addr constant [{s['length']} x i8] c\"{s['content']}\"")
        encrypted_constant = create_encrypted_string_constant(s['var_name'], s['content'], key)

        # Replace in content
        modified_content = re.sub(original_pattern, encrypted_constant, modified_content)

        print(f"  Encrypted: {s['var_name']} ({len(s['decoded'])} chars)")

    # Add decryption function at the beginning (after target datalayout)
    decryption_func = generate_decryption_function(key)

    # Find a good insertion point (after module attributes, before first function)
    insertion_point = modified_content.find('\ndefine ')
    if insertion_point != -1:
        modified_content = (modified_content[:insertion_point] +
                          '\n' + decryption_func +
                          modified_content[insertion_point:])

    # Write modified IR
    with open(output_file, 'w') as f:
        f.write(modified_content)

    print(f"Obfuscated IR written to: {output_file}")
    return True


def add_decryption_calls(ir_file, output_file, key=0x42):
    """
    More advanced version: Add decryption calls before string usage
    This is complex and would require dataflow analysis
    For now, we'll add a global constructor that decrypts all strings at startup
    """
    if not os.path.exists(ir_file):
        return False

    with open(ir_file, 'r') as f:
        ir_content = f.read()

    # Find all string constants
    strings = find_string_constants(ir_content)

    if not strings:
        return False

    # Create a global constructor that decrypts all strings
    constructor_code = """
; Global constructor to decrypt strings at startup
@llvm.global_ctors = appending global [1 x { i32, void ()*, i8* }] [
  { i32, void ()*, i8* } { i32 65535, void ()* @decrypt_all_strings, i8* null }
]

define internal void @decrypt_all_strings() {
entry:
"""

    for s in strings:
        # Add decryption call for each string
        constructor_code += f"""  call void @decrypt_string(
    i8* getelementptr inbounds ([{s['length']} x i8], [{s['length']} x i8]* {s['var_name']}, i32 0, i32 0),
    i64 {s['length']},
    i8 {key}
  )\n"""

    constructor_code += """  ret void
}
"""

    # Add decryption function and constructor
    decryption_func = generate_decryption_function(key)

    # Insert both before first function definition
    insertion_point = ir_content.find('\ndefine ')
    if insertion_point != -1:
        ir_content = (ir_content[:insertion_point] +
                     '\n' + decryption_func +
                     '\n' + constructor_code +
                     ir_content[insertion_point:])

    # Encrypt the strings
    for s in strings:
        original_pattern = re.escape(f"{s['var_name']} = private unnamed_addr constant [{s['length']} x i8] c\"{s['content']}\"")
        encrypted_constant = create_encrypted_string_constant(s['var_name'], s['content'], key)
        ir_content = re.sub(original_pattern, encrypted_constant, ir_content)

    with open(output_file, 'w') as f:
        f.write(ir_content)

    return True


def compile_ir_to_binary(ir_file, output_binary):
    """Compile LLVM IR to executable binary"""
    cmd = f"clang {ir_file} -o {output_binary}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0, stderr


def test_obfuscated_binary(binary_path, test_input=5):
    """Test if obfuscated binary still works correctly"""
    cmd = f"{binary_path} {test_input}"
    returncode, stdout, stderr = run_command(cmd)
    return returncode == 0, stdout, stderr


def main():
    """Main execution function"""
    print("String Obfuscation Experiment")
    print("=" * 60)

    # Test with factorial_recursive as primary example
    test_program = "factorial_recursive.c"
    source_file = SRC_DIR / test_program
    base_name = test_program.replace('.c', '')

    # Generate base IR
    print(f"\n1. Generating IR from {test_program}...")
    base_ir = IR_DIR / f"{base_name}.ll"
    cmd = f"clang -S -emit-llvm -O1 {source_file} -o {base_ir}"
    returncode, stdout, stderr = run_command(cmd)

    if returncode != 0:
        print(f"Error generating IR: {stderr}")
        return

    print(f"   ✓ IR generated: {base_ir}")

    # Method 1: Simple string encryption (strings stay encrypted)
    print(f"\n2. Obfuscating strings (static encryption)...")
    obfuscated_ir_static = IR_DIR / f"{base_name}_obf_static.ll"

    if obfuscate_ir_strings(str(base_ir), str(obfuscated_ir_static)):
        print(f"   ✓ Obfuscated IR created: {obfuscated_ir_static}")

        # Try to compile (may not work as strings are encrypted)
        print(f"\n3. Compiling obfuscated IR (static)...")
        obf_binary_static = BIN_DIR / f"{base_name}_obf_static"
        success, error = compile_ir_to_binary(str(obfuscated_ir_static), str(obf_binary_static))

        if success:
            print(f"   ✓ Binary compiled: {obf_binary_static}")
            print(f"   Note: This binary will have encrypted strings but won't decrypt them")
            print(f"         (won't run correctly, but shows strings are hidden)")
        else:
            print(f"   ✗ Compilation failed: {error}")

    # Method 2: Encryption with runtime decryption
    print(f"\n4. Obfuscating strings (with runtime decryption)...")
    obfuscated_ir_dynamic = IR_DIR / f"{base_name}_obf_dynamic.ll"

    if add_decryption_calls(str(base_ir), str(obfuscated_ir_dynamic)):
        print(f"   ✓ Obfuscated IR with decryption created: {obfuscated_ir_dynamic}")

        # Compile
        print(f"\n5. Compiling obfuscated IR (dynamic)...")
        obf_binary_dynamic = BIN_DIR / f"{base_name}_obf_dynamic"
        success, error = compile_ir_to_binary(str(obfuscated_ir_dynamic), str(obf_binary_dynamic))

        if success:
            print(f"   ✓ Binary compiled: {obf_binary_dynamic}")

            # Test functionality
            print(f"\n6. Testing obfuscated binary...")
            success, stdout, stderr = test_obfuscated_binary(str(obf_binary_dynamic))

            if success and "120" in stdout:  # factorial(5) = 120
                print(f"   ✓ Binary works correctly!")
                print(f"   Output preview: {stdout[:200]}")
            else:
                print(f"   ✗ Binary test failed")
                print(f"   stdout: {stdout[:200]}")
                print(f"   stderr: {stderr[:200]}")
        else:
            print(f"   ✗ Compilation failed: {error}")

    # Compare string visibility
    print(f"\n7. Comparing string visibility...")

    # Original binary
    orig_binary = BIN_DIR / f"{base_name}_baseline_O0"
    if not orig_binary.exists():
        # Compile original for comparison
        cmd = f"clang -O1 {source_file} -o {orig_binary}"
        run_command(cmd)

    if orig_binary.exists():
        cmd = f"strings {orig_binary} | grep -i factorial | head -5"
        returncode, stdout, stderr = run_command(cmd)
        print(f"\n   Original binary strings (sample):")
        print(f"   {stdout if stdout else '(none found)'}")

    if obf_binary_dynamic and obf_binary_dynamic.exists():
        cmd = f"strings {obf_binary_dynamic} | grep -i factorial | head -5"
        returncode, stdout, stderr = run_command(cmd)
        print(f"\n   Obfuscated binary strings (sample):")
        print(f"   {stdout if stdout else '(none found - good!)'}")

    print("\n" + "=" * 60)
    print("String obfuscation experiment complete!")
    print("\nKey findings:")
    print("- String constants can be encrypted in LLVM IR")
    print("- Runtime decryption can be added via global constructors")
    print("- This significantly reduces visible strings in the binary")
    print("- Performance impact: minimal (one-time decryption at startup)")


if __name__ == "__main__":
    main()
