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
static int v_16582cc4cf07 = 0;
static const int v_40e93bbefc0c = 3;

// Validate user password
int f_dabe0a778dd2(const char* user_input) {
    if (!user_input) {
        return 0;
    }

    if (strcmp(user_input, MASTER_PASSWORD) == 0) {
        v_16582cc4cf07 = 0;
        return 1;
    }

    v_16582cc4cf07++;
    return 0;
}

// Check if account is locked
int f_6bce5a1c28d3() {
    return v_16582cc4cf07 >= v_40e93bbefc0c;
}

// Validate API token
int f_2094fa9ed23f(const char* token) {
    if (!token) {
        return 0;
    }
    return strcmp(token, API_SECRET) == 0;
}

// Get database credentials
void f_7667edc5580d(char* host_out, char* user_out, char* pass_out) {
    strcpy(host_out, DB_HOST);
    strcpy(user_out, DB_USER);
    strcpy(pass_out, DB_PASS);
}

// Reset failed attempts
void f_c4183a7ce0e7() {
    v_16582cc4cf07 = 0;
}

// Get remaining attempts
int f_cd17c0d0bf4f() {
    return v_40e93bbefc0c - v_16582cc4cf07;
}

int main(int argc, char** argv) {
    printf("=== Authentication System ===\n\n");

    if (argc < 2) {
        printf("Usage: %s <password> [api_token]\n", argv[0]);
        return 1;
    }

    const char* password = argv[1];

    // Check if locked
    if (f_6bce5a1c28d3()) {
        printf("ERROR: Account locked!\n");
        return 1;
    }

    // Validate password
    printf("Validating password...\n");
    if (!f_dabe0a778dd2(password)) {
        printf("FAIL: Invalid password!\n");
        printf("Remaining attempts: %d\n", f_cd17c0d0bf4f());
        return 1;
    }

    printf("SUCCESS: Password validated!\n");

    // Check API token if provided
    if (argc >= 3) {
        const char* token = argv[2];
        printf("\nValidating API token...\n");

        if (f_2094fa9ed23f(token)) {
            printf("SUCCESS: API token valid!\n");

            // Show database credentials
            char host[256], user[256], pass[256];
            f_7667edc5580d(host, user, pass);
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
