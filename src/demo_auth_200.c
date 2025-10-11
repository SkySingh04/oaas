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

// ==================== HARDCODED SECRETS ====================
// These should be obfuscated in production binaries

const char* MASTER_PASSWORD = "Admin@SecurePass2024!";
const char* API_KEY = "sk_live_prod_a3f8d9e4b7c2a1f6";
const char* JWT_SECRET = "super_secret_jwt_signing_key_do_not_share";
const char* DB_CONNECTION_STRING = "postgresql://admin:DBPass2024!@prod-db.company.com:5432/auth_db";
const char* ENCRYPTION_KEY = "AES256-MASTER-KEY-2024-SECURE";
const char* OAUTH_CLIENT_SECRET = "oauth_secret_a8b9c0d1e2f3g4h5";
const char* LICENSE_KEY = "ENTERPRISE-LIC-2024-XYZ789-VALID";
const char* BACKUP_ADMIN_PASSWORD = "BackupAdmin@2024!Emergency";

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
void init_users(void) {
    // User 1: admin
    strcpy(users[0].username, "admin");
    strcpy(users[0].password, "Admin@SecurePass2024!");
    strcpy(users[0].role, "administrator");
    users[0].access_level = 9;

    // User 2: developer
    strcpy(users[1].username, "developer");
    strcpy(users[1].password, "Dev@Pass2024!");
    strcpy(users[1].role, "developer");
    users[1].access_level = 5;

    // User 3: analyst
    strcpy(users[2].username, "analyst");
    strcpy(users[2].password, "Analyst@Pass2024!");
    strcpy(users[2].role, "analyst");
    users[2].access_level = 3;

    // User 4: guest
    strcpy(users[3].username, "guest");
    strcpy(users[3].password, "Guest@Pass2024!");
    strcpy(users[3].role, "guest");
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
