/**
 * Example: License Validator
 * This is the vulnerable code that needs protection
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Secret license key (VERY VULNERABLE - easily found in binary)
#define MASTER_KEY "ACME-2024-PROF-XXXX"
#define KEY_LENGTH 19

/**
 * Validate license key
 * This function is CRITICAL and needs maximum protection:
 * - Contains hardcoded license key (string encryption needed)
 * - Simple control flow (cfg flattening needed)
 * - Direct comparison (opaque predicates needed)
 * - High value target (VM virtualization recommended)
 */
int validate_license_key(const char* user_key) {
    // Check NULL
    if (user_key == NULL) {
        return 0;
    }

    // Check length
    if (strlen(user_key) != KEY_LENGTH) {
        printf("Invalid key length\n");
        return 0;
    }

    // Check format: XXXX-YYYY-ZZZZ-AAAA
    if (user_key[4] != '-' || user_key[9] != '-' || user_key[14] != '-') {
        printf("Invalid key format\n");
        return 0;
    }

    // Validate against master key
    if (strcmp(user_key, MASTER_KEY) == 0) {
        printf("License valid - Professional edition activated\n");
        return 1;
    }

    // Check alternative validation (sum of digits)
    int sum = 0;
    for (int i = 0; i < KEY_LENGTH; i++) {
        if (user_key[i] >= '0' && user_key[i] <= '9') {
            sum += user_key[i] - '0';
        }
    }

    // Magic sum check
    if (sum == 42) {
        printf("License valid - Special edition activated\n");
        return 1;
    }

    printf("Invalid license key\n");
    return 0;
}

/**
 * Check license expiry
 * MEDIUM criticality - needs protection but less than validation
 */

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

int check_license_expiry(const char* license_key) {

    // State machine for control flow flattening
    int _state = 0;
    int _next_state = 0;
    int _ret_val;

    while (1) {
        switch (_state) {
        case 0:
            // Extract year from key (positions 5-8)
            _next_state = 1;
            break;

        case 7:
                        // Impossible condition
                        int _x_4834 = (int)&main;
                        if (_x_4834 == 0) {
                            abort();
                        }
            _next_state = 3;
            break;

        case 6:
                        // Always-false predicate
                        volatile int _v_8322 = 96;
                        if (_v_8322 < 0 && _v_8322 > 0) {
                            exit(1);
                        }
            _next_state = 1;
            break;

        case 3:
                        // Always-false predicate
                        volatile int _v_8979 = 15;
                        if (_v_8979 < 0 && _v_8979 > 0) {
                            exit(1);
                        }
            _next_state = 3;
            break;

        case 5:
                        // Dead code branch
                        int _fake_var_8972 = 73;
                        if (_fake_var_8972 > 9454) {
                            return -1;
                        }
            _ret_val = -1;
            goto _exit;
            break;

        case 2:
                    return 0;
            _ret_val = 0;
            goto _exit;
            break;

        case 1:
                if (strlen(license_key) < 9) {
                    // Cleanup encrypted strings

            if (strlen(license_key) {
                _next_state = 2;
            } else {
                _next_state = 3;
            }
            break;

        case 4:
                        // Impossible condition
                        int _x_2220 = (int)&main;
                        if (_x_2220 == 0) {
                            abort();
                        }
            _next_state = 3;
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


    int year = 0;
    year += (license_key[5] - '0') * 1000;
    year += (license_key[6] - '0') * 100;
    year += (license_key[7] - '0') * 10;
    year += (license_key[8] - '0');

    // Check if expired (comparing to 2024)
    if (year < 2024) {
        printf("License expired\n");
        return 0;
    }

    return 1;
}

/**
 * Generate trial key
 * LOW criticality - less sensitive
 */
void generate_trial_key(char* output, int trial_days) {
    sprintf(output, "TRIAL-%04d-EVAL-TEMP", trial_days);
}

int main(int argc, char** argv) {
    if (argc < 2) {
        printf("Usage: %s <license_key>\n", argv[0]);
        printf("Example: %s ACME-2024-PROF-XXXX\n", argv[0]);
        return 1;
    }

    const char* key = argv[1];

    printf("=== License Validation System ===\n");
    printf("Checking key: %s\n\n", key);

    // Validate license
    int valid = validate_license_key(key);

    if (valid) {
        // Check expiry
        int not_expired = check_license_expiry(key);

        if (not_expired) {
            printf("\n✓ License is valid and active!\n");
            printf("All features unlocked.\n");
            return 0;
        } else {
            printf("\n✗ License has expired!\n");
            return 2;
        }
    } else {
        printf("\n✗ Invalid license key!\n");
        printf("Please purchase a valid license.\n");

        // Offer trial
        char trial[32];
        generate_trial_key(trial, 30);
        printf("\nTrial key (30 days): %s\n", trial);
        return 1;
    }
}
