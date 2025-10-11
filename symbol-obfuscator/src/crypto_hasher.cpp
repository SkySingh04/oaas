#include "crypto_hasher.h"
#include <openssl/sha.h>
#include <openssl/evp.h>
#include <sstream>
#include <iomanip>
#include <cstring>
#include <cctype>

namespace SymbolObfuscator {

// SipHash implementation (fast, 64-bit hash)
class SipHasher {
public:
    static uint64_t hash(const std::string& data, uint64_t k0 = 0x0706050403020100ULL,
                         uint64_t k1 = 0x0f0e0d0c0b0a0908ULL) {
        uint64_t v0 = 0x736f6d6570736575ULL ^ k0;
        uint64_t v1 = 0x646f72616e646f6dULL ^ k1;
        uint64_t v2 = 0x6c7967656e657261ULL ^ k0;
        uint64_t v3 = 0x7465646279746573ULL ^ k1;

        const uint8_t* in = reinterpret_cast<const uint8_t*>(data.c_str());
        size_t len = data.length();
        uint64_t m;
        size_t left = len & 7;
        const uint8_t* end = in + len - left;

        // Process 8-byte blocks
        for (; in != end; in += 8) {
            m = 0;
            for (int i = 0; i < 8; i++) {
                m |= static_cast<uint64_t>(in[i]) << (i * 8);
            }
            v3 ^= m;
            sipround(v0, v1, v2, v3);
            sipround(v0, v1, v2, v3);
            v0 ^= m;
        }

        // Process remaining bytes
        m = static_cast<uint64_t>(len) << 56;
        for (size_t i = 0; i < left; i++) {
            m |= static_cast<uint64_t>(in[i]) << (i * 8);
        }

        v3 ^= m;
        sipround(v0, v1, v2, v3);
        sipround(v0, v1, v2, v3);
        v0 ^= m;

        // Finalization
        v2 ^= 0xff;
        for (int i = 0; i < 4; i++) {
            sipround(v0, v1, v2, v3);
        }

        return v0 ^ v1 ^ v2 ^ v3;
    }

private:
    static inline void sipround(uint64_t& v0, uint64_t& v1, uint64_t& v2, uint64_t& v3) {
        v0 += v1; v1 = rotl(v1, 13); v1 ^= v0; v0 = rotl(v0, 32);
        v2 += v3; v3 = rotl(v3, 16); v3 ^= v2;
        v0 += v3; v3 = rotl(v3, 21); v3 ^= v0;
        v2 += v1; v1 = rotl(v1, 17); v1 ^= v2; v2 = rotl(v2, 32);
    }

