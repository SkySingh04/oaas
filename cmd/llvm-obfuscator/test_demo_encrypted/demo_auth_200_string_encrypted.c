/*
 * Enterprise Authentication & Authorization System
 *
 * A comprehensive demo showcasing real-world authentication patterns
 * with multiple security layers and hardcoded credentials.
 *
 * Perfect target for obfuscation demonstration:
 * - Multiple authentication methods
 * - Hardcoded secrets (passwords, API keys, JWT tokens)
 * - Role-based access control
 * - Session management
 * - Database credentials
 *
 * This code intentionally contains security anti-patterns for
 * demonstration purposes. DO NOT use in production.
 *
 * Lines: ~200
 * Functions: 12
 * Secrets: 8
 */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>

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


// ==================== HARDCODED SECRETS ====================
// These should be obfuscated in production binaries

char* MASTER_PASSWORD = NULL;
char* API_KEY = NULL;
char* JWT_SECRET = NULL;
char* DB_CONNECTION_STRING = NULL;
char* ENCRYPTION_KEY = NULL;
char* OAUTH_CLIENT_SECRET = NULL;
char* LICENSE_KEY = NULL;
char* BACKUP_ADMIN_PASSWORD = NULL;

// User database (simulated)
typedef struct {
    char username[64];
    char password[64];
    char role[64];
    int access_level;
} User;

#define MAX_USERS 5
User users[MAX_USERS];
int user_count = 0;

// Initialize user database

/* String decryption initialization (runs before main) */
__attribute__((constructor)) static void _init_encrypted_strings(void) {
    MASTER_PASSWORD = _xor_decrypt((const unsigned char[]){0xde,0xfb,0xf2,0xf6,0xf1,0xdf,0xcc,0xfa,0xfc,0xea,0xed,0xfa,0xcf,0xfe,0xec,0xec,0xad,0xaf,0xad,0xab,0xbe}, 21, 0x9f);
    API_KEY = _xor_decrypt((const unsigned char[]){0x9e,0x86,0xb2,0x81,0x84,0x9b,0x88,0xb2,0x9d,0x9f,0x82,0x89,0xb2,0x8c,0xde,0x8b,0xd5,0x89,0xd4,0x88,0xd9,0x8f,0xda,0x8e,0xdf,0x8c,0xdc,0x8b,0xdb}, 29, 0xed);
    JWT_SECRET = _xor_decrypt((const unsigned char[]){0xfa,0xfc,0xf9,0xec,0xfb,0xd6,0xfa,0xec,0xea,0xfb,0xec,0xfd,0xd6,0xe3,0xfe,0xfd,0xd6,0xfa,0xe0,0xee,0xe7,0xe0,0xe7,0xee,0xd6,0xe2,0xec,0xf0,0xd6,0xed,0xe6,0xd6,0xe7,0xe6,0xfd,0xd6,0xfa,0xe1,0xe8,0xfb,0xec}, 41, 0x89);
    DB_CONNECTION_STRING = _xor_decrypt((const unsigned char[]){0xc6,0xd9,0xc5,0xc2,0xd1,0xc4,0xd3,0xc5,0xc7,0xda,0x8c,0x99,0x99,0xd7,0xd2,0xdb,0xdf,0xd8,0x8c,0xf2,0xf4,0xe6,0xd7,0xc5,0xc5,0x84,0x86,0x84,0x82,0x97,0xf6,0xc6,0xc4,0xd9,0xd2,0x9b,0xd2,0xd4,0x98,0xd5,0xd9,0xdb,0xc6,0xd7,0xd8,0xcf,0x98,0xd5,0xd9,0xdb,0x8c,0x83,0x82,0x85,0x84,0x99,0xd7,0xc3,0xc2,0xde,0xe9,0xd2,0xd4}, 63, 0xb6);
    ENCRYPTION_KEY = _xor_decrypt((const unsigned char[]){0x1f,0x1b,0x0d,0x6c,0x6b,0x68,0x73,0x13,0x1f,0x0d,0x0a,0x1b,0x0c,0x73,0x15,0x1b,0x07,0x73,0x6c,0x6e,0x6c,0x6a,0x73,0x0d,0x1b,0x1d,0x0b,0x0c,0x1b}, 29, 0x5e);
    OAUTH_CLIENT_SECRET = _xor_decrypt((const unsigned char[]){0xfc,0xf2,0xe6,0xe7,0xfb,0xcc,0xe0,0xf6,0xf0,0xe1,0xf6,0xe7,0xcc,0xf2,0xab,0xf1,0xaa,0xf0,0xa3,0xf7,0xa2,0xf6,0xa1,0xf5,0xa0,0xf4,0xa7,0xfb,0xa6}, 29, 0x93);
    LICENSE_KEY = _xor_decrypt((const unsigned char[]){0xd3,0xd8,0xc2,0xd3,0xc4,0xc6,0xc4,0xdf,0xc5,0xd3,0xbb,0xda,0xdf,0xd5,0xbb,0xa4,0xa6,0xa4,0xa2,0xbb,0xce,0xcf,0xcc,0xa1,0xae,0xaf,0xbb,0xc0,0xd7,0xda,0xdf,0xd2}, 32, 0x96);
    BACKUP_ADMIN_PASSWORD = _xor_decrypt((const unsigned char[]){0xfe,0xdd,0xdf,0xd7,0xc9,0xcc,0xfd,0xd8,0xd1,0xd5,0xd2,0xfc,0x8e,0x8c,0x8e,0x88,0x9d,0xf9,0xd1,0xd9,0xce,0xdb,0xd9,0xd2,0xdf,0xc5}, 26, 0xbc);
}

