#ifndef C_OBFUSCATOR_H
#define C_OBFUSCATOR_H

#include "crypto_hasher.h"
#include <string>
#include <vector>
#include <map>
#include <set>

namespace SymbolObfuscator {

enum class SymbolType {
    FUNCTION,
    GLOBAL_VAR,
    STATIC_VAR,
    LOCAL_VAR,
    TYPEDEF,
    STRUCT,
    ENUM,
    UNKNOWN
};

enum class Linkage {
    EXTERNAL,    // Visible outside translation unit
    INTERNAL,    // static, file-local
    WEAK,        // weak symbols
    COMMON       // Common symbols
};

struct SymbolMapping {
    std::string original_name;
    std::string obfuscated_name;
    SymbolType type;
    Linkage linkage;
    uint64_t address;
    size_t size;
    std::string source_file;
    int line_number;
};

struct ObfuscationConfig {
    // Symbols to preserve (never obfuscate)
    std::set<std::string> preserve_symbols = {
        "main",           // Program entry point
        "_start",         // ELF entry point
        "__libc_start_main",
        "signal",         // Signal handlers
        "sigaction",
        "_init",          // Init/fini functions
        "_fini",
        "__attribute__"   // Compiler attributes
    };

    // Preserve symbols matching patterns
    std::vector<std::string> preserve_patterns = {
        "^__",           // Compiler/system reserved (double underscore)
        "^_Z",           // C++ mangled names (handled separately)
        "^llvm\\.",      // LLVM intrinsics
        "^__cxa_"        // C++ ABI functions
    };

    // Aggressively obfuscate static functions
    bool aggressive_static = true;

    // Obfuscate string literals (function names in debug)
    bool obfuscate_strings = false;

    // Generate debug mapping file
    bool generate_map = true;
    std::string map_file_path = "symbol_map.json";

    // Hash configuration
    HashConfig hash_config;
};

class CSymbolObfuscator {
public:
    explicit CSymbolObfuscator(const ObfuscationConfig& config = ObfuscationConfig());

    // Main obfuscation interface
    void obfuscateSymbols(const std::string& input_file,
                         const std::string& output_file);

    // Symbol analysis
    std::vector<SymbolMapping> analyzeSymbols(const std::string& source_file);

    // Generate obfuscation mapping
    std::map<std::string, std::string> generateMapping(
        const std::vector<SymbolMapping>& symbols);

    // Apply obfuscation to source code
    void applyObfuscation(const std::string& source_code,
                         const std::map<std::string, std::string>& mapping,
                         std::string& obfuscated_code);

    // Preserve/check functions
    bool shouldPreserve(const std::string& symbol_name) const;
    bool matchesPreservePattern(const std::string& symbol_name) const;

    // Get mappings
    const std::vector<SymbolMapping>& getMappings() const;

    // Export mapping to file
    void exportMapping(const std::string& file_path) const;
    void importMapping(const std::string& file_path);

private:
    ObfuscationConfig config_;
    CryptoHasher hasher_;
    std::vector<SymbolMapping> mappings_;
    std::set<std::string> used_names_;

    // Symbol detection helpers
    SymbolType detectSymbolType(const std::string& declaration);
    Linkage detectLinkage(const std::string& declaration);

    // AST-based analysis (simplified)
    void parseDeclarations(const std::string& source_code,
                          std::vector<SymbolMapping>& symbols);
    void parseFunctionDeclaration(const std::string& decl,
                                  SymbolMapping& symbol);
    void parseVariableDeclaration(const std::string& decl,
                                  SymbolMapping& symbol);

    // Code rewriting helpers
    void replaceSymbol(std::string& code, const std::string& original,
                      const std::string& obfuscated);
    bool isIdentifierChar(char c) const;
    bool isWholeWord(const std::string& text, size_t pos,
                    const std::string& word) const;
};

// Utility functions
std::string readFile(const std::string& path);
void writeFile(const std::string& path, const std::string& content);
std::vector<std::string> extractFunctionNames(const std::string& source);
std::vector<std::string> extractGlobalVariables(const std::string& source);

} // namespace SymbolObfuscator

#endif // C_OBFUSCATOR_H
