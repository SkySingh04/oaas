/*
 * Enterprise License Validation System (C++)
 *
 * A comprehensive demo showcasing C++ obfuscation with:
 * - Classes and inheritance
 * - Templates
 * - STL containers
 * - Hardcoded license keys and secrets
 *
 * Perfect target for obfuscation demonstration:
 * - Complex class hierarchies
 * - Template instantiation
 * - Virtual functions
 * - Hardcoded cryptographic keys
 * - License validation logic
 *
 * This code intentionally contains security anti-patterns for
 * demonstration purposes. DO NOT use in production.
 *
 * Lines: ~200
 * Classes: 4
 * Secrets: 6
 */

#include <iostream>
#include <string>
#include <vector>
#include <map>
#include <ctime>
#include <cstring>
#include <algorithm>

// ==================== HARDCODED SECRETS ====================

const std::string MASTER_LICENSE_KEY = "ENTERPRISE-MASTER-2024-A1B2C3D4E5F6";
const std::string RSA_PRIVATE_KEY = "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEA2024SECURE";
const std::string AES_ENCRYPTION_KEY = "AES256_PROD_KEY_2024_DO_NOT_SHARE";
const std::string ACTIVATION_SECRET = "activation_secret_xyz_2024_prod";
const std::string CLOUD_API_TOKEN = "cloud_api_token_a1b2c3d4e5f6g7h8";
const std::string BACKUP_LICENSE = "BACKUP-LICENSE-2024-FALLBACK-KEY";

// ==================== LICENSE TYPES ====================

enum class LicenseType {
    TRIAL,
    STANDARD,
    PROFESSIONAL,
    ENTERPRISE,
    UNLIMITED
};

// ==================== TEMPLATE CLASSES ====================

template<typename T>
class SecureContainer {
private:
    std::vector<T> data;
    std::string encryption_key;

public:
    SecureContainer(const std::string& key) : encryption_key(key) {
        std::cout << "[SECURE] Container initialized with encryption\n";
    }

    void add(const T& item) {
        data.push_back(item);
    }

    T get(size_t index) const {
        if (index < data.size()) {
            return data[index];
        }
        throw std::out_of_range("Index out of bounds");
    }

    size_t size() const {
        return data.size();
    }

    void encrypt_all() {
        std::cout << "[SECURE] Encrypting " << data.size() << " items with key: "
                  << encryption_key << "\n";
    }
};

// ==================== BASE LICENSE CLASS ====================

class License {
protected:
    std::string license_key;
    std::string owner_name;
    std::time_t expiration_date;
    LicenseType type;
    bool activated;

public:
    License(const std::string& key, const std::string& owner, LicenseType t)
        : license_key(key), owner_name(owner), type(t), activated(false) {
        expiration_date = std::time(nullptr) + (365 * 24 * 60 * 60); // 1 year
    }

    virtual ~License() = default;

    virtual bool validate() const {
        std::cout << "[LICENSE] Validating license key: " << license_key << "\n";

        // Check master key
        if (license_key == MASTER_LICENSE_KEY) {
            std::cout << "[LICENSE] Master license detected - unlimited access\n";
            return true;
        }

        // Check backup key
        if (license_key == BACKUP_LICENSE) {
            std::cout << "[LICENSE] Backup license validated\n";
            return true;
        }

        // Check expiration
        std::time_t now = std::time(nullptr);
        if (now > expiration_date) {
            std::cout << "[LICENSE] License expired\n";
            return false;
        }

        return activated;
    }

    virtual void activate(const std::string& activation_code) {
        std::cout << "[LICENSE] Activating license with code: " << activation_code << "\n";

        if (activation_code == ACTIVATION_SECRET) {
            activated = true;
            std::cout << "[LICENSE] Activation successful\n";
        } else {
            std::cout << "[LICENSE] Invalid activation code\n";
        }
    }

    virtual void display_info() const {
        std::cout << "License Owner: " << owner_name << "\n";
        std::cout << "License Type: " << static_cast<int>(type) << "\n";
        std::cout << "Status: " << (activated ? "Active" : "Inactive") << "\n";
    }

    LicenseType get_type() const { return type; }
    bool is_activated() const { return activated; }
};

// ==================== ENTERPRISE LICENSE CLASS ====================

class EnterpriseLicense : public License {
private:
    int max_users;
    std::vector<std::string> features;
    std::string cloud_token;

public:
    EnterpriseLicense(const std::string& key, const std::string& owner, int users)
        : License(key, owner, LicenseType::ENTERPRISE),
          max_users(users),
          cloud_token(CLOUD_API_TOKEN) {

        features = {"Advanced Analytics", "Priority Support", "Cloud Integration",
                    "Custom Branding", "API Access", "Unlimited Storage"};
    }

    bool validate() const override {
        std::cout << "[ENTERPRISE] Validating enterprise license\n";

        if (!License::validate()) {
            return false;
        }

        // Additional enterprise checks
        std::cout << "[ENTERPRISE] Cloud token: " << cloud_token << "\n";
        std::cout << "[ENTERPRISE] Max users: " << max_users << "\n";

        return true;
    }

