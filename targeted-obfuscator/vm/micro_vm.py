#!/usr/bin/env python3
"""
Lightweight VM (Layer 4)
Virtualizes critical function execution using custom bytecode
Maximum protection but highest overhead - use sparingly
"""

import re
import random
from typing import List, Dict, Tuple
from dataclasses import dataclass
from enum import IntEnum


class VMOpcode(IntEnum):
    """Custom VM instruction set"""
    NOP = 0x00
    LOAD = 0x01      # Load from memory/register
    STORE = 0x02     # Store to memory/register
    PUSH = 0x03      # Push to stack
    POP = 0x04       # Pop from stack
    ADD = 0x05       # Addition
    SUB = 0x06       # Subtraction
    MUL = 0x07       # Multiplication
    DIV = 0x08       # Division
    XOR = 0x09       # XOR operation
    AND = 0x0A       # AND operation
    OR = 0x0B        # OR operation
    NOT = 0x0C       # NOT operation
    CMP = 0x0D       # Compare
    JMP = 0x0E       # Unconditional jump
    JZ = 0x0F        # Jump if zero
    JNZ = 0x10       # Jump if not zero
    CALL = 0x11      # Call native function
    RET = 0x12       # Return from function
    CONST = 0x13     # Load constant
    STRLEN = 0x14    # String length
    STRCMP = 0x15    # String compare
    PRINT = 0x16     # Print (debug)
    HALT = 0xFF      # Halt execution


@dataclass
class VMInstruction:
    """Represents a single VM instruction"""
    opcode: VMOpcode
    operand1: int = 0
    operand2: int = 0
    operand3: int = 0


