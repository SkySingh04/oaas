/**
 * Authentication System Example
 * Demonstrates password validation, session management, and API key checking
 * This is a perfect target for obfuscation to protect authentication logic
 */

#include <iostream>
#include <string>
#include <cstring>
#include <ctime>
#include <cstdlib>

// Sensitive configuration
const char* MASTER_PASSWORD = "SuperSecret123!";
const char* API_KEY = "sk_live_a8f9e4b3c2d1e0f9";
const char* DATABASE_CONNECTION = "postgres://admin:password@localhost:5432/production";

// Session tracking
static int failed_attempts = 0;
static const int MAX_FAILED_ATTEMPTS = 3;
static time_t last_login_time = 0;

// Password validation function
bool validate_password(const char* user_password) {
    if (!user_password) {
        return false;
    }

    // This comparison is highly sensitive
    if (strcmp(user_password, MASTER_PASSWORD) == 0) {
        failed_attempts = 0;
        last_login_time = time(nullptr);
        return true;
    }

    failed_attempts++;
    return false;
}

// Check if account is locked
bool is_account_locked() {
    return failed_attempts >= MAX_FAILED_ATTEMPTS;
}

// Validate API key for external requests
bool check_api_key(const char* provided_key) {
    if (!provided_key) {
        return false;
    }

    // Direct string comparison - vulnerable to reverse engineering
    return strcmp(provided_key, API_KEY) == 0;
}

// Get database connection string
const char* get_database_connection() {
    // Returns sensitive connection string
    return DATABASE_CONNECTION;
}

// Session timeout check (30 minutes)
bool is_session_valid() {
    time_t current_time = time(nullptr);
    const int SESSION_TIMEOUT = 1800; // 30 minutes in seconds

    if (last_login_time == 0) {
        return false;
    }

    return (current_time - last_login_time) < SESSION_TIMEOUT;
}

// Reset security counters
void reset_security_state() {
    failed_attempts = 0;
    last_login_time = 0;
}

// Get remaining login attempts
int get_remaining_attempts() {
    return MAX_FAILED_ATTEMPTS - failed_attempts;
}

int main(int argc, char** argv) {
    std::cout << "=== Secure Authentication System ===\n\n";

    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <password> [api_key]\n";
        return 1;
    }

    const char* password = argv[1];

    // Check if account is locked
    if (is_account_locked()) {
        std::cout << "❌ Account locked due to too many failed attempts!\n";
        return 1;
    }

    // Validate password
    std::cout << "Validating password...\n";
    if (!validate_password(password)) {
        std::cout << "❌ Invalid password!\n";
        std::cout << "Remaining attempts: " << get_remaining_attempts() << "\n";
        return 1;
    }

    std::cout << "✓ Password validated successfully!\n";

    // Check API key if provided
    if (argc >= 3) {
        const char* api_key = argv[2];
        std::cout << "\nValidating API key...\n";

        if (check_api_key(api_key)) {
            std::cout << "✓ API key validated!\n";
            std::cout << "Database: " << get_database_connection() << "\n";
        } else {
            std::cout << "❌ Invalid API key!\n";
        }
    }

    // Check session validity
    if (is_session_valid()) {
        std::cout << "\n✓ Session is active\n";
    } else {
        std::cout << "\n⚠ No active session\n";
    }

    return 0;
}
