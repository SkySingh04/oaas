/*
 * Example: Simple C++ Authentication System
 * Demonstrates C++ symbol obfuscation with classes and methods
 */

#include <iostream>
#include <string>
#include <cstring>

class User {
private:
    std::string username;
    std::string password_hash;
    bool is_admin;

public:
    User(const std::string& user, const std::string& pass, bool admin = false)
        : username(user), password_hash(pass), is_admin(admin) {}

    bool authenticate(const std::string& password) {
        // Simple hash (not secure, just for demonstration)
        size_t hash = std::hash<std::string>{}(password);
        std::string computed_hash = std::to_string(hash);

        return computed_hash == password_hash;
    }

    std::string getUsername() const {
        return username;
    }

    bool isAdmin() const {
        return is_admin;
    }
};

class AuthenticationManager {
private:
    User* current_user;
    int failed_attempts;
    static const int MAX_ATTEMPTS = 3;

public:
    AuthenticationManager() : current_user(nullptr), failed_attempts(0) {}

    ~AuthenticationManager() {
        if (current_user) {
            delete current_user;
        }
    }

    bool login(const std::string& username, const std::string& password) {
        // Hardcoded user (vulnerable!)
        if (username == "admin") {
            // Password hash for "secret123"
            User* admin = new User("admin", "7432948267891928374", true);

            if (admin->authenticate(password)) {
                current_user = admin;
                failed_attempts = 0;
                return true;
            }

            delete admin;
        }

        failed_attempts++;

        if (failed_attempts >= MAX_ATTEMPTS) {
            std::cout << "Account locked due to too many failed attempts!" << std::endl;
        }

        return false;
    }

    void logout() {
        if (current_user) {
            delete current_user;
            current_user = nullptr;
        }
    }

    bool isLoggedIn() const {
        return current_user != nullptr;
    }

    std::string getCurrentUsername() const {
        if (current_user) {
            return current_user->getUsername();
        }
        return "";
    }

    bool isCurrentUserAdmin() const {
        if (current_user) {
            return current_user->isAdmin();
        }
        return false;
    }

    int getFailedAttempts() const {
        return failed_attempts;
    }
};

// Global authentication manager
static AuthenticationManager auth_manager;

void perform_admin_action() {
    std::cout << "Performing privileged operation..." << std::endl;
    std::cout << "Access to sensitive data granted!" << std::endl;
}

int main(int argc, char** argv) {
    if (argc != 3) {
        std::cout << "Usage: " << argv[0] << " <username> <password>" << std::endl;
        return 1;
    }

    std::string username = argv[1];
    std::string password = argv[2];

    std::cout << "Authentication System" << std::endl;
    std::cout << "=====================" << std::endl << std::endl;

    if (auth_manager.login(username, password)) {
        std::cout << "✓ Login successful!" << std::endl;
        std::cout << "Welcome, " << auth_manager.getCurrentUsername() << "!" << std::endl;

        if (auth_manager.isCurrentUserAdmin()) {
            std::cout << "Admin privileges granted." << std::endl << std::endl;
            perform_admin_action();
        }

        auth_manager.logout();
        return 0;
    } else {
        std::cout << "✗ Login failed!" << std::endl;
        std::cout << "Failed attempts: " << auth_manager.getFailedAttempts()
                  << "/" << 3 << std::endl;
        return 1;
    }
}
