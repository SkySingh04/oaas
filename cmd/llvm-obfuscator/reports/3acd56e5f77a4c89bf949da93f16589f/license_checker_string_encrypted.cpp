/**
 * Software License Validation System
 * Demonstrates license key validation, expiration checks, and feature flags
 * Perfect example of code that needs obfuscation to prevent piracy
 */

#include <iostream>
#include <string>
#include <cstring>
#include <cstdlib>

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


// License keys for different tiers
const char* VALID_LICENSE_KEYS[] = {
    "BASIC-1A2B-3C4D-5E6F",
    "PRO-7G8H-9I0J-1K2L",
    "ENTERPRISE-3M4N-5O6P-7Q8R",
    "LIFETIME-9S0T-1U2V-3W4X"
};

const int NUM_LICENSE_KEYS = 4;

// Feature flags
const char* ENCRYPTION_KEY = "AES256_SECRET_KEY_DO_NOT_SHARE";
const int PREMIUM_FEATURES_ENABLED = 1;
const int TRIAL_DAYS = 30;

// License validation result
struct LicenseInfo {
    bool is_valid;
    int tier_level;  // 0=basic, 1=pro, 2=enterprise, 3=lifetime
    bool has_encryption;
    bool has_premium_features;
    int days_remaining;
};

// Check if license key is valid
bool is_license_valid(const char* license_key) {
    if (!license_key) {
        return false;
    }

    for (int i = 0; i < NUM_LICENSE_KEYS; i++) {
        if (strcmp(license_key, VALID_LICENSE_KEYS[i]) == 0) {
            return true;
        }
    }

    return false;
}

// Get license tier from key
int get_license_tier(const char* license_key) {
    if (!license_key) {
        return -1;
    }

    if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xdd,0xde,0xcc,0xd6,0xdc}, 5, 0x9f), 5) == 0) {
        return 0;
    } else if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xbd,0xbf,0xa2}, 3, 0xed), 3) == 0) {
        return 1;
    } else if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xcc,0xc7,0xdd,0xcc,0xdb,0xd9,0xdb,0xc0,0xda,0xcc}, 10, 0x89), 10) == 0) {
        return 2;
    } else if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xfa,0xff,0xf0,0xf3,0xe2,0xff,0xfb,0xf3}, 8, 0xb6), 8) == 0) {
        return 3;
    }

    return -1;
}

// Check if encryption features are available
bool has_encryption_features(int tier_level) {
    // Only PRO and above get encryption
    return tier_level >= 1;
}

// Check if premium features are enabled
bool has_premium_access(int tier_level) {
    // Only ENTERPRISE and LIFETIME get premium features
    return tier_level >= 2;
}

// Calculate remaining trial days
int calculate_trial_days(int days_used) {
    int remaining = TRIAL_DAYS - days_used;
    return remaining > 0 ? remaining : 0;
}

// Validate license and return full info
LicenseInfo validate_license(const char* license_key, int days_used) {
    LicenseInfo info;
    info.is_valid = false;
    info.tier_level = -1;
    info.has_encryption = false;
    info.has_premium_features = false;
    info.days_remaining = 0;

    if (!is_license_valid(license_key)) {
        return info;
    }

    info.is_valid = true;
    info.tier_level = get_license_tier(license_key);
    info.has_encryption = has_encryption_features(info.tier_level);
    info.has_premium_features = has_premium_access(info.tier_level);

    if (info.tier_level < 3) {  // Not lifetime
        info.days_remaining = calculate_trial_days(days_used);
    } else {
        info.days_remaining = -1;  // Unlimited
    }

    return info;
}

// Get encryption key (highly sensitive)
const char* get_encryption_key(int tier_level) {
    if (has_encryption_features(tier_level)) {
        return ENCRYPTION_KEY;
    }
    return nullptr;
}

// Print license tier name
const char* get_tier_name(int tier_level) {
    switch (tier_level) {
        case 0: return _xor_decrypt((const unsigned char[]){0x1c,0x1f,0x0d,0x17,0x1d}, 5, 0x5e);
        case 1: return _xor_decrypt((const unsigned char[]){0xc3,0xc1,0xdc}, 3, 0x93);
        case 2: return _xor_decrypt((const unsigned char[]){0xd3,0xd8,0xc2,0xd3,0xc4,0xc6,0xc4,0xdf,0xc5,0xd3}, 10, 0x96);
        case 3: return _xor_decrypt((const unsigned char[]){0xf0,0xf5,0xfa,0xf9,0xe8,0xf5,0xf1,0xf9}, 8, 0xbc);
        default: return _xor_decrypt((const unsigned char[]){0x62,0x65,0x7d,0x6a,0x67,0x62,0x6f}, 7, 0x2b);
    }
}

int main(int argc, char** argv) {
    std::cout << "=== Software License Validation System ===\n\n";

    if (argc < 2) {
        std::cout << "Usage: " << argv[0] << " <license_key> [days_used]\n";
        std::cout << "\nValid test keys:\n";
        std::cout << "  BASIC-1A2B-3C4D-5E6F (Basic tier)\n";
        std::cout << "  PRO-7G8H-9I0J-1K2L (Pro tier)\n";
        std::cout << "  ENTERPRISE-3M4N-5O6P-7Q8R (Enterprise tier)\n";
        std::cout << "  LIFETIME-9S0T-1U2V-3W4X (Lifetime tier)\n";
        return 1;
    }

    const char* license_key = argv[1];
    int days_used = (argc >= 3) ? atoi(argv[2]) : 0;

    std::cout << "Validating license key: " << license_key << "\n\n";

    LicenseInfo info = validate_license(license_key, days_used);

    if (!info.is_valid) {
        std::cout << "❌ INVALID LICENSE KEY!\n";
        std::cout << "Software activation failed.\n";
        return 1;
    }

    std::cout << "✓ License validated successfully!\n\n";
    std::cout << "License Details:\n";
    std::cout << "  Tier: " << get_tier_name(info.tier_level) << "\n";
    std::cout << "  Encryption: " << (info.has_encryption ? _xor_decrypt((const unsigned char[]){0x82,0x89,0x86,0x85,0x8b,0x82,0x83}, 7, 0xc7) : _xor_decrypt((const unsigned char[]){0x90,0x9d,0x87,0x95,0x96,0x98,0x91,0x90}, 8, 0xd4)) << "\n";
    std::cout << "  Premium Features: " << (info.has_premium_features ? _xor_decrypt((const unsigned char[]){0x13,0x18,0x17,0x14,0x1a,0x13,0x12}, 7, 0x56) : _xor_decrypt((const unsigned char[]){0x27,0x2a,0x30,0x22,0x21,0x2f,0x26,0x27}, 8, 0x63)) << "\n";

    if (info.days_remaining == -1) {
        std::cout << "  Expiration: NEVER (Lifetime)\n";
    } else if (info.days_remaining > 0) {
        std::cout << "  Days Remaining: " << info.days_remaining << "\n";
    } else {
        std::cout << "  ⚠ LICENSE EXPIRED!\n";
        return 1;
    }

    // Show encryption key for authorized tiers
    if (info.has_encryption) {
        const char* enc_key = get_encryption_key(info.tier_level);
        std::cout << "\n🔐 Encryption Key: " << enc_key << "\n";
    }

    std::cout << "\n✓ Software activation successful!\n";
    return 0;
}