void init_users(void) {
    // User 1: admin
    strcpy(users[0].username, _xor_decrypt((const unsigned char[]){0x4a,0x4f,0x46,0x42,0x45}, 5, 0x2b));
    strcpy(users[0].password, "Admin@SecurePass2024!");
    strcpy(users[0].role, _xor_decrypt((const unsigned char[]){0xa6,0xa3,0xaa,0xae,0xa9,0xae,0xb4,0xb3,0xb5,0xa6,0xb3,0xa8,0xb5}, 13, 0xc7));
    users[0].access_level = 9;

    // User 2: developer
    strcpy(users[1].username, _xor_decrypt((const unsigned char[]){0xb0,0xb1,0xa2,0xb1,0xb8,0xbb,0xa4,0xb1,0xa6}, 9, 0xd4));
    strcpy(users[1].password, "Dev@Pass2024!");
    strcpy(users[1].role, _xor_decrypt((const unsigned char[]){0x32,0x33,0x20,0x33,0x3a,0x39,0x26,0x33,0x24}, 9, 0x56));
    users[1].access_level = 5;

    // User 3: analyst
    strcpy(users[2].username, _xor_decrypt((const unsigned char[]){0x02,0x0d,0x02,0x0f,0x1a,0x10,0x17}, 7, 0x63));
    strcpy(users[2].password, "Analyst@Pass2024!");
    strcpy(users[2].role, _xor_decrypt((const unsigned char[]){0xc2,0xcd,0xc2,0xcf,0xda,0xd0,0xd7}, 7, 0xa3));
    users[2].access_level = 3;

    // User 4: guest
    strcpy(users[3].username, _xor_decrypt((const unsigned char[]){0xac,0xbe,0xae,0xb8,0xbf}, 5, 0xcb));
    strcpy(users[3].password, "Guest@Pass2024!");
    strcpy(users[3].role, _xor_decrypt((const unsigned char[]){0x3a,0x28,0x38,0x2e,0x29}, 5, 0x5d));
    users[3].access_level = 1;

    user_count = 4;
}

// Session management
typedef struct {
    char username[64];
    char session_token[128];
    time_t created_at;
    int authenticated;
} Session;

Session current_session = {0};

// ==================== AUTHENTICATION FUNCTIONS ====================

/**
 * Authenticate user with username and password
 */
int authenticate_user(const char* username, const char* password) {
    if (!username || !password) {
        printf("[AUTH] Invalid credentials provided\n");
        return 0;
    }

    // Check against user database
    for (int i = 0; i < user_count; i++) {
        if (strcmp(users[i].username, username) == 0 &&
            strcmp(users[i].password, password) == 0) {

            strcpy(current_session.username, username);
            current_session.authenticated = 1;
            current_session.created_at = time(NULL);

            printf("[AUTH] User '%s' authenticated successfully\n", username);
            printf("[AUTH] Role: %s | Access Level: %d\n",
                   users[i].role, users[i].access_level);
            return 1;
        }
    }

    printf("[AUTH] Authentication failed for user '%s'\n", username);
    return 0;
}

/**
 * Verify API key for programmatic access
 */
int verify_api_key(const char* provided_key) {
    if (!provided_key) {
        return 0;
    }

    if (strcmp(provided_key, API_KEY) == 0) {
        printf("[API] Valid API key provided\n");
        return 1;
    }

    printf("[API] Invalid API key\n");
    return 0;
}

/**
 * Generate JWT token (simplified)
 */
void generate_jwt_token(char* token_out, const char* username) {
    // In production, this would use proper JWT library
    // Here we just concatenate with the secret
    snprintf(token_out, 128, "JWT.%s.%s", username, JWT_SECRET);
    printf("[JWT] Token generated for user: %s\n", username);
}

