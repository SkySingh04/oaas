/*
 * Simple License Validator (C version)
 * Demonstrates license key checking with hardcoded valid keys
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Valid license keys
const char* VALID_KEY_1 = "ABCD-1234-EFGH-5678";
const char* VALID_KEY_2 = "WXYZ-9999-QRST-0000";
const char* VALID_KEY_3 = "GOLD-8888-PLAT-7777";

// Encryption key (highly sensitive)
const char* ENCRYPTION_KEY = "AES256-SECRET-KEY-DO-NOT-SHARE-2024";

// Feature flags
const int PREMIUM_ENABLED = 1;
const int TRIAL_DAYS = 30;

// Check if key is valid
int is_valid_key(const char* license_key) {
    if (!license_key) {
        return 0;
    }

    if (strcmp(license_key, VALID_KEY_1) == 0) return 1;
    if (strcmp(license_key, VALID_KEY_2) == 0) return 1;
    if (strcmp(license_key, VALID_KEY_3) == 0) return 1;

    return 0;
}

// Get license tier (0=basic, 1=pro, 2=gold)
int get_tier(const char* license_key) {
    if (strncmp(license_key, "ABCD", 4) == 0) return 0;
    if (strncmp(license_key, "WXYZ", 4) == 0) return 1;
    if (strncmp(license_key, "GOLD", 4) == 0) return 2;
    return -1;
}

// Check if premium features available
int has_premium(int tier) {
    return tier >= 1 && PREMIUM_ENABLED;
}

// Check if encryption enabled
int has_encryption(int tier) {
    return tier >= 2;
}

// Get encryption key
const char* get_encryption_key(int tier) {
    if (has_encryption(tier)) {
        return ENCRYPTION_KEY;
    }
    return NULL;
}

// Calculate trial days remaining
int calc_trial_days(int days_used) {
    int remaining = TRIAL_DAYS - days_used;
    return remaining > 0 ? remaining : 0;
}

int main(int argc, char** argv) {
    printf("=== License Validation System ===\n\n");

    if (argc < 2) {
        printf("Usage: %s <license_key> [days_used]\n", argv[0]);
        printf("\nValid test keys:\n");
        printf("  ABCD-1234-EFGH-5678 (Basic)\n");
        printf("  WXYZ-9999-QRST-0000 (Pro)\n");
        printf("  GOLD-8888-PLAT-7777 (Gold)\n");
        return 1;
    }

    const char* license_key = argv[1];
    int days_used = (argc >= 3) ? atoi(argv[2]) : 0;

    printf("Validating key: %s\n\n", license_key);

    // Validate key
    if (!is_valid_key(license_key)) {
        printf("ERROR: Invalid license key!\n");
        return 1;
    }

    printf("SUCCESS: License validated!\n\n");

    // Get tier info
    int tier = get_tier(license_key);
    printf("License tier: %d\n", tier);
    printf("Premium features: %s\n", has_premium(tier) ? "YES" : "NO");
    printf("Encryption: %s\n", has_encryption(tier) ? "YES" : "NO");

    // Show trial info
    int remaining = calc_trial_days(days_used);
    printf("Trial days remaining: %d\n", remaining);

    // Show encryption key if available
    if (has_encryption(tier)) {
        const char* enc_key = get_encryption_key(tier);
        printf("\nEncryption Key: %s\n", enc_key);
    }

    printf("\nSoftware activated successfully!\n");
    return 0;
}