    void display_info() const override {
        License::display_info();
        std::cout << "Max Users: " << max_users << "\n";
        std::cout << "Features: ";
        for (const auto& feature : features) {
            std::cout << feature << " | ";
        }
        std::cout << "\n";
    }

    void enable_cloud_sync() {
        std::cout << "[CLOUD] Syncing with cloud using token: " << cloud_token << "\n";
        std::cout << "[CLOUD] Sync successful\n";
    }
};

// ==================== LICENSE MANAGER ====================

class LicenseManager {
private:
    std::map<std::string, License*> licenses;
    SecureContainer<std::string> secure_keys;
    std::string encryption_key;

public:
    LicenseManager() : secure_keys(AES_ENCRYPTION_KEY), encryption_key(AES_ENCRYPTION_KEY) {
        std::cout << "[MANAGER] License Manager initialized\n";
        std::cout << "[MANAGER] Using encryption key: " << encryption_key << "\n";
    }

    ~LicenseManager() {
        for (auto& pair : licenses) {
            delete pair.second;
        }
    }

    void add_license(License* license) {
        std::string key = std::to_string(licenses.size());
        licenses[key] = license;
        secure_keys.add(key);
        std::cout << "[MANAGER] License added to secure storage\n";
    }

    bool validate_all() {
        std::cout << "[MANAGER] Validating all licenses...\n";
        bool all_valid = true;

        for (const auto& pair : licenses) {
            if (!pair.second->validate()) {
                all_valid = false;
            }
        }

        secure_keys.encrypt_all();
        return all_valid;
    }

    void display_all() {
        std::cout << "\n========================================\n";
        std::cout << "  License Summary\n";
        std::cout << "========================================\n";

        for (const auto& pair : licenses) {
            std::cout << "\nLicense ID: " << pair.first << "\n";
            pair.second->display_info();
        }
    }

    License* get_license(const std::string& id) {
        auto it = licenses.find(id);
        if (it != licenses.end()) {
            return it->second;
        }
        return nullptr;
    }
};

// ==================== CRYPTOGRAPHIC FUNCTIONS ====================

class CryptoHelper {
public:
    static std::string sign_license(const std::string& license_data) {
        std::cout << "[CRYPTO] Signing license with RSA private key\n";
        std::cout << "[CRYPTO] Key: " << RSA_PRIVATE_KEY.substr(0, 50) << "...\n";

        // Simplified signing (production would use actual crypto library)
        return "SIGNATURE:" + license_data + ":" + RSA_PRIVATE_KEY.substr(0, 20);
    }

    static bool verify_signature(const std::string& signature) {
        std::cout << "[CRYPTO] Verifying signature\n";
        return signature.find(RSA_PRIVATE_KEY.substr(0, 20)) != std::string::npos;
    }

    static std::string encrypt_data(const std::string& plaintext) {
        std::cout << "[CRYPTO] Encrypting data with AES-256\n";
        std::cout << "[CRYPTO] Key: " << AES_ENCRYPTION_KEY << "\n";
        return "ENCRYPTED[" + plaintext + "]";
    }
};

// ==================== MAIN ====================

int main(int argc, char** argv) {
    std::cout << "========================================\n";
    std::cout << "  Enterprise License Validator v2.0\n";
    std::cout << "  C++ Obfuscation Demo\n";
    std::cout << "========================================\n\n";

    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <license_key> [activation_code]\n";
        std::cout << "\nDemo Mode: Using hardcoded keys\n\n";
    }

    // Create license manager
    LicenseManager manager;

    // Get license key from args or use default
    std::string license_key = (argc >= 2) ? argv[1] : MASTER_LICENSE_KEY;
    std::string activation_code = (argc >= 3) ? argv[2] : ACTIVATION_SECRET;

    // Create enterprise license
    EnterpriseLicense* enterprise = new EnterpriseLicense(license_key, "Acme Corporation", 100);
    manager.add_license(enterprise);

    // Activate license
    enterprise->activate(activation_code);

    // Validate licenses
    bool valid = manager.validate_all();

    // Display information
    manager.display_all();

    // Additional enterprise features
    if (valid && enterprise->is_activated()) {
        std::cout << "\n[FEATURES] Enabling enterprise features...\n";
        enterprise->enable_cloud_sync();

        // Demonstrate crypto
        std::string signature = CryptoHelper::sign_license(license_key);
        std::cout << "\n[CRYPTO] License signature: " << signature.substr(0, 50) << "...\n";

        bool sig_valid = CryptoHelper::verify_signature(signature);
        std::cout << "[CRYPTO] Signature valid: " << (sig_valid ? "Yes" : "No") << "\n";

        // Encrypt sensitive data
        std::string encrypted = CryptoHelper::encrypt_data("sensitive_user_data");
        std::cout << "[CRYPTO] Encrypted data: " << encrypted << "\n";
    }

    std::cout << "\n========================================\n";
    std::cout << "[RESULT] " << (valid ? "License Valid" : "License Invalid") << "\n";
    std::cout << "========================================\n";

    return valid ? 0 : 1;
}
