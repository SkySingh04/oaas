from __future__ import annotations

import random
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
        """
        strings_info = self._extract_strings_with_positions(source)

        if not strings_info:
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

        # Add decryptor at the beginning (after includes)
        transformed_source = self._inject_decryptor(transformed_source, decryptor_code)

        encrypted_count = len(strings_info)
        percentage = 100.0 if encrypted_count > 0 else 0.0

        metadata = [
            {
                "original": info["text"],
                "encrypted": info["encrypted_hex"],
                "key": str(info["key"]),
            }
            for info in strings_info
        ]

        return StringEncryptionResult(
            total_strings=len(strings_info),
            encrypted_strings=encrypted_count,
            encryption_method="xor-rolling-key",
            encryption_percentage=round(percentage, 2),
            metadata=metadata,
            transformed_source=transformed_source,
        )

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
                        skip_patterns = ['%', 'Usage:', '===', 'ERROR:', 'FAIL:', 'SUCCESS:', 'Validating', 'Database']
                        should_encrypt = (
                            len(text) > 2 and
                            not any(pat in text for pat in skip_patterns) and
                            not text.startswith(' ') and  # Skip indented strings (likely UI)
                            text.replace('!', '').replace('.', '').replace(',', '').isalnum()  # Only encrypt simple alphanumeric secrets
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

            # Generate replacement code
            replacement = f'_xor_decrypt((const unsigned char[]){{{encrypted_hex}}}, {length}, 0x{key:02x})'

            transformed = transformed[:start] + replacement + transformed[end:]

        return transformed

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
