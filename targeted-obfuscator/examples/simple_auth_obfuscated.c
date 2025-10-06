/**
 * Simple Authentication Example - OBFUSCATED VERSION
 * Manually obfuscated to demonstrate real protection
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// String decryption helper
static inline char* _decrypt_xor(const unsigned char* enc, int len, unsigned char key) {
    char* dec = (char*)malloc(len + 1);
    if (!dec) return NULL;
    for (int i = 0; i < len; i++) {
        dec[i] = enc[i] ^ key;
    }
    dec[len] = '\0';
    return dec;
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

// Encrypted "admin123" with key 0xAB
// 'a'^0xAB = 0xCA, 'd'^0xAB = 0xCF, 'm'^0xAB = 0xC6, 'i'^0xAB = 0xC2, 'n'^0xAB = 0xC5,
// '1'^0xAB = 0x9A, '2'^0xAB = 0x99, '3'^0xAB = 0x98
static const unsigned char _encrypted_password[] = {
    0xCA, 0xCF, 0xC6, 0xC2, 0xC5, 0x9A, 0x99, 0x98
};

int check_password(const char* input) {
    if (input == NULL) {
        return 0;
    }

    // Decrypt password at runtime
    char* secret = _decrypt_xor(_encrypted_password, 8, 0xAB);
    if (!secret) return 0;

    int result = (strcmp(input, secret) == 0) ? 1 : 0;

    // Securely clean up
    _secure_free(secret);

    return result;
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s <password>\n", argv[0]);
        return 1;
    }

    if (check_password(argv[1])) {
        printf("✓ Access granted!\n");
        return 0;
    } else {
        printf("✗ Access denied!\n");
        return 1;
    }
}
