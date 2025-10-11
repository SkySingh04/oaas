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
char* ENCRYPTION_KEY = NULL;
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

/* String decryption initialization (runs before main) */
__attribute__((constructor)) static void _init_encrypted_strings(void) {
    ENCRYPTION_KEY = _xor_decrypt((const unsigned char[]){0xde,0xda,0xcc,0xad,0xaa,0xa9,0xc0,0xcc,0xda,0xdc,0xcd,0xda,0xcb,0xc0,0xd4,0xda,0xc6,0xc0,0xdb,0xd0,0xc0,0xd1,0xd0,0xcb,0xc0,0xcc,0xd7,0xde,0xcd,0xda}, 30, 0x9f);
}

int get_license_tier(const char* license_key) {
    if (!license_key) {
        return -1;
    }

    if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xaf,0xac,0xbe,0xa4,0xae}, 5, 0xed), 5) == 0) {
        return 0;
    } else if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xd9,0xdb,0xc6}, 3, 0x89), 3) == 0) {
        return 1;
    } else if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0xf3,0xf8,0xe2,0xf3,0xe4,0xe6,0xe4,0xff,0xe5,0xf3}, 10, 0xb6), 10) == 0) {
        return 2;
    } else if (strncmp(license_key, _xor_decrypt((const unsigned char[]){0x12,0x17,0x18,0x1b,0x0a,0x17,0x13,0x1b}, 8, 0x5e), 8) == 0) {
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
        case 0: return _xor_decrypt((const unsigned char[]){0xd1,0xd2,0xc0,0xda,0xd0}, 5, 0x93);
        case 1: return _xor_decrypt((const unsigned char[]){0xc6,0xc4,0xd9}, 3, 0x96);
        case 2: return _xor_decrypt((const unsigned char[]){0xf9,0xf2,0xe8,0xf9,0xee,0xec,0xee,0xf5,0xef,0xf9}, 10, 0xbc);
        case 3: return _xor_decrypt((const unsigned char[]){0x67,0x62,0x6d,0x6e,0x7f,0x62,0x66,0x6e}, 8, 0x2b);
        default: return _xor_decrypt((const unsigned char[]){0x8e,0x89,0x91,0x86,0x8b,0x8e,0x83}, 7, 0xc7);
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
    std::cout << "  Encryption: " << (info.has_encryption ? _xor_decrypt((const unsigned char[]){0x91,0x9a,0x95,0x96,0x98,0x91,0x90}, 7, 0xd4) : _xor_decrypt((const unsigned char[]){0x12,0x1f,0x05,0x17,0x14,0x1a,0x13,0x12}, 8, 0x56)) << "\n";
    std::cout << "  Premium Features: " << (info.has_premium_features ? _xor_decrypt((const unsigned char[]){0x26,0x2d,0x22,0x21,0x2f,0x26,0x27}, 7, 0x63) : _xor_decrypt((const unsigned char[]){0xe7,0xea,0xf0,0xe2,0xe1,0xef,0xe6,0xe7}, 8, 0xa3)) << "\n";

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
