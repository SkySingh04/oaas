#!/usr/bin/env python3
"""
String and Constant Encryption Layer (Layer 1)
Encrypts all strings and constants in critical functions
"""

import re
import random
import hashlib
from typing import List, Tuple, Dict
from dataclasses import dataclass


@dataclass
class EncryptedString:
    """Information about an encrypted string"""
    original: str
    encrypted: bytes
    key: int
    var_name: str
    length: int


class StringConstantEncryptor:
    """First layer - encrypt all strings/constants in function"""

    def __init__(self, algorithm: str = 'xor'):
        """
        Initialize encryptor

        Args:
            algorithm: Encryption algorithm (xor, xor_multilayer, rc4)
        """
        self.algorithm = algorithm
        self.encrypted_strings: List[EncryptedString] = []
        self.var_counter = 0

    def protect_function(self, function_code: str, function_name: str) -> str:
        """
        Encrypt all strings and constants in a function

        Args:
            function_code: The function's source code
            function_name: Name of the function

        Returns:
            Modified function code with encrypted strings
        """
        self.encrypted_strings = []
        self.var_counter = 0

        modified_code = function_code

        # Step 1: Extract and encrypt string literals
        modified_code = self._encrypt_string_literals(modified_code)

        # Step 2: Obfuscate numeric constants (optional)
        modified_code = self._obfuscate_numeric_constants(modified_code)

        # Step 3: Add decryption helper functions
        decryption_helpers = self._generate_decryption_helpers()

        # Step 4: Add cleanup code at function exit points
        modified_code = self._add_cleanup_code(modified_code)

        # Combine helpers + function
        return decryption_helpers + "\n" + modified_code

    def _encrypt_string_literals(self, code: str) -> str:
        """Find and encrypt all string literals"""

        # Pattern to match string literals (handles escapes)
        string_pattern = r'"([^"\\]*(\\.[^"\\]*)*)"'

        def encrypt_match(match):
            original_str = match.group(1)

            # Don't encrypt format strings or very short strings
            if '%' in original_str or len(original_str) < 3:
                return match.group(0)

            # Encrypt the string
            encrypted = self._encrypt_string(original_str)

            # Generate variable name
            var_name = f"_enc_str_{self.var_counter}"
            self.var_counter += 1

            # Store info
            self.encrypted_strings.append(encrypted)

            # Generate decryption call
            return f'_decrypt_string({var_name}, {encrypted.length}, {encrypted.key})'

        # Replace strings with decryption calls
        modified = re.sub(string_pattern, encrypt_match, code)

        return modified

    def _encrypt_string(self, plaintext: str) -> EncryptedString:
        """Encrypt a single string"""

        if self.algorithm == 'xor':
            return self._xor_encrypt(plaintext)
        elif self.algorithm == 'xor_multilayer':
            return self._xor_multilayer_encrypt(plaintext)
        elif self.algorithm == 'rc4':
            return self._rc4_encrypt(plaintext)
        else:
            return self._xor_encrypt(plaintext)

    def _xor_encrypt(self, plaintext: str) -> EncryptedString:
        """Simple XOR encryption"""
        key = random.randint(1, 255)
        encrypted = bytes([ord(c) ^ key for c in plaintext])

        var_name = f"_enc_str_{self.var_counter}"

        return EncryptedString(
            original=plaintext,
            encrypted=encrypted,
            key=key,
            var_name=var_name,
            length=len(plaintext)
        )

    def _xor_multilayer_encrypt(self, plaintext: str) -> EncryptedString:
        """Multi-layer XOR encryption with position-dependent keys"""
        base_key = random.randint(1, 255)

        encrypted = bytes([
            ord(c) ^ base_key ^ (i * 7)  # Position-dependent key
            for i, c in enumerate(plaintext)
        ])

        var_name = f"_enc_str_{self.var_counter}"

        return EncryptedString(
            original=plaintext,
            encrypted=encrypted,
            key=base_key,
            var_name=var_name,
            length=len(plaintext)
        )

    def _rc4_encrypt(self, plaintext: str) -> EncryptedString:
        """RC4-like stream cipher encryption"""
        key = random.randint(1000, 9999)

        # Simple RC4-like key schedule
        S = list(range(256))
        j = 0
        key_bytes = str(key).encode()

        for i in range(256):
            j = (j + S[i] + key_bytes[i % len(key_bytes)]) % 256
            S[i], S[j] = S[j], S[i]

        # Generate keystream and encrypt
        i = j = 0
        encrypted = []
        for char in plaintext:
            i = (i + 1) % 256
            j = (j + S[i]) % 256
            S[i], S[j] = S[j], S[i]
            K = S[(S[i] + S[j]) % 256]
            encrypted.append(ord(char) ^ K)

        var_name = f"_enc_str_{self.var_counter}"

        return EncryptedString(
            original=plaintext,
            encrypted=bytes(encrypted),
            key=key,
            var_name=var_name,
            length=len(plaintext)
        )

    def _obfuscate_numeric_constants(self, code: str) -> str:
        """
        Obfuscate numeric constants using arithmetic expressions
        Example: 42 -> (0x2A ^ 0x00) or (21 + 21)
        """

        # Pattern for standalone numeric constants
        # Avoid those in array indices, function calls, etc.
        number_pattern = r'\b(\d+)\b'

        def obfuscate_number(match):
            num = int(match.group(1))

            # Only obfuscate "interesting" numbers (likely magic values)
            if num < 10 or num > 100000:
                return match.group(0)

            # Choose random obfuscation technique
            technique = random.choice(['xor', 'add', 'sub', 'mul', 'shift'])

            if technique == 'xor':
                mask = random.randint(1, 255)
                return f"({num ^ mask} ^ {mask})"
            elif technique == 'add':
                a = random.randint(1, num - 1)
                b = num - a
                return f"({a} + {b})"
            elif technique == 'sub':
                a = num + random.randint(1, 100)
                b = a - num
                return f"({a} - {b})"
            elif technique == 'mul':
                if num % 2 == 0:
                    return f"({num // 2} * 2)"
                else:
                    return match.group(0)
            elif technique == 'shift':
                if num % 2 == 0 and num > 1:
                    shifts = 0
                    temp = num
                    while temp % 2 == 0:
                        shifts += 1
                        temp //= 2
                    return f"({temp} << {shifts})"
                else:
                    return match.group(0)

            return match.group(0)

        # Apply obfuscation (but not too aggressively - only 30% of constants)
        lines = code.split('\n')
        modified_lines = []

        for line in lines:
            # Skip preprocessor directives and comments
            if line.strip().startswith('#') or line.strip().startswith('//'):
                modified_lines.append(line)
                continue

            if random.random() < 0.3:  # 30% chance
                line = re.sub(number_pattern, obfuscate_number, line)

            modified_lines.append(line)

        return '\n'.join(modified_lines)

    def _generate_decryption_helpers(self) -> str:
        """Generate decryption helper functions"""

        if self.algorithm == 'xor':
            helpers = """
// String decryption helpers (XOR)
static inline char* _decrypt_string(const unsigned char* enc, int len, unsigned char key) {
    char* decrypted = (char*)malloc(len + 1);
    if (!decrypted) return NULL;

    for (int i = 0; i < len; i++) {
        decrypted[i] = enc[i] ^ key;
    }
    decrypted[len] = '\\0';
    return decrypted;
}

static inline void _secure_free(char* ptr) {
    if (ptr) {
        // Zero out memory before freeing (anti-forensics)
        size_t len = strlen(ptr);
        for (size_t i = 0; i < len; i++) {
            ptr[i] = 0;
        }
        free(ptr);
    }
}
"""
        elif self.algorithm == 'xor_multilayer':
            helpers = """
// String decryption helpers (Multi-layer XOR)
static inline char* _decrypt_string(const unsigned char* enc, int len, unsigned char key) {
    char* decrypted = (char*)malloc(len + 1);
    if (!decrypted) return NULL;

    for (int i = 0; i < len; i++) {
        decrypted[i] = enc[i] ^ key ^ (i * 7);  // Position-dependent
    }
    decrypted[len] = '\\0';
    return decrypted;
}

static inline void _secure_free(char* ptr) {
    if (ptr) {
        size_t len = strlen(ptr);
        for (size_t i = 0; i < len; i++) {
            ptr[i] = 0;
        }
        free(ptr);
    }
}
"""
        elif self.algorithm == 'rc4':
            helpers = """
// String decryption helpers (RC4-like)
static inline char* _decrypt_string(const unsigned char* enc, int len, int key) {
    char* decrypted = (char*)malloc(len + 1);
    if (!decrypted) return NULL;

    // RC4-like decryption
    unsigned char S[256];
    for (int i = 0; i < 256; i++) S[i] = i;

    char key_str[16];
    snprintf(key_str, sizeof(key_str), "%d", key);
    int key_len = strlen(key_str);

    int j = 0;
    for (int i = 0; i < 256; i++) {
        j = (j + S[i] + key_str[i % key_len]) % 256;
        unsigned char temp = S[i];
        S[i] = S[j];
        S[j] = temp;
    }

    int i = 0, k = 0;
    for (int idx = 0; idx < len; idx++) {
        i = (i + 1) % 256;
        j = (j + S[i]) % 256;
        unsigned char temp = S[i];
        S[i] = S[j];
        S[j] = temp;
        k = S[(S[i] + S[j]) % 256];
        decrypted[idx] = enc[idx] ^ k;
    }

    decrypted[len] = '\\0';
    return decrypted;
}

static inline void _secure_free(char* ptr) {
    if (ptr) {
        size_t len = strlen(ptr);
        for (size_t i = 0; i < len; i++) {
            ptr[i] = 0;
        }
        free(ptr);
    }
}
"""
        else:
            helpers = ""

        # Add encrypted string data
        data_section = "\n// Encrypted string data\n"
        for enc_str in self.encrypted_strings:
            hex_bytes = ', '.join(f'0x{b:02x}' for b in enc_str.encrypted)
            data_section += f"static const unsigned char {enc_str.var_name}[] = {{{hex_bytes}}};\n"

        return helpers + data_section

    def _add_cleanup_code(self, code: str) -> str:
        """Add cleanup code at function exit points"""

        # Find return statements
        lines = code.split('\n')
        modified_lines = []

        for line in lines:
            if 'return' in line and not line.strip().startswith('//'):
                # Add cleanup before return
                indent = len(line) - len(line.lstrip())
                cleanup = ' ' * indent + '// Cleanup encrypted strings\n'

                for enc_str in self.encrypted_strings:
                    cleanup += ' ' * indent + f'// _secure_free({enc_str.var_name});\n'

                modified_lines.append(cleanup + line)
            else:
                modified_lines.append(line)

        return '\n'.join(modified_lines)

    def get_encryption_report(self) -> Dict:
        """Get report on encrypted strings"""
        return {
            'total_strings_encrypted': len(self.encrypted_strings),
            'algorithm': self.algorithm,
            'strings': [
                {
                    'original_length': enc.length,
                    'encrypted_length': len(enc.encrypted),
                    'key': enc.key,
                    'var_name': enc.var_name
                }
                for enc in self.encrypted_strings
            ]
        }


