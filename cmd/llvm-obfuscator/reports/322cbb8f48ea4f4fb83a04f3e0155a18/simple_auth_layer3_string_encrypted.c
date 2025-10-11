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
const char* MASTER_PASSWORD = _xor_decrypt((const unsigned char[]){0xde,0xfb,0xf2,0xf6,0xf1,0xcf,0xfe,0xec,0xec,0xad,0xaf,0xad,0xab,0xbe}, 14, 0x9f);
const char* API_SECRET = "sk_live_secret_12345";
const char* DB_HOST = _xor_decrypt((const unsigned char[]){0x89,0x8f,0xc3,0x9d,0x9f,0x82,0x89,0x98,0x8e,0x99,0x84,0x82,0x83,0xc3,0x8e,0x82,0x80}, 17, 0xed);
const char* DB_USER = _xor_decrypt((const unsigned char[]){0xe8,0xed,0xe4,0xe0,0xe7}, 5, 0x89);
const char* DB_PASS = _xor_decrypt((const unsigned char[]){0xf2,0xf4,0xe5,0xd3,0xd5,0xc4,0xd3,0xc2,0x84,0x86,0x84,0x82}, 12, 0xb6);

// Global state
static int failed_attempts = 0;
static const int MAX_ATTEMPTS = 3;

// Validate user password

// String decryption helpers (XOR)
static inline char* _decrypt_string(const unsigned char* enc, int len, unsigned char key) {
    char* decrypted = (char*)malloc(len + 1);
    if (!decrypted) return NULL;

    for (int i = 0; i < len; i++) {
        decrypted[i] = enc[i] ^ key;
    }
    decrypted[len] = '\0';
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

// Encrypted string data

int validate_password(const char* user_input) {

    // State machine for control flow flattening
    int _state = 0;
    int _next_state = 0;

    // Dead code branch (never taken)
    if (int _opaque_var_0 = 12; (_opaque_var_0 != _opaque_var_0)) {
        printf("Debug: Should never see this\n");
        abort();
    }

    int _ret_val;

    while (1) {
        switch (_state) {
        case 0:
            if (!user_input) {
                    // Cleanup encrypted strings

            if (!user_input) {
                _next_state = 1;
            } else {
                _next_state = 2;
            }
            break;

        case 4:
                        // Impossible condition
                        int _x_9615 = (int)&main;
                        if (_x_9615 == 0) {
                            abort();
                        }
            _next_state = 4;
            break;

        case 5:
                        // Always-false predicate
                        volatile int _v_1817 = 81;
                        if (_v_1817 < 0 && _v_1817 > 0) {
                            exit(1);
                        }
            _next_state = 1;
            break;

        case 6:
                        // Impossible condition
                        int _x_3481 = (int)&main;
                        if (_x_3481 == 0) {
                            abort();
                        }
            _next_state = 4;
            break;

        case 1:
                    return 0;
            _ret_val = 0;
            goto _exit;
            break;

        case 2:
                        // Impossible condition
                        int _x_2671 = (int)&main;
                        if (_x_2671 == 0) {
                            abort();
                        }
            _next_state = 2;
            break;

        case 3:
                        // Impossible condition
                        int _x_9285 = (int)&main;
                        if (_x_9285 == 0) {
                            abort();
                        }
            _next_state = 2;
            break;

        default:
            // Invalid state - should never reach here
            goto _exit;
        }

        // Update state
        _state = _next_state;
    }

_exit:
    return _ret_val;
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
