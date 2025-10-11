#ifndef CPP_MANGLER_H
#define CPP_MANGLER_H

#include "crypto_hasher.h"
#include "c_obfuscator.h"
#include <string>
#include <vector>
#include <map>

namespace SymbolObfuscator {

// C++ symbol components (parsed from mangled name)
struct CppSymbolComponents {
    bool is_mangled = false;          // Is this a C++ mangled symbol?
    std::string prefix;                // _Z for Itanium ABI
    bool has_namespace = false;
    std::string namespace_name;
    bool has_class = false;
    std::string class_name;
    std::string method_name;
    std::vector<std::string> template_params;
    std::vector<std::string> parameter_types;
    bool is_const = false;
    bool is_virtual = false;
    bool is_static = false;
    std::string return_type;

    // Special symbols
    bool is_vtable = false;            // _ZTV* - virtual table
    bool is_typeinfo = false;          // _ZTI* - type information
    bool is_typeinfo_name = false;     // _ZTS* - type info name
    bool is_constructor = false;       // C1, C2
    bool is_destructor = false;        // D0, D1, D2
};

class CppDemangler {
public:
    // Demangle C++ symbol to human-readable form
    static std::string demangle(const std::string& mangled_name);

    // Parse mangled name into components
    static CppSymbolComponents parse(const std::string& mangled_name);

    // Check if symbol is C++ mangled
    static bool isCppMangled(const std::string& name);

    // Check if symbol is special (vtable, typeinfo, etc.)
    static bool isSpecialSymbol(const std::string& name);
};

class CppMangler {
public:
    explicit CppMangler(CryptoHasher& hasher);

    // Obfuscate C++ mangled symbol
    std::string obfuscateCppSymbol(const std::string& mangled_name);

    // Obfuscate specific C++ constructs
    std::string obfuscateVTable(const std::string& vtable_symbol);
    std::string obfuscateTypeInfo(const std::string& typeinfo_symbol);
    std::string obfuscateConstructor(const std::string& ctor_symbol);
    std::string obfuscateDestructor(const std::string& dtor_symbol);

    // Get obfuscation mapping
    const std::map<std::string, std::string>& getMapping() const;

private:
    CryptoHasher& hasher_;
    std::map<std::string, std::string> mapping_;
    std::set<std::string> used_hashes_;

    // Component-wise obfuscation
    std::string obfuscateNamespace(const std::string& ns);
    std::string obfuscateClassName(const std::string& class_name);
    std::string obfuscateMethodName(const std::string& method_name);
    std::string obfuscateTemplateParams(const std::vector<std::string>& params);

    // Mangling helpers
    std::string encodeLengthPrefix(const std::string& name);
    std::string reconstructMangled(const CppSymbolComponents& components);
    std::string encodeParameters(const std::vector<std::string>& params);

    // Cache for consistent renaming
    std::map<std::string, std::string> namespace_cache_;
    std::map<std::string, std::string> class_cache_;
    std::map<std::string, std::string> method_cache_;
};

// Itanium ABI mangling reference
// _Z : C++ mangled symbol prefix
// N...E : Nested name (namespace/class)
// <len><name> : Length-prefixed name
// I...E : Template parameters
// Parameters: v=void, i=int, c=char, l=long, f=float, d=double, etc.

} // namespace SymbolObfuscator

#endif // CPP_MANGLER_H
