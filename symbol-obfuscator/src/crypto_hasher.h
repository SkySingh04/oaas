#ifndef CRYPTO_HASHER_H
#define CRYPTO_HASHER_H

#include <string>
#include <set>
#include <cstdint>
#include <memory>

namespace SymbolObfuscator {

enum class HashAlgorithm {
    SHA256,      // Most secure, 256-bit output (truncated to 12 chars)
    BLAKE2B,     // Fast and secure, variable length
    SIPHASH      // Very fast, 64-bit output (for large binaries)
};

enum class PrefixStyle {
    NONE,        // Pure hash: "a7f3b2c8d9e4"
    TYPED,       // Type prefix: "f_a7f3b2c8" (function), "v_d9e4f5a6" (variable)
    UNDERSCORE   // Traditional: "_a7f3b2c8d9e4"
};

struct HashConfig {
    HashAlgorithm algorithm = HashAlgorithm::SHA256;
    PrefixStyle prefix_style = PrefixStyle::TYPED;
    size_t hash_length = 12;           // Characters to use from hash
    std::string global_salt = "";       // Optional global salt
    bool deterministic = true;          // Same input always produces same output
};

class CryptoHasher {
public:
    explicit CryptoHasher(const HashConfig& config = HashConfig());

    // Generate hash from symbol name
    std::string generateHash(const std::string& original_name,
                            const std::string& context_salt = "");

    // Generate unique hash (handles collisions automatically)
    std::string generateUniqueHash(const std::string& name,
                                   std::set<std::string>& used_hashes,
                                   const std::string& prefix = "");

    // Generate hash for specific symbol types
    std::string hashFunction(const std::string& name);
    std::string hashVariable(const std::string& name);
    std::string hashClass(const std::string& name);
    std::string hashNamespace(const std::string& name);

    // Utility functions
    void setSalt(const std::string& salt);
    std::string getSalt() const;
    HashAlgorithm getAlgorithm() const;

private:
    HashConfig config_;
    std::set<std::string> used_hashes_;

    // Hash implementations
    std::string sha256Hash(const std::string& input);
    std::string blake2bHash(const std::string& input, size_t output_len);
    std::string sipHash(const std::string& input);

    // Helper functions
    std::string applyPrefix(const std::string& hash, const std::string& prefix);
    std::string truncateHash(const std::string& full_hash, size_t length);
    std::string hexEncode(const uint8_t* data, size_t len);
};

} // namespace SymbolObfuscator

#endif // CRYPTO_HASHER_H
