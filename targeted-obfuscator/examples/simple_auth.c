/**
 * Simple Authentication Example
 * Demonstrates targeted obfuscation on a clean function
 */

#include <stdio.h>
#include <string.h>

// VULNERABLE: Hardcoded password
#define SECRET_PASSWORD "admin123"

int check_password(const char* input) {
    if (input == NULL) {
        return 0;
    }

    if (strcmp(input, SECRET_PASSWORD) == 0) {
        return 1;  // Access granted
    }

    return 0;  // Access denied
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
