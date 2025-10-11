/*
 * Simple Authentication System (C version)
 * Demonstrates password validation with hardcoded credentials
 * Perfect target for obfuscation
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include <stdlib.h>
#include <string.h>

/* XOR String Decryption Helper */
static char* _xor_decrypt(const unsigned char* enc, int len, unsigned char key) {
    char* dec = (char*)malloc(len + 1);
    if (!dec) return NULL;
    for (int i = 0; i < len; i++) {
        dec[i] = enc[i] ^ key;
    }
    dec[len] = '\0';
    return dec;
}

static void _secure_free(char* ptr) {
    if (ptr) {
        memset(ptr, 0, strlen(ptr));
        free(ptr);
    }
}


// Hardcoded sensitive credentials
char* MASTER_PASSWORD = NULL;
char* API_SECRET = NULL;
char* DB_HOST = NULL;
char* DB_USER = NULL;
char* DB_PASS = NULL;

// Global state
static int failed_attempts = 0;
static const int MAX_ATTEMPTS = 3;

// Validate user password

/* String decryption initialization (runs before main) */
__attribute__((constructor)) static void _init_encrypted_strings(void) {
    MASTER_PASSWORD = _xor_decrypt((const unsigned char[]){0xde,0xfb,0xf2,0xf6,0xf1,0xcf,0xfe,0xec,0xec,0xad,0xaf,0xad,0xab,0xbe}, 14, 0x9f);
    API_SECRET = _xor_decrypt((const unsigned char[]){0x9e,0x86,0xb2,0x81,0x84,0x9b,0x88,0xb2,0x9e,0x88,0x8e,0x9f,0x88,0x99,0xb2,0xdc,0xdf,0xde,0xd9,0xd8}, 20, 0xed);
    DB_HOST = _xor_decrypt((const unsigned char[]){0xed,0xeb,0xa7,0xf9,0xfb,0xe6,0xed,0xfc,0xea,0xfd,0xe0,0xe6,0xe7,0xa7,0xea,0xe6,0xe4}, 17, 0x89);
    DB_USER = _xor_decrypt((const unsigned char[]){0xd7,0xd2,0xdb,0xdf,0xd8}, 5, 0xb6);
    DB_PASS = _xor_decrypt((const unsigned char[]){0x1a,0x1c,0x0d,0x3b,0x3d,0x2c,0x3b,0x2a,0x6c,0x6e,0x6c,0x6a}, 12, 0x5e);
}

int validate_password(const char* user_input) {
    if (!user_input) {
        return 0;
    }

    if (strcmp(user_input, MASTER_PASSWORD) == 0) {
        failed_attempts = 0;
        return 1;
    }

    failed_attempts++;
    return 0;
}

// Check if account is locked
int is_locked() {
    return failed_attempts >= MAX_ATTEMPTS;
}

// Validate API token
int check_api_token(const char* token) {
    if (!token) {
        return 0;
    }
    return strcmp(token, API_SECRET) == 0;
}

// Get database credentials
void get_db_credentials(char* host_out, char* user_out, char* pass_out) {
    strcpy(host_out, DB_HOST);
    strcpy(user_out, DB_USER);
    strcpy(pass_out, DB_PASS);
}

// Reset failed attempts
void reset_attempts() {
    failed_attempts = 0;
}

// Get remaining attempts
int get_remaining() {
    return MAX_ATTEMPTS - failed_attempts;
}

int main(int argc, char** argv) {
    printf("=== Authentication System ===\n\n");

    if (argc < 2) {
        printf("Usage: %s <password> [api_token]\n", argv[0]);
        return 1;
    }

    const char* password = argv[1];

    // Check if locked
    if (is_locked()) {
        printf("ERROR: Account locked!\n");
        return 1;
    }

    // Validate password
    printf("Validating password...\n");
    if (!validate_password(password)) {
        printf("FAIL: Invalid password!\n");
        printf("Remaining attempts: %d\n", get_remaining());
        return 1;
    }

    printf("SUCCESS: Password validated!\n");

    // Check API token if provided
    if (argc >= 3) {
        const char* token = argv[2];
        printf("\nValidating API token...\n");

        if (check_api_token(token)) {
            printf("SUCCESS: API token valid!\n");

            // Show database credentials
            char host[256], user[256], pass[256];
            get_db_credentials(host, user, pass);
            printf("\nDatabase Connection:\n");
            printf("  Host: %s\n", host);
            printf("  User: %s\n", user);
            printf("  Pass: %s\n", pass);
        } else {
            printf("FAIL: Invalid API token!\n");
        }
    }

    return 0;
}
