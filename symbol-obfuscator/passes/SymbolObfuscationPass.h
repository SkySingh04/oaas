#ifndef SYMBOL_OBFUSCATION_PASS_H
#define SYMBOL_OBFUSCATION_PASS_H

#include "llvm/IR/PassManager.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/GlobalVariable.h"
#include "../src/crypto_hasher.h"
#include "../src/cpp_mangler.h"
#include <map>
#include <set>

namespace llvm {

class SymbolObfuscationPass : public PassInfoMixin<SymbolObfuscationPass> {
public:
    explicit SymbolObfuscationPass(const std::string& salt = "");

    PreservedAnalyses run(Module &M, ModuleAnalysisManager &MAM);

    // Configuration
    void setPreserveMain(bool preserve) { preserve_main_ = preserve; }
    void setPreserveStdlib(bool preserve) { preserve_stdlib_ = preserve; }
    void setObfuscateGlobals(bool obfuscate) { obfuscate_globals_ = obfuscate; }
    void setGenerateMap(bool generate) { generate_map_ = generate; }
    void setMapFilePath(const std::string& path) { map_file_path_ = path; }

    // Get mapping for external use
    const std::map<std::string, std::string>& getMapping() const { return mapping_; }

private:
    // Configuration options
    bool preserve_main_ = true;
    bool preserve_stdlib_ = true;
    bool obfuscate_globals_ = true;
    bool generate_map_ = true;
    std::string map_file_path_ = "symbol_map.json";
    std::string salt_;

    // State
    SymbolObfuscator::CryptoHasher hasher_;
    SymbolObfuscator::CppMangler cpp_mangler_;
    std::map<std::string, std::string> mapping_;
    std::set<std::string> used_names_;
    std::set<std::string> preserve_symbols_;

    // Analysis methods
    bool shouldPreserve(const std::string& name) const;
    bool isSystemSymbol(const std::string& name) const;
    bool isCppMangled(const std::string& name) const;

    // Obfuscation methods
    void obfuscateFunctions(Module& M);
    void obfuscateGlobalVariables(Module& M);
    void obfuscateAliases(Module& M);

    std::string obfuscateFunctionName(Function& F);
    std::string obfuscateGlobalName(GlobalVariable& GV);

    // Mapping persistence
    void saveMapping(const std::string& path) const;

    // Module analysis
    std::string generateModuleSalt(Module& M) const;
    void initializePreserveSet();
};

} // namespace llvm

#endif // SYMBOL_OBFUSCATION_PASS_H
