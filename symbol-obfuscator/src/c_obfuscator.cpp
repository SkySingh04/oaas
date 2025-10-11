#include "c_obfuscator.h"
#include <fstream>
#include <sstream>
#include <regex>
#include <algorithm>
#include <iostream>
#include <json/json.h>

namespace SymbolObfuscator {

CSymbolObfuscator::CSymbolObfuscator(const ObfuscationConfig& config)
    : config_(config), hasher_(config.hash_config) {}

void CSymbolObfuscator::obfuscateSymbols(const std::string& input_file,
                                         const std::string& output_file) {
    // Step 1: Read source file
    std::string source_code = readFile(input_file);

    // Step 2: Analyze symbols
    std::vector<SymbolMapping> symbols = analyzeSymbols(input_file);

    // Step 3: Generate obfuscation mapping
    std::map<std::string, std::string> mapping = generateMapping(symbols);

    // Step 4: Apply obfuscation
    std::string obfuscated_code;
    applyObfuscation(source_code, mapping, obfuscated_code);

    // Step 5: Write output
    writeFile(output_file, obfuscated_code);

    // Step 6: Export mapping if requested
    if (config_.generate_map) {
        exportMapping(config_.map_file_path);
    }
}

std::vector<SymbolMapping> CSymbolObfuscator::analyzeSymbols(const std::string& source_file) {
    std::vector<SymbolMapping> symbols;
    std::string source_code = readFile(source_file);

    parseDeclarations(source_code, symbols);

    return symbols;
}

std::map<std::string, std::string> CSymbolObfuscator::generateMapping(
    const std::vector<SymbolMapping>& symbols) {

    std::map<std::string, std::string> mapping;

    for (const auto& symbol : symbols) {
        // Skip if should preserve
        if (shouldPreserve(symbol.original_name)) {
            continue;
        }

        // Generate obfuscated name based on symbol type
        // The hash functions already handle uniqueness and prefixing
        std::string obfuscated;

        switch (symbol.type) {
            case SymbolType::FUNCTION:
                obfuscated = hasher_.hashFunction(symbol.original_name);
                break;

            case SymbolType::GLOBAL_VAR:
            case SymbolType::STATIC_VAR:
                obfuscated = hasher_.hashVariable(symbol.original_name);
                break;

            case SymbolType::STRUCT:
                obfuscated = hasher_.hashClass(symbol.original_name);
                break;

            default:
                obfuscated = hasher_.hashVariable(symbol.original_name);
                break;
        }

        // hashFunction/hashVariable already ensure uniqueness, just track it
        used_names_.insert(obfuscated);

        mapping[symbol.original_name] = obfuscated;

        // Store in mappings for export
        SymbolMapping mapped_symbol = symbol;
        mapped_symbol.obfuscated_name = obfuscated;
        mappings_.push_back(mapped_symbol);
    }

    return mapping;
}

void CSymbolObfuscator::applyObfuscation(const std::string& source_code,
                                        const std::map<std::string, std::string>& mapping,
                                        std::string& obfuscated_code) {
    obfuscated_code = source_code;

    // Sort by length (longest first) to avoid partial replacements
    std::vector<std::pair<std::string, std::string>> sorted_mapping(mapping.begin(), mapping.end());
    std::sort(sorted_mapping.begin(), sorted_mapping.end(),
              [](const auto& a, const auto& b) { return a.first.length() > b.first.length(); });

    // Replace each symbol
    for (const auto& [original, obfuscated] : sorted_mapping) {
        replaceSymbol(obfuscated_code, original, obfuscated);
    }
}

bool CSymbolObfuscator::shouldPreserve(const std::string& symbol_name) const {
    // C/C++ keywords that must never be obfuscated
    static const std::set<std::string> cpp_keywords = {
        "if", "else", "for", "while", "do", "switch", "case", "default",
        "break", "continue", "return", "goto",
        "int", "char", "float", "double", "void", "long", "short", "signed", "unsigned",
        "const", "static", "extern", "register", "volatile", "auto",
        "struct", "union", "enum", "typedef",
        "sizeof", "typeof",
        "class", "public", "private", "protected", "virtual", "friend",
        "namespace", "using", "template", "typename",
        "new", "delete", "this", "operator",
        "try", "catch", "throw",
        "true", "false", "nullptr", "NULL",
        "and", "or", "not", "xor",
        "main" // Preserve main entry point
    };

    // Check if it's a C/C++ keyword
    if (cpp_keywords.count(symbol_name)) {
        return true;
    }

    // Check explicit preserve list
    if (config_.preserve_symbols.count(symbol_name)) {
        return true;
    }

    // Check patterns
    if (matchesPreservePattern(symbol_name)) {
        return true;
    }

    return false;
}

bool CSymbolObfuscator::matchesPreservePattern(const std::string& symbol_name) const {
    for (const auto& pattern : config_.preserve_patterns) {
        std::regex regex_pattern(pattern);
        if (std::regex_search(symbol_name, regex_pattern)) {
            return true;
        }
    }
    return false;
}

const std::vector<SymbolMapping>& CSymbolObfuscator::getMappings() const {
    return mappings_;
}

void CSymbolObfuscator::exportMapping(const std::string& file_path) const {
    Json::Value root;
    Json::Value symbols(Json::arrayValue);

    for (const auto& mapping : mappings_) {
        Json::Value symbol;
        symbol["original"] = mapping.original_name;
        symbol["obfuscated"] = mapping.obfuscated_name;
        symbol["type"] = static_cast<int>(mapping.type);
        symbol["linkage"] = static_cast<int>(mapping.linkage);
        symbol["address"] = Json::Value::UInt64(mapping.address);
        symbol["size"] = Json::Value::UInt64(mapping.size);
        symbol["source_file"] = mapping.source_file;
        symbol["line"] = mapping.line_number;
        symbols.append(symbol);
    }

    root["symbols"] = symbols;
    root["version"] = "1.0";
    root["hash_algorithm"] = static_cast<int>(hasher_.getAlgorithm());

    std::ofstream out(file_path);
    Json::StyledWriter writer;
    out << writer.write(root);
}

void CSymbolObfuscator::importMapping(const std::string& file_path) {
    std::ifstream in(file_path);
    Json::Value root;
    Json::Reader reader;

    if (!reader.parse(in, root)) {
        throw std::runtime_error("Failed to parse mapping file: " + file_path);
    }

    mappings_.clear();
    const Json::Value symbols = root["symbols"];

    for (const auto& symbol : symbols) {
        SymbolMapping mapping;
        mapping.original_name = symbol["original"].asString();
        mapping.obfuscated_name = symbol["obfuscated"].asString();
        mapping.type = static_cast<SymbolType>(symbol["type"].asInt());
        mapping.linkage = static_cast<Linkage>(symbol["linkage"].asInt());
        mapping.address = symbol["address"].asUInt64();
        mapping.size = symbol["size"].asUInt64();
        mapping.source_file = symbol["source_file"].asString();
        mapping.line_number = symbol["line"].asInt();
        mappings_.push_back(mapping);
    }
}

// Private helper methods

void CSymbolObfuscator::parseDeclarations(const std::string& source_code,
                                         std::vector<SymbolMapping>& symbols) {
    // Function declarations
    // Pattern: return_type function_name(params)
    std::regex func_pattern(R"(\b([a-zA-Z_][a-zA-Z0-9_]*)\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*\([^)]*\)\s*\{)");
    std::smatch match;

    std::string::const_iterator search_start(source_code.cbegin());
    while (std::regex_search(search_start, source_code.cend(), match, func_pattern)) {
        SymbolMapping symbol;
        symbol.original_name = match[2].str();
        symbol.type = SymbolType::FUNCTION;
        symbol.linkage = Linkage::EXTERNAL;  // Simplified
        symbol.address = 0;
        symbol.size = 0;
        symbol.line_number = 0;

        if (!shouldPreserve(symbol.original_name)) {
            symbols.push_back(symbol);
        }

        search_start = match.suffix().first;
    }

    // Global variable declarations
    // Pattern: type var_name = value; or type var_name;
    std::regex var_pattern(R"(\b(int|char|float|double|long|short|void\*|size_t|uint\d+_t)\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*[;=])");

    search_start = source_code.cbegin();
    while (std::regex_search(search_start, source_code.cend(), match, var_pattern)) {
        SymbolMapping symbol;
        symbol.original_name = match[2].str();
        symbol.type = SymbolType::GLOBAL_VAR;
        symbol.linkage = Linkage::EXTERNAL;
        symbol.address = 0;
        symbol.size = 0;
        symbol.line_number = 0;

        if (!shouldPreserve(symbol.original_name)) {
            symbols.push_back(symbol);
        }

        search_start = match.suffix().first;
    }
}

void CSymbolObfuscator::replaceSymbol(std::string& code, const std::string& original,
                                     const std::string& obfuscated) {
    size_t pos = 0;
    while ((pos = code.find(original, pos)) != std::string::npos) {
        // Check if this is a whole word (not part of another identifier)
        if (isWholeWord(code, pos, original)) {
            code.replace(pos, original.length(), obfuscated);
            pos += obfuscated.length();
        } else {
            pos += original.length();
        }
    }
}

bool CSymbolObfuscator::isIdentifierChar(char c) const {
    return std::isalnum(c) || c == '_';
}

bool CSymbolObfuscator::isWholeWord(const std::string& text, size_t pos,
                                   const std::string& word) const {
    // Check character before
    if (pos > 0 && isIdentifierChar(text[pos - 1])) {
        return false;
    }

    // Check character after
    size_t end_pos = pos + word.length();
    if (end_pos < text.length() && isIdentifierChar(text[end_pos])) {
        return false;
    }

    return true;
}

// Utility functions

std::string readFile(const std::string& path) {
    std::ifstream file(path);
    if (!file.is_open()) {
        throw std::runtime_error("Cannot open file: " + path);
    }

    std::stringstream buffer;
    buffer << file.rdbuf();
    return buffer.str();
}

void writeFile(const std::string& path, const std::string& content) {
    std::ofstream file(path);
    if (!file.is_open()) {
        throw std::runtime_error("Cannot write file: " + path);
    }
    file << content;
}

std::vector<std::string> extractFunctionNames(const std::string& source) {
    std::vector<std::string> names;
    std::regex func_pattern(R"(\b([a-zA-Z_][a-zA-Z0-9_]*)\s*\([^)]*\)\s*\{)");
    std::smatch match;

    std::string::const_iterator search_start(source.cbegin());
    while (std::regex_search(search_start, source.cend(), match, func_pattern)) {
        names.push_back(match[1].str());
        search_start = match.suffix().first;
    }

    return names;
}

std::vector<std::string> extractGlobalVariables(const std::string& source) {
    std::vector<std::string> names;
    // Simplified extraction
    std::regex var_pattern(R"(^\s*(int|char|float|double|long)\s+([a-zA-Z_][a-zA-Z0-9_]*)\s*[;=])");
    std::smatch match;

    std::istringstream stream(source);
    std::string line;

    while (std::getline(stream, line)) {
        if (std::regex_search(line, match, var_pattern)) {
            names.push_back(match[2].str());
        }
    }

    return names;
}

} // namespace SymbolObfuscator
