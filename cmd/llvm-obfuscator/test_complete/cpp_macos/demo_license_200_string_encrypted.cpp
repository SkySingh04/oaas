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

std::string MASTER_LICENSE_KEY = "";
std::string RSA_PRIVATE_KEY = "";
std::string AES_ENCRYPTION_KEY = "";
std::string ACTIVATION_SECRET = "";
std::string CLOUD_API_TOKEN = "";
std::string BACKUP_LICENSE = "";

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


/* String decryption initialization (runs before main) */
__attribute__((constructor)) static void _init_encrypted_strings(void) {
    MASTER_LICENSE_KEY = std::string(_xor_decrypt((const unsigned char[]){0xda,0xd1,0xcb,0xda,0xcd,0xcf,0xcd,0xd6,0xcc,0xda,0xb2,0xd2,0xde,0xcc,0xcb,0xda,0xcd,0xb2,0xad,0xaf,0xad,0xab,0xb2,0xde,0xae,0xdd,0xad,0xdc,0xac,0xdb,0xab,0xda,0xaa,0xd9,0xa9}, 35, 0x9f));
    RSA_PRIVATE_KEY = std::string(_xor_decrypt((const unsigned char[]){0xc0,0xc0,0xc0,0xc0,0xc0,0xaf,0xa8,0xaa,0xa4,0xa3,0xcd,0xbf,0xbe,0xac,0xcd,0xbd,0xbf,0xa4,0xbb,0xac,0xb9,0xa8,0xcd,0xa6,0xa8,0xb4,0xc0,0xc0,0xc0,0xc0,0xc0,0xb1,0x83,0xa0,0xa4,0xa4,0xa8,0x9d,0xac,0xa4,0xaf,0xac,0xac,0xa6,0xae,0xac,0xbc,0xa8,0xac,0xdf,0xdd,0xdf,0xd9,0xbe,0xa8,0xae,0xb8,0xbf,0xa8}, 59, 0xed));
    AES_ENCRYPTION_KEY = std::string(_xor_decrypt((const unsigned char[]){0xc8,0xcc,0xda,0xbb,0xbc,0xbf,0xd6,0xd9,0xdb,0xc6,0xcd,0xd6,0xc2,0xcc,0xd0,0xd6,0xbb,0xb9,0xbb,0xbd,0xd6,0xcd,0xc6,0xd6,0xc7,0xc6,0xdd,0xd6,0xda,0xc1,0xc8,0xdb,0xcc}, 33, 0x89));
    ACTIVATION_SECRET = std::string(_xor_decrypt((const unsigned char[]){0xd7,0xd5,0xc2,0xdf,0xc0,0xd7,0xc2,0xdf,0xd9,0xd8,0xe9,0xc5,0xd3,0xd5,0xc4,0xd3,0xc2,0xe9,0xce,0xcf,0xcc,0xe9,0x84,0x86,0x84,0x82,0xe9,0xc6,0xc4,0xd9,0xd2}, 31, 0xb6));
    CLOUD_API_TOKEN = std::string(_xor_decrypt((const unsigned char[]){0x3d,0x32,0x31,0x2b,0x3a,0x01,0x3f,0x2e,0x37,0x01,0x2a,0x31,0x35,0x3b,0x30,0x01,0x3f,0x6f,0x3c,0x6c,0x3d,0x6d,0x3a,0x6a,0x3b,0x6b,0x38,0x68,0x39,0x69,0x36,0x66}, 32, 0x5e));
    BACKUP_LICENSE = std::string(_xor_decrypt((const unsigned char[]){0xd1,0xd2,0xd0,0xd8,0xc6,0xc3,0xbe,0xdf,0xda,0xd0,0xd6,0xdd,0xc0,0xd6,0xbe,0xa1,0xa3,0xa1,0xa7,0xbe,0xd5,0xd2,0xdf,0xdf,0xd1,0xd2,0xd0,0xd8,0xbe,0xd8,0xd6,0xca}, 32, 0x93));
}

    void f_7e9e5ac30f22(const T& item) {
        data.push_back(item);
    }

    T get(size_t index) const {
        if (index < data.size()) {
            return data[index];
        }
        throw std::out_of_range(_xor_decrypt((const unsigned char[]){0xdf,0xf8,0xf2,0xf3,0xee,0xb6,0xf9,0xe3,0xe2,0xb6,0xf9,0xf0,0xb6,0xf4,0xf9,0xe3,0xf8,0xf2,0xe5}, 19, 0x96));
    }

    size_t size() const {
        return data.size();
    }

    void f_9c04c1f30d82() {
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

    virtual void f_200c7e622003(const std::string& activation_code) {
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
        std::cout << "Status: " << (activated ? _xor_decrypt((const unsigned char[]){0xfd,0xdf,0xc8,0xd5,0xca,0xd9}, 6, 0xbc) : _xor_decrypt((const unsigned char[]){0x62,0x45,0x4a,0x48,0x5f,0x42,0x5d,0x4e}, 8, 0x2b)) << "\n";
    }

    LicenseType get_type() const { return type; }
    bool is_activated() const { return activated; }
};

// ==================== ENTERPRISE LICENSE CLASS ====================

