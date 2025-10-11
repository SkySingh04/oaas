/*
 * Simple Authentication System (C version)
 * Demonstrates password validation with hardcoded credentials
 * Perfect target for obfuscation
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// Hardcoded sensitive credentials
const char* MASTER_PASSWORD = "AdminPass2024!";
const char* API_SECRET = "sk_live_secret_12345";
const char* DB_HOST = "db.production.com";
const char* DB_USER = "admin";
const char* DB_PASS = "DBSecret2024";

// Global state
static int failed_attempts = 0;
static const int MAX_ATTEMPTS = 3;

// Validate user password
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