/**
 * Verify JWT token
 */
int verify_jwt_token(const char* token) {
    if (!token) {
        return 0;
    }

    // Simple verification (production would properly validate)
    if (strstr(token, JWT_SECRET) != NULL) {
        printf("[JWT] Token verified successfully\n");
        return 1;
    }

    printf("[JWT] Token verification failed\n");
    return 0;
}

/**
 * Check if user has required access level
 */
int check_access_level(const char* username, int required_level) {
    for (int i = 0; i < user_count; i++) {
        if (strcmp(users[i].username, username) == 0) {
            if (users[i].access_level >= required_level) {
                printf("[ACCESS] User '%s' has sufficient access (level %d >= %d)\n",
                       username, users[i].access_level, required_level);
                return 1;
            } else {
                printf("[ACCESS] Access denied. User level %d < required %d\n",
                       users[i].access_level, required_level);
                return 0;
            }
        }
    }
    return 0;
}

/**
 * Get database connection
 */
void connect_to_database(void) {
    printf("[DB] Connecting to database...\n");
    printf("[DB] Connection string: %s\n", DB_CONNECTION_STRING);
    printf("[DB] Connection established\n");
}

/**
 * Encrypt sensitive data (placeholder)
 */
void encrypt_data(const char* plaintext, char* ciphertext) {
    // Production would use actual encryption
    snprintf(ciphertext, 256, "ENCRYPTED[%s]WITH[%s]", plaintext, ENCRYPTION_KEY);
    printf("[CRYPTO] Data encrypted with master key\n");
}

/**
 * Verify OAuth credentials
 */
int verify_oauth(const char* client_id, const char* client_secret) {
    if (!client_id || !client_secret) {
        return 0;
    }

    if (strcmp(client_secret, OAUTH_CLIENT_SECRET) == 0) {
        printf("[OAUTH] Client authenticated successfully\n");
        return 1;
    }

    printf("[OAUTH] Invalid client credentials\n");
    return 0;
}

/**
 * Validate enterprise license
 */
int validate_license(const char* provided_license) {
    if (!provided_license) {
        printf("[LICENSE] No license provided\n");
        return 0;
    }

    if (strcmp(provided_license, LICENSE_KEY) == 0) {
        printf("[LICENSE] Valid enterprise license detected\n");
        return 1;
    }

    printf("[LICENSE] Invalid license key\n");
    return 0;
}

/**
 * Emergency admin access (backup)
 */
int emergency_admin_access(const char* emergency_password) {
    if (!emergency_password) {
        return 0;
    }

    if (strcmp(emergency_password, BACKUP_ADMIN_PASSWORD) == 0) {
        printf("[EMERGENCY] Emergency admin access granted\n");
        strcpy(current_session.username, "emergency_admin");
        current_session.authenticated = 1;
        return 1;
    }

    printf("[EMERGENCY] Emergency access denied\n");
    return 0;
}

// ==================== MAIN ====================

int main(int argc, char** argv) {
    printf("========================================\n");
    printf("  Enterprise Auth System v2.0\n");
    printf("  Multi-Layer Security Demo\n");
    printf("========================================\n\n");

    // Initialize user database
    init_users();

    if (argc < 3) {
        printf("Usage: %s <username> <password> [options]\n", argv[0]);
        printf("\nOptions:\n");
        printf("  --api-key <key>       Verify API key\n");
        printf("  --license <key>       Validate license\n");
        printf("  --emergency <pass>    Emergency admin access\n");
        return 1;
    }

    const char* username = argv[1];
    const char* password = argv[2];

    // Step 1: Basic authentication
    if (!authenticate_user(username, password)) {
        printf("\n[RESULT] Authentication failed\n");
        return 1;
    }

    // Step 2: Generate session token
    char jwt_token[128];
    generate_jwt_token(jwt_token, username);
    strcpy(current_session.session_token, jwt_token);

    // Step 3: Check access level
    check_access_level(username, 3);

    // Step 4: Connect to database
    connect_to_database();

    // Step 5: Handle optional flags
    for (int i = 3; i < argc; i++) {
        if (strcmp(argv[i], "--api-key") == 0 && i + 1 < argc) {
            verify_api_key(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--license") == 0 && i + 1 < argc) {
            validate_license(argv[i + 1]);
            i++;
        } else if (strcmp(argv[i], "--emergency") == 0 && i + 1 < argc) {
            emergency_admin_access(argv[i + 1]);
            i++;
        }
    }

    printf("\n========================================\n");
    printf("[RESULT] Authentication successful\n");
    printf("Session Token: %s\n", current_session.session_token);
    printf("========================================\n");

    return 0;
}