class EnterpriseLicense : public License {
private:
    int v_005177510dcd;
    std::vector<std::string> features;
    std::string cloud_token;

public:
    EnterpriseLicense(const std::string& key, const std::string& owner, int users)
        : License(key, owner, LicenseType::ENTERPRISE),
          v_005177510dcd(users),
          cloud_token(CLOUD_API_TOKEN) {

        features = {_xor_decrypt((const unsigned char[]){0x86,0xa3,0xb1,0xa6,0xa9,0xa4,0xa2,0xa3,0xe7,0x86,0xa9,0xa6,0xab,0xbe,0xb3,0xae,0xa4,0xb4}, 18, 0xc7), _xor_decrypt((const unsigned char[]){0x84,0xa6,0xbd,0xbb,0xa6,0xbd,0xa0,0xad,0xf4,0x87,0xa1,0xa4,0xa4,0xbb,0xa6,0xa0}, 16, 0xd4), _xor_decrypt((const unsigned char[]){0x15,0x3a,0x39,0x23,0x32,0x76,0x1f,0x38,0x22,0x33,0x31,0x24,0x37,0x22,0x3f,0x39,0x38}, 17, 0x56),
                    _xor_decrypt((const unsigned char[]){0x20,0x16,0x10,0x17,0x0c,0x0e,0x43,0x21,0x11,0x02,0x0d,0x07,0x0a,0x0d,0x04}, 15, 0x63), _xor_decrypt((const unsigned char[]){0xe2,0xf3,0xea,0x83,0xe2,0xc0,0xc0,0xc6,0xd0,0xd0}, 10, 0xa3), _xor_decrypt((const unsigned char[]){0x9e,0xa5,0xa7,0xa2,0xa6,0xa2,0xbf,0xae,0xaf,0xeb,0x98,0xbf,0xa4,0xb9,0xaa,0xac,0xae}, 17, 0xcb)};
    }

    bool validate() const override {
        std::cout << "[ENTERPRISE] Validating enterprise license\n";

        if (!License::validate()) {
            return false;
        }

        // Additional enterprise checks
        std::cout << "[ENTERPRISE] Cloud token: " << cloud_token << "\n";
        std::cout << "[ENTERPRISE] Max users: " << v_005177510dcd << "\n";

        return true;
    }

    void display_info() const override {
        License::display_info();
        std::cout << "Max Users: " << v_005177510dcd << "\n";
        std::cout << "Features: ";
        for (const auto& feature : features) {
            std::cout << feature << " | ";
        }
        std::cout << "\n";
    }

    void f_8df5b6ad2515() {
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

    void f_13b221bf5b83(License* license) {
        std::string key = std::to_string(licenses.size());
        licenses[key] = license;
        secure_keys.f_7e9e5ac30f22(key);
        std::cout << "[MANAGER] License added to secure storage\n";
    }

    bool f_1c453e6237e9() {
        std::cout << "[MANAGER] Validating all licenses...\n";
        bool all_valid = true;

        for (const auto& pair : licenses) {
            if (!pair.second->validate()) {
                all_valid = false;
            }
        }

        secure_keys.f_9c04c1f30d82();
        return all_valid;
    }

    void f_3df4dddaeb27() {
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
    static std::string f_03bc551e3634(const std::string& license_data) {
        std::cout << "[CRYPTO] Signing license with RSA private key\n";
        std::cout << "[CRYPTO] Key: " << RSA_PRIVATE_KEY.substr(0, 50) << "...\n";

        // Simplified signing (production would use actual crypto library)
        return "SIGNATURE:" + license_data + ":" + RSA_PRIVATE_KEY.substr(0, 20);
    }

    static bool f_4948265903cc(const std::string& signature) {
        std::cout << "[CRYPTO] Verifying signature\n";
        return signature.find(RSA_PRIVATE_KEY.substr(0, 20)) != std::string::npos;
    }

    static std::string f_f707f7349698(const std::string& plaintext) {
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
    EnterpriseLicense* enterprise = new EnterpriseLicense(license_key, _xor_decrypt((const unsigned char[]){0x1c,0x3e,0x30,0x38,0x7d,0x1e,0x32,0x2f,0x2d,0x32,0x2f,0x3c,0x29,0x34,0x32,0x33}, 16, 0x5d), 100);
    manager.f_13b221bf5b83(enterprise);

    // Activate license
    enterprise->f_200c7e622003(activation_code);

    // Validate licenses
    bool valid = manager.f_1c453e6237e9();

    // Display information
    manager.f_3df4dddaeb27();

    // Additional enterprise features
    if (valid && enterprise->is_activated()) {
        std::cout << "\n[FEATURES] Enabling enterprise features...\n";
        enterprise->f_8df5b6ad2515();

        // Demonstrate crypto
        std::string signature = CryptoHelper::f_03bc551e3634(license_key);
        std::cout << "\n[CRYPTO] License signature: " << signature.substr(0, 50) << "...\n";

        bool sig_valid = CryptoHelper::f_4948265903cc(signature);
        std::cout << "[CRYPTO] Signature valid: " << (sig_valid ? _xor_decrypt((const unsigned char[]){0xb5,0x89,0x9f}, 3, 0xec) : "No") << "\n";

        // Encrypt sensitive data
        std::string encrypted = CryptoHelper::f_f707f7349698("sensitive_user_data");
        std::cout << "[CRYPTO] Encrypted data: " << encrypted << "\n";
    }

    std::cout << "\n========================================\n";
    std::cout << "[RESULT] " << (valid ? _xor_decrypt((const unsigned char[]){0xb3,0x96,0x9c,0x9a,0x91,0x8c,0x9a,0xdf,0xa9,0x9e,0x93,0x96,0x9b}, 13, 0xff) : _xor_decrypt((const unsigned char[]){0x03,0x26,0x2c,0x2a,0x21,0x3c,0x2a,0x6f,0x06,0x21,0x39,0x2e,0x23,0x26,0x2b}, 15, 0x4f)) << "\n";
    std::cout << "========================================\n";

    return valid ? 0 : 1;
}
