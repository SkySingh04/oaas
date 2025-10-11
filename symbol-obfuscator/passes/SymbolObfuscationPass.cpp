#include "SymbolObfuscationPass.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/InlineAsm.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Support/JSON.h"
#include <fstream>

using namespace llvm;
using namespace SymbolObfuscator;

SymbolObfuscationPass::SymbolObfuscationPass(const std::string& salt)
    : salt_(salt), cpp_mangler_(hasher_) {

    HashConfig config;
    config.algorithm = HashAlgorithm::SHA256;
    config.prefix_style = PrefixStyle::TYPED;
    config.hash_length = 12;
    config.global_salt = salt;
    config.deterministic = true;

    hasher_ = CryptoHasher(config);
    cpp_mangler_ = CppMangler(hasher_);

    initializePreserveSet();
}

PreservedAnalyses SymbolObfuscationPass::run(Module &M, ModuleAnalysisManager &MAM) {
    errs() << "SymbolObfuscationPass: Processing module " << M.getName() << "\n";

    // Generate module-specific salt if not provided
    if (salt_.empty()) {
        salt_ = generateModuleSalt(M);
        hasher_.setSalt(salt_);
    }

    // Step 1: Obfuscate functions
    obfuscateFunctions(M);

    // Step 2: Obfuscate global variables
    if (obfuscate_globals_) {
        obfuscateGlobalVariables(M);
    }

    // Step 3: Obfuscate aliases
    obfuscateAliases(M);

    // Step 4: Save mapping
    if (generate_map_) {
        saveMapping(map_file_path_);
    }

    errs() << "SymbolObfuscationPass: Obfuscated " << mapping_.size() << " symbols\n";

    // We modified symbol names, so nothing is preserved
    return PreservedAnalyses::none();
}

void SymbolObfuscationPass::obfuscateFunctions(Module& M) {
    for (Function& F : M) {
        if (F.isDeclaration()) {
            continue; // Skip external declarations
        }

        std::string original_name = F.getName().str();

        // Check if should preserve
        if (shouldPreserve(original_name)) {
            errs() << "  Preserving function: " << original_name << "\n";
            continue;
        }

        // Obfuscate
        std::string obfuscated_name = obfuscateFunctionName(F);

        errs() << "  " << original_name << " -> " << obfuscated_name << "\n";

        // Store mapping
        mapping_[original_name] = obfuscated_name;

        // Rename function (LLVM automatically updates all references)
        F.setName(obfuscated_name);
    }
}

void SymbolObfuscationPass::obfuscateGlobalVariables(Module& M) {
    for (GlobalVariable& GV : M.globals()) {
        if (GV.isDeclaration()) {
            continue; // Skip external declarations
        }

        std::string original_name = GV.getName().str();

        // Check if should preserve
        if (shouldPreserve(original_name)) {
            continue;
        }

        // Obfuscate
        std::string obfuscated_name = obfuscateGlobalName(GV);

        errs() << "  " << original_name << " -> " << obfuscated_name << " (global)\n";

        // Store mapping
        mapping_[original_name] = obfuscated_name;

        // Rename global
        GV.setName(obfuscated_name);
    }
}

void SymbolObfuscationPass::obfuscateAliases(Module& M) {
    for (GlobalAlias& GA : M.aliases()) {
        std::string original_name = GA.getName().str();

        if (shouldPreserve(original_name)) {
            continue;
        }

        // Generate obfuscated name
        std::string obfuscated_name = hasher_.generateUniqueHash(
            original_name, used_names_, "a_");

        errs() << "  " << original_name << " -> " << obfuscated_name << " (alias)\n";

        mapping_[original_name] = obfuscated_name;
        GA.setName(obfuscated_name);
    }
}

std::string SymbolObfuscationPass::obfuscateFunctionName(Function& F) {
    std::string original_name = F.getName().str();

    // Check if C++ mangled
    if (isCppMangled(original_name)) {
        return cpp_mangler_.obfuscateCppSymbol(original_name);
    }

    // C function - simple hash
    return hasher_.generateUniqueHash(original_name, used_names_, "f_");
}