def main():
    """CLI interface for string encryption"""
    import argparse

    parser = argparse.ArgumentParser(
        description='Encrypt strings in C/C++ functions'
    )
    parser.add_argument('source_file', help='C/C++ source file')
    parser.add_argument('function_name', help='Function to protect')
    parser.add_argument(
        '--algorithm',
        choices=['xor', 'xor_multilayer', 'rc4'],
        default='xor',
        help='Encryption algorithm (default: xor)'
    )
    parser.add_argument(
        '--output',
        help='Output file (default: stdout)'
    )

    args = parser.parse_args()

    # Read source file
    with open(args.source_file, 'r') as f:
        content = f.read()

    # Extract function (simple approach - find by name)
    func_pattern = rf'(\w+[\s\*]+)?{args.function_name}\s*\([^)]*\)\s*\{{[^}}]*\}}'
    match = re.search(func_pattern, content, re.DOTALL)

    if not match:
        print(f"Error: Function '{args.function_name}' not found")
        return

    function_code = match.group(0)

    # Encrypt strings
    encryptor = StringConstantEncryptor(algorithm=args.algorithm)
    protected_code = encryptor.protect_function(function_code, args.function_name)

    # Output
    if args.output:
        with open(args.output, 'w') as f:
            f.write(protected_code)
        print(f"✓ Protected function written to {args.output}")
    else:
        print(protected_code)

    # Print report
    report = encryptor.get_encryption_report()
    print(f"\n📊 Encrypted {report['total_strings_encrypted']} strings using {report['algorithm']}")


if __name__ == '__main__':
    main()