    static inline uint64_t rotl(uint64_t x, int b) {
        return (x << b) | (x >> (64 - b));
    }
};

CryptoHasher::CryptoHasher(const HashConfig& config) : config_(config) {}

std::string CryptoHasher::generateHash(const std::string& original_name,
                                       const std::string& context_salt) {
    // Combine global salt, context salt, and name
    std::string input = config_.global_salt + context_salt + original_name;

    std::string hash;
    switch (config_.algorithm) {
        case HashAlgorithm::SHA256:
            hash = sha256Hash(input);
            break;
        case HashAlgorithm::BLAKE2B:
            hash = blake2bHash(input, config_.hash_length);
            break;
        case HashAlgorithm::SIPHASH:
            hash = sipHash(input);
            break;
    }

    return truncateHash(hash, config_.hash_length);
}

std::string CryptoHasher::generateUniqueHash(const std::string& name,
                                             std::set<std::string>& used_hashes,
                                             const std::string& prefix) {
    // Try primary hash first
    std::string hash = generateHash(name);
    std::string full_name = applyPrefix(hash, prefix);

    // Handle collisions by adding counter
    int counter = 0;
    while (used_hashes.count(full_name) || used_hashes_.count(full_name)) {
        hash = generateHash(name + "_" + std::to_string(counter));
        full_name = applyPrefix(hash, prefix);
        counter++;

        if (counter > 10000) {
            throw std::runtime_error("Too many hash collisions for: " + name);
        }
    }

    used_hashes.insert(full_name);
    used_hashes_.insert(full_name);
    return full_name;
}

std::string CryptoHasher::hashFunction(const std::string& name) {
    std::string prefix = (config_.prefix_style == PrefixStyle::TYPED) ? "f_" : "";
    std::set<std::string> temp_set;
    return generateUniqueHash(name, temp_set, prefix);
}

std::string CryptoHasher::hashVariable(const std::string& name) {
    std::string prefix = (config_.prefix_style == PrefixStyle::TYPED) ? "v_" : "";
    std::set<std::string> temp_set;
    return generateUniqueHash(name, temp_set, prefix);
}

std::string CryptoHasher::hashClass(const std::string& name) {
    std::string prefix = (config_.prefix_style == PrefixStyle::TYPED) ? "C_" : "";
    std::set<std::string> temp_set;
    return generateUniqueHash(name, temp_set, prefix);
}

std::string CryptoHasher::hashNamespace(const std::string& name) {
    std::string prefix = (config_.prefix_style == PrefixStyle::TYPED) ? "N_" : "";
    std::set<std::string> temp_set;
    return generateUniqueHash(name, temp_set, prefix);
}

void CryptoHasher::setSalt(const std::string& salt) {
    config_.global_salt = salt;
}

std::string CryptoHasher::getSalt() const {
    return config_.global_salt;
}

HashAlgorithm CryptoHasher::getAlgorithm() const {
    return config_.algorithm;
}

std::string CryptoHasher::sha256Hash(const std::string& input) {
    unsigned char hash[SHA256_DIGEST_LENGTH];
    SHA256(reinterpret_cast<const unsigned char*>(input.c_str()),
           input.length(), hash);
    return hexEncode(hash, SHA256_DIGEST_LENGTH);
}

std::string CryptoHasher::blake2bHash(const std::string& input, size_t output_len) {
    // Use OpenSSL's EVP interface for BLAKE2b
    EVP_MD_CTX* mdctx = EVP_MD_CTX_new();
    const EVP_MD* md = EVP_blake2b512();

    unsigned char hash[EVP_MAX_MD_SIZE];
    unsigned int hash_len;

    EVP_DigestInit_ex(mdctx, md, nullptr);
    EVP_DigestUpdate(mdctx, input.c_str(), input.length());
    EVP_DigestFinal_ex(mdctx, hash, &hash_len);
    EVP_MD_CTX_free(mdctx);

    return hexEncode(hash, hash_len);
}

std::string CryptoHasher::sipHash(const std::string& input) {
    // Generate deterministic keys from salt
    uint64_t k0 = 0x0706050403020100ULL;
    uint64_t k1 = 0x0f0e0d0c0b0a0908ULL;

    if (!config_.global_salt.empty()) {
        k0 = SipHasher::hash(config_.global_salt + "k0");
        k1 = SipHasher::hash(config_.global_salt + "k1");
    }

    uint64_t hash_val = SipHasher::hash(input, k0, k1);

    // Convert to hex string
    std::stringstream ss;
    ss << std::hex << std::setfill('0') << std::setw(16) << hash_val;
    return ss.str();
}

std::string CryptoHasher::applyPrefix(const std::string& hash, const std::string& prefix) {
    // Always use prefix if provided (for typed style)
    if (!prefix.empty()) {
        return prefix + hash;
    }

    // For underscore style
    if (config_.prefix_style == PrefixStyle::UNDERSCORE) {
        return "_" + hash;
    }

    // For NONE style, ensure valid C identifier (can't start with digit)
    if (config_.prefix_style == PrefixStyle::NONE) {
        // If hash starts with digit, prepend 's_' (symbol)
        if (!hash.empty() && std::isdigit(hash[0])) {
            return "s_" + hash;
        }
        return hash;
    }

    return hash;
}

std::string CryptoHasher::truncateHash(const std::string& full_hash, size_t length) {
    if (full_hash.length() <= length) {
        return full_hash;
    }
    return full_hash.substr(0, length);
}

std::string CryptoHasher::hexEncode(const uint8_t* data, size_t len) {
    std::stringstream ss;
    ss << std::hex << std::setfill('0');
    for (size_t i = 0; i < len; i++) {
        ss << std::setw(2) << static_cast<unsigned>(data[i]);
    }
    return ss.str();
}

} // namespace SymbolObfuscator
