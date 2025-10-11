
#include <stdio.h>
#include <string.h>

// Secrets that should be hidden
const char* MASTER_KEY = "prod_master_key_2024_xyz";
const char* DB_CONN = "postgres://admin:SecurePass123@prod-db.example.com:5432/maindb";
const char* API_TOKEN = "Bearer sk_live_abc123def456ghi789jkl012";

// Functions that should be obfuscated
int validate_credentials(const char* username, const char* password) {
    if (strcmp(username, "admin") == 0 && strcmp(password, MASTER_KEY) == 0) {
        return 1;
    }
    return 0;
}

int check_authorization(const char* token) {
    return strcmp(token, API_TOKEN) == 0;
}

void connect_database() {
    printf("Connecting to: %s\n", DB_CONN);
}

int main(int argc, char** argv) {
    printf("=== Secure Application ===\n");
    
    if (argc < 3) {
        printf("Usage: %s <username> <password>\n", argv[0]);
        return 1;
    }
    
    if (validate_credentials(argv[1], argv[2])) {
        printf("Access granted\n");
        connect_database();
        return 0;
    }
    
    printf("Access denied\n");
    return 1;
}
