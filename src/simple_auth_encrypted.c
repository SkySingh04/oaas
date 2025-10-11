/*
 * Simple Authentication System (C version) - WITH STRING ENCRYPTION
 * All sensitive strings encrypted with XOR
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

// String decryption helper (XOR)
static inline char* _decrypt_xor(const unsigned char* enc, int len, unsigned char key) {
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
        size_t len = strlen(ptr);
        for (size_t i = 0; i < len; i++) {
            ptr[i] = 0;
        }
        free(ptr);
    }
}

// Encrypted strings (XOR with key 0xAB)
// "AdminPass2024!"
static const unsigned char _enc_master_pass[] = {0xEA, 0xCF, 0xC6, 0xC2, 0xC5, 0xFB, 0xCA, 0xD8, 0xD8, 0x99, 0x9B, 0x99, 0x9F, 0x8A};

// "sk_live_secret_12345"
static const unsigned char _enc_api_secret[] = {0xD8, 0xC0, 0xF4, 0xC7, 0xC2, 0xDD, 0xCE, 0xF4, 0xD8, 0xCE, 0xC8, 0xD9, 0xCE, 0xDF, 0xF4, 0x9A, 0x99, 0x98, 0x9F, 0x9E};

// "db.production.com"
static const unsigned char _enc_db_host[] = {0xCF, 0xC9, 0x85, 0xDB, 0xD9, 0xC4, 0xCF, 0xDE, 0xC8, 0xDF, 0xC2, 0xC4, 0xC5, 0x85, 0xC8, 0xC4, 0xC6};

// "admin"
static const unsigned char _enc_db_user[] = {0xCA, 0xCF, 0xC6, 0xC2, 0xC5};

// "DBSecret2024"
static const unsigned char _enc_db_pass[] = {0xEF, 0xE9, 0xF8, 0xCE, 0xC8, 0xD9, 0xCE, 0xDF, 0x99, 0x9B, 0x99, 0x9F};

// Global state
static int failed_attempts = 0;
static const int MAX_ATTEMPTS = 3;

// Validate user password
int validate_password(const char* user_input) {
    if (!user_input) {
        return 0;
    }

    // Decrypt password at runtime
    char* master_pass = _decrypt_xor(_enc_master_pass, 14, 0xAB);
    if (!master_pass) {
        return 0;
    }

    int result = strcmp(user_input, master_pass) == 0;

    if (result) {
        failed_attempts = 0;
    } else {
        failed_attempts++;
    }

    // Secure cleanup
    _secure_free(master_pass);

    return result;
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

    // Decrypt API secret at runtime
    char* api_secret = _decrypt_xor(_enc_api_secret, 20, 0xAB);
    if (!api_secret) {
        return 0;
    }

    int result = strcmp(token, api_secret) == 0;

    // Secure cleanup
    _secure_free(api_secret);

    return result;
}

// Get database credentials
void get_db_credentials(char* host_out, char* user_out, char* pass_out) {
    // Decrypt all DB credentials at runtime
    char* host = _decrypt_xor(_enc_db_host, 17, 0xAB);
    char* user = _decrypt_xor(_enc_db_user, 5, 0xAB);
    char* pass = _decrypt_xor(_enc_db_pass, 12, 0xAB);

    if (host && user && pass) {
        strcpy(host_out, host);
        strcpy(user_out, user);
        strcpy(pass_out, pass);
    }

    // Secure cleanup
    _secure_free(host);
    _secure_free(user);
    _secure_free(pass);
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