std::string SymbolObfuscationPass::obfuscateGlobalName(GlobalVariable& GV) {
    std::string original_name = GV.getName().str();

    // Check if C++ mangled
    if (isCppMangled(original_name)) {
        return cpp_mangler_.obfuscateCppSymbol(original_name);
    }

    // C global variable
    return hasher_.generateUniqueHash(original_name, used_names_, "v_");
}

bool SymbolObfuscationPass::shouldPreserve(const std::string& name) const {
    // Check preserve set
    if (preserve_symbols_.count(name)) {
        return true;
    }

    // Preserve main if requested
    if (preserve_main_ && name == "main") {
        return true;
    }

    // Preserve system symbols
    if (isSystemSymbol(name)) {
        return true;
    }

    // Preserve LLVM intrinsics
    if (name.substr(0, 5) == "llvm.") {
        return true;
    }

    return false;
}

bool SymbolObfuscationPass::isSystemSymbol(const std::string& name) const {
    // System symbols typically start with __ or _
    if (name.length() >= 2 && name[0] == '_' && name[1] == '_') {
        return true;
    }

    // C++ ABI symbols
    if (name.substr(0, 5) == "__cxa") {
        return true;
    }

    // Common stdlib symbols
    if (preserve_stdlib_) {
        static const std::set<std::string> stdlib_funcs = {
            "malloc", "free", "calloc", "realloc",
            "printf", "scanf", "fprintf", "sprintf",
            "memcpy", "memset", "strlen", "strcmp",
            "exit", "abort", "signal", "sigaction"
        };

        if (stdlib_funcs.count(name)) {
            return true;
        }
    }

    return false;
}

bool SymbolObfuscationPass::isCppMangled(const std::string& name) const {
    return name.length() > 2 && name.substr(0, 2) == "_Z";
}

void SymbolObfuscationPass::saveMapping(const std::string& path) const {
    std::error_code EC;
    raw_fd_ostream OS(path, EC);

    if (EC) {
        errs() << "Error: Cannot open mapping file: " << path << "\n";
        return;
    }

    // Create JSON output
    json::Object root;
    json::Array symbols;

    for (const auto& [original, obfuscated] : mapping_) {
        json::Object symbol;
        symbol["original"] = original;
        symbol["obfuscated"] = obfuscated;
        symbols.push_back(std::move(symbol));
    }

    root["symbols"] = std::move(symbols);
    root["version"] = "1.0";
    root["salt"] = salt_;

    json::Value json_val(std::move(root));
    OS << formatv("{0:2}", json_val) << "\n";

    errs() << "Saved symbol mapping to: " << path << "\n";
}

std::string SymbolObfuscationPass::generateModuleSalt(Module& M) const {
    // Generate deterministic salt from module name and source filename
    std::string base = M.getName().str();

    if (!M.getSourceFileName().empty()) {
        base += M.getSourceFileName();
    }

    // Hash the base to create salt
    CryptoHasher temp_hasher;
    return temp_hasher.generateHash(base, "module_salt");
}

void SymbolObfuscationPass::initializePreserveSet() {
    // Critical system symbols that must never be obfuscated
    preserve_symbols_ = {
        "main",
        "_start",
        "__libc_start_main",
        "_init",
        "_fini",
        "__attribute__",
        "__cxa_atexit",
        "__cxa_finalize",
        "__dso_handle",
        "__gxx_personality_v0",
        "_GLOBAL__sub_I_"
    };
}

// Plugin registration for new pass manager
extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK
llvmGetPassPluginInfo() {
    return {
        LLVM_PLUGIN_API_VERSION, "SymbolObfuscation", LLVM_VERSION_STRING,
        [](PassBuilder &PB) {
            PB.registerPipelineParsingCallback(
                [](StringRef Name, ModulePassManager &MPM,
                   ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "symbol-obfuscation") {
                        MPM.addPass(SymbolObfuscationPass());
                        return true;
                    }
                    return false;
                });
        }
    };
}

#endif // SYMBOL_OBFUSCATION_PASS_CPP