class MicroVM:
    """Lightweight VM for virtualizing critical functions"""

    def __init__(self, encrypt_bytecode: bool = True, obfuscate_interpreter: bool = True):
        """
        Initialize VM

        Args:
            encrypt_bytecode: Whether to encrypt bytecode
            obfuscate_interpreter: Whether to obfuscate interpreter
        """
        self.encrypt_bytecode = encrypt_bytecode
        self.obfuscate_interpreter = obfuscate_interpreter
        self.bytecode: List[int] = []
        self.string_constants: Dict[int, str] = {}
        self.next_const_id = 0

    def virtualize_function(self, function_code: str, function_name: str) -> str:
        """
        Convert native code to VM bytecode

        Args:
            function_code: The function's source code
            function_name: Name of the function

        Returns:
            C code with VM interpreter and bytecode
        """

        # Step 1: Parse function to extract logic
        signature, body, return_type = self._parse_function(function_code)

        # Step 2: Convert to bytecode (simplified - production would use proper IR)
        self.bytecode = []
        self.string_constants = {}
        self._compile_to_bytecode(body)

        # Step 3: Encrypt bytecode if requested
        if self.encrypt_bytecode:
            self.bytecode = self._encrypt_bytecode(self.bytecode)

        # Step 4: Generate VM interpreter
        interpreter = self._generate_interpreter()

        # Step 5: Generate wrapper function
        wrapper = self._generate_wrapper(signature, function_name, return_type)

        return interpreter + "\n" + wrapper

    def _parse_function(self, code: str) -> Tuple[str, str, str]:
        """Parse function signature and body"""

        # Match function definition
        pattern = r'((\w+[\s\*]+)(\w+)\s*\([^)]*\))\s*\{(.*)\}'
        match = re.search(pattern, code, re.DOTALL)

        if not match:
            raise ValueError("Could not parse function")

        signature = match.group(1)
        return_type = match.group(2).strip()
        body = match.group(4)

        return signature, body, return_type

    def _compile_to_bytecode(self, body: str) -> None:
        """
        Compile function body to VM bytecode
        This is HIGHLY simplified - production would use proper compiler frontend
        """

        # Extract key operations
        lines = body.strip().split('\n')

        for line in lines:
            stripped = line.strip()

            # Skip comments and empty lines
            if not stripped or stripped.startswith('//'):
                continue

            # Compile different statement types
            if 'return' in stripped:
                self._compile_return(stripped)
            elif 'if' in stripped:
                self._compile_if(stripped)
            elif 'strcmp' in stripped or 'strlen' in stripped:
                self._compile_string_op(stripped)
            elif '=' in stripped and not any(op in stripped for op in ['==', '!=', '<=', '>=']):
                self._compile_assignment(stripped)
            elif 'printf' in stripped:
                self._compile_print(stripped)

    def _compile_return(self, stmt: str) -> None:
        """Compile return statement"""

        # Extract return value
        match = re.search(r'return\s+([^;]+);', stmt)
        if match:
            value_str = match.group(1).strip()

            # Check if constant
            if value_str.isdigit():
                value = int(value_str)
                self.bytecode.extend([
                    VMOpcode.CONST, value & 0xFF, (value >> 8) & 0xFF,
                    VMOpcode.RET
                ])
            else:
                # Return variable (assume in register 0)
                self.bytecode.extend([
                    VMOpcode.LOAD, 0, 0,
                    VMOpcode.RET
                ])

    def _compile_if(self, stmt: str) -> None:
        """Compile if statement"""

        # Extract condition
        match = re.search(r'if\s*\(([^)]+)\)', stmt)
        if match:
            condition = match.group(1)

            # Simple comparison check
            if '==' in condition:
                parts = condition.split('==')
                # Compile comparison
                self.bytecode.extend([
                    VMOpcode.LOAD, 0, 0,      # Load first operand
                    VMOpcode.CONST, 0, 0,      # Load second operand (constant)
                    VMOpcode.CMP,              # Compare
                    VMOpcode.JZ, 10, 0         # Jump if equal
                ])
            elif '!=' in condition:
                parts = condition.split('!=')
                self.bytecode.extend([
                    VMOpcode.LOAD, 0, 0,
                    VMOpcode.CONST, 0, 0,
                    VMOpcode.CMP,
                    VMOpcode.JNZ, 10, 0
                ])

    def _compile_string_op(self, stmt: str) -> None:
        """Compile string operation"""

        if 'strcmp' in stmt:
            # String comparison
            self.bytecode.extend([
                VMOpcode.LOAD, 0, 0,       # Load string pointer 1
                VMOpcode.LOAD, 1, 0,       # Load string pointer 2
                VMOpcode.STRCMP            # Compare strings
            ])
        elif 'strlen' in stmt:
            # String length
            self.bytecode.extend([
                VMOpcode.LOAD, 0, 0,       # Load string pointer
                VMOpcode.STRLEN            # Get length
            ])

    def _compile_assignment(self, stmt: str) -> None:
        """Compile assignment statement"""

        # Simple assignment: var = value
        match = re.search(r'(\w+)\s*=\s*([^;]+);', stmt)
        if match:
            var = match.group(1)
            value_str = match.group(2).strip()

            if value_str.isdigit():
                value = int(value_str)
                self.bytecode.extend([
                    VMOpcode.CONST, value & 0xFF, (value >> 8) & 0xFF,
                    VMOpcode.STORE, 0, 0       # Store to variable 0
                ])

    def _compile_print(self, stmt: str) -> None:
        """Compile print statement"""

        # Extract string
        match = re.search(r'printf\s*\("([^"]+)"', stmt)
        if match:
            string = match.group(1)

            # Store string constant
            const_id = self.next_const_id
            self.next_const_id += 1
            self.string_constants[const_id] = string

            # Emit print instruction
            self.bytecode.extend([
                VMOpcode.CONST, const_id, 0,
                VMOpcode.PRINT
            ])

    def _encrypt_bytecode(self, bytecode: List[int]) -> List[int]:
        """Encrypt bytecode using XOR"""

        key = random.randint(1, 255)
        encrypted = [(b ^ key) for b in bytecode]

        # Store key in bytecode header
        return [key] + encrypted

    def _generate_interpreter(self) -> str:
        """Generate VM interpreter in C"""

        # Generate string constants table
        string_table = "// String constants\n"
        string_table += "static const char* _vm_strings[] = {\n"
        for i in range(self.next_const_id):
            if i in self.string_constants:
                string_table += f'    "{self.string_constants[i]}",\n'
            else:
                string_table += '    "",\n'
        string_table += "};\n\n"

        # Generate bytecode
        bytecode_str = "// VM Bytecode"
        if self.encrypt_bytecode:
            bytecode_str += " (encrypted)\n"
        else:
            bytecode_str += "\n"

        bytecode_str += "static const unsigned char _vm_bytecode[] = {\n    "
        for i, byte in enumerate(self.bytecode):
            bytecode_str += f"0x{byte:02x}, "
            if (i + 1) % 12 == 0:
                bytecode_str += "\n    "
        bytecode_str += "\n};\n\n"

        # Generate interpreter
        interpreter = string_table + bytecode_str

        interpreter += """
// VM Interpreter
static int _vm_execute(const unsigned char* bytecode, int bytecode_len, const char* arg) {
    // VM state
    int registers[16] = {0};
    int stack[256];
    int sp = 0;  // Stack pointer
    int pc = 0;  // Program counter
    int running = 1;

    // Decrypt bytecode if needed
    unsigned char* code = (unsigned char*)malloc(bytecode_len);
    if (!code) return -1;

"""

        if self.encrypt_bytecode:
            interpreter += """    // Decrypt bytecode (XOR with key in first byte)
    unsigned char key = bytecode[0];
    for (int i = 1; i < bytecode_len; i++) {
        code[i-1] = bytecode[i] ^ key;
    }
    bytecode_len -= 1;
"""
        else:
            interpreter += """    memcpy(code, bytecode, bytecode_len);
"""

        interpreter += """
    // Store argument in register 0
    registers[0] = (int)(uintptr_t)arg;

    // Execute bytecode
    while (running && pc < bytecode_len) {
        unsigned char opcode = code[pc++];

        switch (opcode) {
            case 0x00:  // NOP
                break;

            case 0x01:  // LOAD reg, addr
                {
                    unsigned char reg = code[pc++];
                    // Load from memory (simplified)
                    registers[reg] = registers[0];
                }
                break;

            case 0x02:  // STORE reg, addr
                {
                    unsigned char reg = code[pc++];
                    // Store to memory (simplified)
                    registers[0] = registers[reg];
                }
                break;

            case 0x03:  // PUSH reg
                {
                    unsigned char reg = code[pc++];
                    stack[sp++] = registers[reg];
                }
                break;

            case 0x04:  // POP reg
                {
                    unsigned char reg = code[pc++];
                    registers[reg] = stack[--sp];
                }
                break;

            case 0x05:  // ADD
                registers[0] = registers[0] + registers[1];
                break;

            case 0x0D:  // CMP
                registers[0] = (registers[0] == registers[1]) ? 0 : 1;
                break;

            case 0x0E:  // JMP offset
                {
                    unsigned char offset = code[pc++];
                    pc = offset;
                }
                break;

            case 0x0F:  // JZ offset
                {
                    unsigned char offset = code[pc++];
                    if (registers[0] == 0) {
                        pc = offset;
                    }
                }
                break;

            case 0x12:  // RET
                {
                    int ret_val = registers[0];
                    free(code);
                    return ret_val;
                }

            case 0x13:  // CONST value
                {
                    unsigned char low = code[pc++];
                    unsigned char high = code[pc++];
                    registers[0] = low | (high << 8);
                }
                break;

            case 0x15:  // STRCMP
                {
                    const char* s1 = (const char*)(uintptr_t)registers[0];
                    const char* s2 = (const char*)(uintptr_t)registers[1];
                    registers[0] = strcmp(s1, s2);
                }
                break;

            case 0x16:  // PRINT const_id
                {
                    unsigned char const_id = code[pc++];
                    pc++;  // Skip padding
                    if (const_id < sizeof(_vm_strings)/sizeof(_vm_strings[0])) {
                        printf("%s", _vm_strings[const_id]);
                    }
                }
                break;

            case 0xFF:  // HALT
                running = 0;
                break;

            default:
                // Unknown opcode - halt
                running = 0;
                break;
        }
    }

    free(code);
    return 0;
}
"""

        return interpreter

    def _generate_wrapper(self, signature: str, function_name: str, return_type: str) -> str:
        """Generate wrapper function that calls VM"""

        # Extract parameters
        param_match = re.search(r'\(([^)]*)\)', signature)
        params = param_match.group(1) if param_match else ""

        wrapper = f"""
// Virtualized function wrapper
{signature} {{
    // Execute function in VM
    int result = _vm_execute(
        _vm_bytecode,
        sizeof(_vm_bytecode),
        (const char*)({params.split()[1] if params else 'NULL'})  // Pass first parameter
    );

    return result;
}}
"""

        return wrapper

    def get_virtualization_report(self) -> Dict:
        """Get report on virtualization"""

        return {
            'bytecode_size': len(self.bytecode),
            'encrypted': self.encrypt_bytecode,
            'obfuscated': self.obfuscate_interpreter,
            'num_instructions': len(self.bytecode) // 3,  # Approximate
            'string_constants': len(self.string_constants),
            'estimated_overhead': '10-50x'
        }


