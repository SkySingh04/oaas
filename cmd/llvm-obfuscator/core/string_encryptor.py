from __future__ import annotations

import random
import re
from dataclasses import dataclass
from typing import Dict, List


@dataclass
class StringEncryptionResult:
    total_strings: int
    encrypted_strings: int
    encryption_method: str
    encryption_percentage: float
    metadata: List[Dict[str, str]]
    transformed_source: str  # The actual transformed source code


class XORStringEncryptor:
    """XOR-based string obfuscator with actual source transformation."""

    def __init__(self, seed: int = 1337) -> None:
        self._rand = random.Random(seed)

    def encrypt_strings(self, source: str) -> StringEncryptionResult:
        """
        Extract strings from C/C++ source and replace them with encrypted versions.
        Returns the transformed source code with decryption functions.

        For const global strings, we use a two-phase approach:
        1. Convert const globals to static non-const variables (initialized to NULL)
        2. Generate a static constructor that initializes them with decrypted values
        """
        # First, find const global string declarations
        const_globals = self._extract_const_globals(source)

        # Then find regular strings (in function bodies)
        strings_info = self._extract_strings_with_positions(source)

        total_strings = len(const_globals) + len(strings_info)

        if total_strings == 0:
            return StringEncryptionResult(
                total_strings=0,
                encrypted_strings=0,
                encryption_method="xor-rolling-key",
                encryption_percentage=0.0,
                metadata=[],
                transformed_source=source,
            )

        # Generate decryption helper function
        decryptor_code = self._generate_decryptor()

        # Transform source by replacing strings with encrypted versions
        transformed_source = self._transform_source(source, strings_info)

        # Transform const globals (more complex transformation)
        if const_globals:
            transformed_source = self._transform_const_globals(transformed_source, const_globals)
        
        # Fix const char* declarations that now have function calls as initializers
        transformed_source = self._fix_const_declarations(transformed_source)

        # Add decryptor at the beginning (after includes)
        transformed_source = self._inject_decryptor(transformed_source, decryptor_code)

        encrypted_count = len(const_globals) + len(strings_info)
        percentage = (encrypted_count / total_strings * 100.0) if total_strings > 0 else 0.0

        metadata = [
            {
                "original": info["text"],
                "encrypted": info.get("encrypted_hex", "N/A"),
                "key": str(info.get("key", 0)),
                "type": info.get("type", "inline"),
            }
            for info in (list(const_globals) + strings_info)
        ]

        return StringEncryptionResult(
            total_strings=total_strings,
            encrypted_strings=encrypted_count,
            encryption_method="xor-rolling-key",
            encryption_percentage=round(percentage, 2),
            metadata=metadata,
            transformed_source=transformed_source,
        )

    def _is_const_global_initializer(self, source: str, string_pos: int) -> bool:
        """Check if a string at position string_pos is part of a const global initializer."""
        # Look backward from string position to find context
        # Pattern: const char* IDENTIFIER = "string"

        # Find the line containing this string
        line_start = source.rfind('\n', 0, string_pos) + 1
        line_end = source.find('\n', string_pos)
        if line_end == -1:
            line_end = len(source)

        line = source[line_start:line_end].strip()

        # Check if line contains 'const' keyword
        if 'const' not in line:
            return False

        # Check if it's at global scope (not indented inside a function)
        # Look backward to see if we're inside braces
        brace_depth = 0
        for i in range(string_pos - 1, -1, -1):
            if source[i] == '}':
                brace_depth += 1
            elif source[i] == '{':
                brace_depth -= 1
                # If we hit a '{' while depth is 0, we were at global scope
                if brace_depth < 0:
                    # Check if this is a function or struct/enum
                    # Look backward to find what this brace belongs to
                    before_brace = source[max(0, i-200):i].strip()
                    # If we find a ')' before the '{', it's likely a function
                    if ')' in before_brace:
                        return False  # Inside a function, not global
                    break

        # If we're here and brace_depth is 0 or negative, we're at global scope
        # and line contains 'const', so it's a const global initializer
        return brace_depth <= 0 and 'const' in line

    def _extract_candidate_strings(self, source: str) -> List[str]:
        candidates: List[str] = []
        current = []
        in_string = False
        escape = False
        for char in source:
            if in_string:
                if escape:
                    current.append(char)
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == "\"":
                    in_string = False
                    if len(current) >= 3:
                        candidates.append("".join(current))
                    current = []
                else:
                    current.append(char)
            elif char == "\"":
                in_string = True
        return candidates

    def _xor_string(self, text: str) -> str:
        key = self._rand.randint(1, 255)
        encrypted = [chr(ord(ch) ^ key) for ch in text]
        return "".join(encrypted)

    def _extract_strings_with_positions(self, source: str) -> List[Dict]:
        """Extract string literals with their positions and encrypt them."""
        strings_info = []
        i = 0
        while i < len(source):
            if source[i] == '"':
                start = i
                i += 1
                string_content = []
                escaped = False

                while i < len(source):
                    if escaped:
                        string_content.append(source[i])
                        escaped = False
                    elif source[i] == '\\':
                        string_content.append(source[i])
                        escaped = True
                    elif source[i] == '"':
                        end = i + 1
                        text = ''.join(string_content)

                        # Skip format strings, usage messages, single-char strings, and strings used in printf contexts
                        # Also skip if string contains format specifiers or seems like output text
                        skip_patterns = ['%', 'Usage:', '===', 'ERROR:', 'FAIL:', 'SUCCESS:', 'Validating', 'Database', '#include', '<', '>', 'std::', 'cout', 'endl']

                        # Check if this string is part of a global const declaration
                        is_const_global = self._is_const_global_initializer(source, start)
                        should_encrypt = (
                            len(text) > 2 and
                            not any(pat in text for pat in skip_patterns) and
                            not text.startswith(' ') and  # Skip indented strings (likely UI)
                            not text.startswith('#') and  # Skip preprocessor directives
                            not text.startswith('<') and  # Skip system headers
                            not text.startswith('std::') and  # Skip standard library references
                            text.replace('!', '').replace('.', '').replace(',', '').replace(' ', '').isalnum() and  # Only encrypt simple alphanumeric secrets
                            not is_const_global  # Don't encrypt const global initializers
                        )

                        if should_encrypt:
                            key = self._rand.randint(1, 255)
                            encrypted_bytes = [ord(ch) ^ key for ch in text]
                            encrypted_hex = ','.join([f'0x{b:02x}' for b in encrypted_bytes])

                            strings_info.append({
                                'start': start,
                                'end': end,
                                'text': text,
                                'key': key,
                                'length': len(text),
                                'encrypted_hex': encrypted_hex,
                            })
                        break
                    else:
                        string_content.append(source[i])
                    i += 1
            i += 1

        return strings_info

    def _generate_decryptor(self) -> str:
        """Generate C code for XOR decryption function."""
        return '''
#include <stdlib.h>
#include <string.h>

/* XOR String Decryption Helper */
static char* _xor_decrypt(const unsigned char* enc, int len, unsigned char key) {
    char* dec = (char*)malloc(len + 1);
    if (!dec) return NULL;
    for (int i = 0; i < len; i++) {
        dec[i] = enc[i] ^ key;
    }
    dec[len] = '\\0';
    return dec;
}

static void _secure_free(char* ptr) {
    if (ptr) {
        memset(ptr, 0, strlen(ptr));
        free(ptr);
    }
}
'''

    def _transform_source(self, source: str, strings_info: List[Dict]) -> str:
        """Replace string literals with decryption calls."""
        # Sort by position (reverse order to not mess up indices)
        sorted_strings = sorted(strings_info, key=lambda x: x['start'], reverse=True)

        transformed = source
        for info in sorted_strings:
            start = info['start']
            end = info['end']
            encrypted_hex = info['encrypted_hex']
            key = info['key']
            length = info['length']

            # Simple replacement - just replace the string literal with the function call
            replacement = f'_xor_decrypt((const unsigned char[]){{{encrypted_hex}}}, {length}, 0x{key:02x})'
            transformed = transformed[:start] + replacement + transformed[end:]

        return transformed

    def _fix_const_declarations(self, source: str) -> str:
        """Fix const char* declarations that have function calls as initializers."""
        lines = source.split('\n')
        fixed_lines = []
        
        for i, line in enumerate(lines):
            # Check if this line has a const char* declaration with _xor_decrypt call
            if 'const char*' in line and '_xor_decrypt' in line:
                # Extract variable name
                var_match = re.search(r'const char\*\s+(\w+)\s*=', line)
                if var_match:
                    var_name = var_match.group(1)
                    # Replace with non-const declaration
                    new_line = f"char* {var_name};"
                    fixed_lines.append(new_line)
                    
                    # Add initialization on next line
                    init_line = f"    {var_name} = {line.split('=', 1)[1].strip()};"
                    fixed_lines.append(init_line)
                else:
                    fixed_lines.append(line)
            else:
                fixed_lines.append(line)
        
        return '\n'.join(fixed_lines)

    def _inject_decryptor(self, source: str, decryptor_code: str) -> str:
        """Inject decryption function after includes and initial comments."""
        lines = source.split('\n')
        insert_pos = 0
        in_block_comment = False

        for i, line in enumerate(lines):
            stripped = line.strip()

            # Track block comments
            if '/*' in stripped:
                in_block_comment = True
            if '*/' in stripped:
                in_block_comment = False
                continue

            # Skip if we're in a block comment or line comment
            if in_block_comment or stripped.startswith('//'):
                continue

            # Found an #include - update position
            if stripped.startswith('#include'):
                insert_pos = i + 1

            # Found first non-comment code line - stop searching
            elif stripped and not stripped.startswith('#'):
                if insert_pos == 0:
                    insert_pos = i
                break

        lines.insert(insert_pos, decryptor_code)
        return '\n'.join(lines)

    def _extract_const_globals(self, source: str) -> List[Dict]:
        """Extract const global string declarations like: const char* NAME = "value"; """
        import re

        const_globals = []

        # Pattern 1: C-style - const char* IDENTIFIER = "string";
        # Also matches: static const char* or const char *
        c_pattern = r'^\s*(static\s+)?const\s+char\s*\*\s+(\w+)\s*=\s*"([^"]+)"\s*;'

        # Pattern 2: C++ style - const std::string IDENTIFIER = "string";
        cpp_pattern = r'^\s*(static\s+)?const\s+std::string\s+(\w+)\s*=\s*"([^"]+)"\s*;'

        lines = source.split('\n')
        for line_num, line in enumerate(lines):
            # Try C pattern first
            match = re.match(c_pattern, line)
            is_cpp_string = False

            # If no C match, try C++ pattern
            if not match:
                match = re.match(cpp_pattern, line)
                is_cpp_string = True

            if match:
                static_prefix = match.group(1) or ""
                var_name = match.group(2)
                string_value = match.group(3)

                # Skip format strings and UI strings
                skip_patterns = ['%', 'Usage:', '===', 'ERROR:', 'FAIL:', 'SUCCESS:']
                if any(pat in string_value for pat in skip_patterns):
                    continue

                # Encrypt this string
                key = self._rand.randint(1, 255)
                encrypted_bytes = [ord(ch) ^ key for ch in string_value]
                encrypted_hex = ','.join([f'0x{b:02x}' for b in encrypted_bytes])

                const_globals.append({
                    'line_num': line_num,
                    'var_name': var_name,
                    'text': string_value,
                    'key': key,
                    'length': len(string_value),
                    'encrypted_hex': encrypted_hex,
                    'static_prefix': static_prefix,
                    'original_line': line,
                    'type': 'const_global',
                    'is_cpp_string': is_cpp_string,  # Track if it's C++ std::string
                })

        return const_globals

    def _transform_const_globals(self, source: str, const_globals: List[Dict]) -> str:
        """
        Transform const global declarations to use encrypted strings.

        Strategy:
        1. Replace const declarations with static variables initialized to NULL/""
        2. Generate a static constructor function that initializes them
        3. Use __attribute__((constructor)) to run before main()

        For C++ std::string: Keep as std::string but initialize empty
        For C char*: Change to char* initialized to NULL
        """
        lines = source.split('\n')

        # Step 1: Replace const declarations
        for info in const_globals:
            line_num = info['line_num']
            var_name = info['var_name']
            static_prefix = info['static_prefix']
            is_cpp_string = info.get('is_cpp_string', False)

            if is_cpp_string:
                # For C++ std::string: std::string VAR_NAME = "";
                lines[line_num] = f"{static_prefix}std::string {var_name} = \"\";"
            else:
                # For C char*: char* VAR_NAME = NULL;
                lines[line_num] = f"{static_prefix}char* {var_name} = NULL;"

        # Step 2: Generate initialization function
        init_lines = [
            "",
            "/* String decryption initialization (runs before main) */",
            "__attribute__((constructor)) static void _init_encrypted_strings(void) {",
        ]

        for info in const_globals:
            var_name = info['var_name']
            encrypted_hex = info['encrypted_hex']
            length = info['length']
            key = info['key']
            is_cpp_string = info.get('is_cpp_string', False)

            if is_cpp_string:
                # For C++ std::string, assign decrypted char* to std::string (implicit conversion)
                init_lines.append(
                    f"    {var_name} = std::string(_xor_decrypt((const unsigned char[]){{{encrypted_hex}}}, {length}, 0x{key:02x}));"
                )
            else:
                # For C char*, direct assignment
                init_lines.append(
                    f"    {var_name} = _xor_decrypt((const unsigned char[]){{{encrypted_hex}}}, {length}, 0x{key:02x});"
                )

        init_lines.append("}")
        init_lines.append("")

        # Step 3: Find where to inject the init function (after global variables, before first function)
        # Strategy: Find the first function definition (has return type, name, params, and opening brace)
        inject_pos = len(lines)
        in_block_comment = False
        found_globals = False

        for i, line in enumerate(lines):
            stripped = line.strip()

            # Track block comments
            if '/*' in stripped:
                in_block_comment = True
            if '*/' in stripped:
                in_block_comment = False
                continue

            # Skip if in block comment, line comment, or empty
            if in_block_comment or not stripped or stripped.startswith('//') or stripped.startswith('*'):
                continue

            # Track if we've found our global variables
            if ('char* ' in stripped or 'std::string ' in stripped) and '= NULL' in stripped or '= "";' in stripped:
                found_globals = True
                continue

            # After finding globals, look for first function
            if found_globals:
                # Look for function definitions: int fname(...) or void fname(...)
                # Check if line has function signature pattern and next line (or same line) has {
                if ('(' in stripped and ')' in stripped and
                    (stripped.startswith('int ') or stripped.startswith('void ') or
                     stripped.startswith('char') or stripped.startswith('static'))):
                    # This is likely a function definition
                    inject_pos = i
                    break

        # Insert initialization function
        for line in reversed(init_lines):
            lines.insert(inject_pos, line)

        return '\n'.join(lines)
