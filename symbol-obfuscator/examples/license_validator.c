/*
 * Example: License Key Validator
 * This demonstrates symbol obfuscation for a simple license validation system
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// License validation constants
#define MAX_KEY_LENGTH 32
#define EXPECTED_KEY "ABC123-XYZ789-SECRET"

// Global configuration
static int validation_attempts = 0;
static int max_attempts = 3;

// Check if license key is valid
int validate_license_key(const char* user_key) {
    if (!user_key) {
        return 0;
    }

    validation_attempts++;

    if (validation_attempts > max_attempts) {
        printf("Too many validation attempts!\n");
        return 0;
    }

    // Simple string comparison (vulnerable!)
    if (strcmp(user_key, EXPECTED_KEY) == 0) {
        return 1;
    }

    return 0;
}

// Check if license is expired
int check_license_expiry(int days_remaining) {
    if (days_remaining <= 0) {
        printf("License expired!\n");
        return 0;
    }

    if (days_remaining < 30) {
        printf("License expiring soon: %d days remaining\n", days_remaining);
    }

    return 1;
}

// Activate product with license
int activate_product(const char* license_key, int days) {
    if (!validate_license_key(license_key)) {
        printf("Invalid license key!\n");
        return 0;
    }

    if (!check_license_expiry(days)) {
        return 0;
    }

    printf("Product activated successfully!\n");
    return 1;
}

// Get validation attempt count
int get_attempt_count() {
    return validation_attempts;
}

// Reset validation attempts
void reset_attempts() {
    validation_attempts = 0;
}

int main(int argc, char** argv) {
    if (argc != 3) {
        printf("Usage: %s <license_key> <days_remaining>\n", argv[0]);
        return 1;
    }

    const char* key = argv[1];
    int days = atoi(argv[2]);

    printf("License Validation System\n");
    printf("=========================\n\n");

    if (activate_product(key, days)) {
        printf("\n✓ Access granted!\n");
        return 0;
    } else {
        printf("\n✗ Access denied!\n");
        printf("Attempts: %d/%d\n", get_attempt_count(), max_attempts);
        return 1;
    }
}