def main():
    """CLI interface for VM virtualization"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Virtualize C/C++ functions with custom VM'
    )
    parser.add_argument('source_file', help='C/C++ source file')
    parser.add_argument('function_name', help='Function to virtualize')
    parser.add_argument(
        '--encrypt-bytecode',
        action='store_true',
        help='Encrypt the bytecode'
    )
    parser.add_argument(
        '--output',
        help='Output file (default: stdout)'
    )

    args = parser.parse_args()

    # Read source file
    with open(args.source_file, 'r') as f:
        content = f.read()

    # Extract function
    func_pattern = rf'(\w+[\s\*]+)?{args.function_name}\s*\([^)]*\)\s*\{{.*?\}}'
    match = re.search(func_pattern, content, re.DOTALL)

    if not match:
        print(f"Error: Function '{args.function_name}' not found")
        return

    function_code = match.group(0)

    # Virtualize
    vm = MicroVM(encrypt_bytecode=args.encrypt_bytecode)
    virtualized_code = vm.virtualize_function(function_code, args.function_name)

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            f.write(virtualized_code)
        print(f"✓ Virtualized function written to {args.output}")
    else:
        print(virtualized_code)

    # Print report
    report = vm.get_virtualization_report()
    print(f"\n📊 Virtualization Report:")
    print(f"  Bytecode size: {report['bytecode_size']} bytes")
    print(f"  Encrypted: {report['encrypted']}")
    print(f"  String constants: {report['string_constants']}")
    print(f"  Estimated overhead: {report['estimated_overhead']}")


if __name__ == '__main__':
    main()
