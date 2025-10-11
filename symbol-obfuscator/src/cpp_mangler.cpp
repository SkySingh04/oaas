#include "cpp_mangler.h"
#include <cxxabi.h>
#include <sstream>
#include <regex>
#include <memory>

namespace SymbolObfuscator {

// ============================================================================
// CppDemangler Implementation
// ============================================================================

std::string CppDemangler::demangle(const std::string& mangled_name) {
    int status = 0;
    char* demangled = abi::__cxa_demangle(mangled_name.c_str(), nullptr, nullptr, &status);

    if (status == 0 && demangled) {
        std::string result(demangled);
        free(demangled);
        return result;
    }

    return mangled_name; // Return original if demangling fails
}

CppSymbolComponents CppDemangler::parse(const std::string& mangled_name) {
    CppSymbolComponents components;

    if (!isCppMangled(mangled_name)) {
        components.is_mangled = false;
        return components;
    }

    components.is_mangled = true;
    components.prefix = "_Z";

    // Check for special symbols
    if (mangled_name.substr(0, 4) == "_ZTV") {
        components.is_vtable = true;
        return components;
    }
    if (mangled_name.substr(0, 4) == "_ZTI") {
        components.is_typeinfo = true;
        return components;
    }
    if (mangled_name.substr(0, 4) == "_ZTS") {
        components.is_typeinfo_name = true;
        return components;
    }

    // Demangle to get readable form
    std::string demangled = demangle(mangled_name);
    components.method_name = demangled; // Store full demangled for reference

    // Parse nested names (simplified)
    size_t pos = 2; // Skip _Z

    if (pos < mangled_name.length() && mangled_name[pos] == 'N') {
        components.has_namespace = true;
        pos++; // Skip N

        // Parse nested components until we hit 'E'
        while (pos < mangled_name.length() && mangled_name[pos] != 'E') {
            // Read length-prefixed name
            size_t len = 0;
            while (pos < mangled_name.length() && std::isdigit(mangled_name[pos])) {
                len = len * 10 + (mangled_name[pos] - '0');
                pos++;
            }

            if (len > 0 && pos + len <= mangled_name.length()) {
                std::string component = mangled_name.substr(pos, len);

                // First component is likely namespace or class
                if (components.namespace_name.empty()) {
                    components.namespace_name = component;
                } else if (!components.has_class) {
                    components.class_name = component;
                    components.has_class = true;
                } else {
                    components.method_name = component;
                }

                pos += len;
            } else {
                break;
            }
        }
    }

    return components;
}

bool CppDemangler::isCppMangled(const std::string& name) {
    return name.length() > 2 && name.substr(0, 2) == "_Z";
}

bool CppDemangler::isSpecialSymbol(const std::string& name) {
    if (name.length() < 4) return false;

    std::string prefix = name.substr(0, 4);
    return prefix == "_ZTV" || prefix == "_ZTI" || prefix == "_ZTS";
}

// ============================================================================
// CppMangler Implementation
// ============================================================================

CppMangler::CppMangler(CryptoHasher& hasher) : hasher_(hasher) {}

std::string CppMangler::obfuscateCppSymbol(const std::string& mangled_name) {
    // Check if already obfuscated
    if (mapping_.count(mangled_name)) {
        return mapping_[mangled_name];
    }

    // Parse components
    CppSymbolComponents components = CppDemangler::parse(mangled_name);

    if (!components.is_mangled) {
        return mangled_name; // Not a C++ symbol
    }

    // Handle special symbols
    if (components.is_vtable) {
        return obfuscateVTable(mangled_name);
    }
    if (components.is_typeinfo) {
        return obfuscateTypeInfo(mangled_name);
    }
    if (components.is_typeinfo_name) {
        return obfuscateTypeInfo(mangled_name); // Same treatment
    }

    // Obfuscate regular mangled symbol
    std::string obfuscated = reconstructMangled(components);

    mapping_[mangled_name] = obfuscated;
    return obfuscated;
}

std::string CppMangler::obfuscateVTable(const std::string& vtable_symbol) {
    // _ZTV6MyClass -> _ZTV7C_a7f3b2c8
    // Preserve _ZTV prefix, obfuscate class name

    if (mapping_.count(vtable_symbol)) {
        return mapping_[vtable_symbol];
    }

    std::string prefix = "_ZTV";
    std::string rest = vtable_symbol.substr(4);

    // Extract class name (length-prefixed)
    size_t pos = 0;
    size_t len = 0;
    while (pos < rest.length() && std::isdigit(rest[pos])) {
        len = len * 10 + (rest[pos] - '0');
        pos++;
    }

    if (len > 0 && pos + len <= rest.length()) {
        std::string class_name = rest.substr(pos, len);
        std::string obfuscated_class = obfuscateClassName(class_name);
        std::string result = prefix + encodeLengthPrefix(obfuscated_class);

        mapping_[vtable_symbol] = result;
        return result;
    }

    // Fallback: hash entire symbol
    std::string obfuscated = prefix + hasher_.generateHash(vtable_symbol, "vtable");
    mapping_[vtable_symbol] = obfuscated;
    return obfuscated;
}

std::string CppMangler::obfuscateTypeInfo(const std::string& typeinfo_symbol) {
    // Similar to vtable obfuscation
    if (mapping_.count(typeinfo_symbol)) {
        return mapping_[typeinfo_symbol];
    }

    std::string prefix = typeinfo_symbol.substr(0, 4); // _ZTI or _ZTS
    std::string hash = hasher_.generateHash(typeinfo_symbol, "typeinfo");
    std::string obfuscated = prefix + hash.substr(0, 10);

    mapping_[typeinfo_symbol] = obfuscated;
    return obfuscated;
}

std::string CppMangler::obfuscateConstructor(const std::string& ctor_symbol) {
    // Constructor symbols: _ZN6MyClassC1Ev (C1 = complete object constructor)
    return obfuscateCppSymbol(ctor_symbol);
}

std::string CppMangler::obfuscateDestructor(const std::string& dtor_symbol) {
    // Destructor symbols: _ZN6MyClassD1Ev (D1 = complete object destructor)
    return obfuscateCppSymbol(dtor_symbol);
}

const std::map<std::string, std::string>& CppMangler::getMapping() const {
    return mapping_;
}

// Private helper methods

std::string CppMangler::obfuscateNamespace(const std::string& ns) {
    // Check cache
    if (namespace_cache_.count(ns)) {
        return namespace_cache_[ns];
    }

    std::string obfuscated = "N" + hasher_.generateHash(ns, "ns").substr(0, 8);
    namespace_cache_[ns] = obfuscated;
    return obfuscated;
}

std::string CppMangler::obfuscateClassName(const std::string& class_name) {
    // Check cache
    if (class_cache_.count(class_name)) {
        return class_cache_[class_name];
    }

    std::string obfuscated = "C" + hasher_.generateHash(class_name, "class").substr(0, 10);
    class_cache_[class_name] = obfuscated;
    return obfuscated;
}

std::string CppMangler::obfuscateMethodName(const std::string& method_name) {
    // Check cache
    if (method_cache_.count(method_name)) {
        return method_cache_[method_name];
    }

    std::string obfuscated = "M" + hasher_.generateHash(method_name, "method").substr(0, 10);
    method_cache_[method_name] = obfuscated;
    return obfuscated;
}

std::string CppMangler::obfuscateTemplateParams(const std::vector<std::string>& params) {
    if (params.empty()) {
        return "";
    }

    std::string result = "I"; // Template start marker
    for (const auto& param : params) {
        result += param; // Keep type encodings (i, c, etc.)
    }
    result += "E"; // Template end marker
    return result;
}

std::string CppMangler::encodeLengthPrefix(const std::string& name) {
    return std::to_string(name.length()) + name;
}

std::string CppMangler::reconstructMangled(const CppSymbolComponents& components) {
    std::string result = "_Z";

    if (components.has_namespace || components.has_class) {
        result += "N"; // Nested name marker

        if (components.has_namespace && !components.namespace_name.empty()) {
            std::string obf_ns = obfuscateNamespace(components.namespace_name);
            result += encodeLengthPrefix(obf_ns);
        }

        if (components.has_class && !components.class_name.empty()) {
            std::string obf_class = obfuscateClassName(components.class_name);
            result += encodeLengthPrefix(obf_class);
        }

        if (!components.method_name.empty()) {
            std::string obf_method = obfuscateMethodName(components.method_name);
            result += encodeLengthPrefix(obf_method);
        }

        result += "E"; // End nested name
    } else {
        // Non-nested name
        std::string obf_name = hasher_.generateHash(components.method_name);
        result += encodeLengthPrefix(obf_name);
    }

    // Preserve parameter types for ABI compatibility
    result += encodeParameters(components.parameter_types);

    return result;
}

std::string CppMangler::encodeParameters(const std::vector<std::string>& params) {
    std::string result;
    for (const auto& param : params) {
        result += param; // Keep original type encodings
    }

    // Add 'v' for void if no parameters
    if (result.empty()) {
        result = "v";
    }

    return result;
}

} // namespace SymbolObfuscator
