/*
 * SimpleObfuscator - Basic LLVM Obfuscation Pass
 *
 * This pass demonstrates basic obfuscation techniques:
 * - Renames functions to generic names (f1, f2, f3...)
 * - Renames variables to generic names (v1, v2, v3...)
 * - Removes debug information
 *
 * Build:
 *   clang++ -shared -fPIC SimpleObfuscator.cpp -o SimpleObfuscator.so \
 *     `llvm-config --cxxflags --ldflags --libs core`
 *
 * Usage:
 *   opt -load ./SimpleObfuscator.so -simple-obfuscator -S input.ll -o output.ll
 */

#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/IR/Module.h"
#include "llvm/IR/Instructions.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IRBuilder.h"
#include <map>
#include <string>

using namespace llvm;

namespace {

struct SimpleObfuscator : public ModulePass {
  static char ID;
  SimpleObfuscator() : ModulePass(ID) {}

  bool runOnModule(Module &M) override {
    bool modified = false;

    errs() << "SimpleObfuscator: Processing module " << M.getName() << "\n";

    // Step 1: Rename functions
    modified |= renameFunctions(M);

    // Step 2: Rename variables (instruction results)
    modified |= renameVariables(M);

    // Step 3: Strip debug info
    modified |= stripDebugInfo(M);

    if (modified) {
      errs() << "SimpleObfuscator: Module obfuscated successfully\n";
    }

    return modified;
  }

private:
  /**
   * Rename all non-external functions to generic names
   */
  bool renameFunctions(Module &M) {
    bool modified = false;
    int funcCounter = 1;

    std::vector<Function*> functionsToRename;

    // Collect functions that can be renamed
    for (Function &F : M) {
      // Don't rename external functions or intrinsics
      if (!F.isDeclaration() && !F.isIntrinsic() &&
          !F.getName().startswith("llvm.") &&
          F.getLinkage() != GlobalValue::ExternalLinkage) {
        functionsToRename.push_back(&F);
      }
    }

    // Rename collected functions
    for (Function *F : functionsToRename) {
      std::string oldName = F->getName().str();
      std::string newName = "f" + std::to_string(funcCounter++);

      F->setName(newName);
      errs() << "  Renamed function: " << oldName << " -> " << newName << "\n";
      modified = true;
    }

    return modified;
  }

  /**
   * Rename variables (instruction results that have names)
   */
  bool renameVariables(Module &M) {
    bool modified = false;

    for (Function &F : M) {
      if (F.isDeclaration()) continue;

      int varCounter = 1;

      // Rename function arguments
      for (Argument &Arg : F.args()) {
        if (Arg.hasName()) {
          std::string newName = "v" + std::to_string(varCounter++);
          Arg.setName(newName);
          modified = true;
        }
      }

      // Rename local variables (named instructions)
      for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
          if (I.hasName() && !I.getType()->isVoidTy()) {
            std::string newName = "v" + std::to_string(varCounter++);
            I.setName(newName);
            modified = true;
          }
        }
      }
    }

    return modified;
  }

  /**
   * Remove debug information from module
   */
  bool stripDebugInfo(Module &M) {
    bool modified = false;

    // Remove debug intrinsics
    std::vector<Instruction*> toRemove;

    for (Function &F : M) {
      for (BasicBlock &BB : F) {
        for (Instruction &I : BB) {
          // Remove debug intrinsic calls
          if (CallInst *CI = dyn_cast<CallInst>(&I)) {
            Function *CalledFunc = CI->getCalledFunction();
            if (CalledFunc && CalledFunc->getName().startswith("llvm.dbg.")) {
              toRemove.push_back(&I);
            }
          }
        }
      }
    }

    for (Instruction *I : toRemove) {
      I->eraseFromParent();
      modified = true;
    }

    // Strip debug info from module
    if (M.getNamedMetadata("llvm.dbg.cu")) {
      M.eraseNamedMetadata(M.getNamedMetadata("llvm.dbg.cu"));
      modified = true;
    }

    return modified;
  }
};

} // end anonymous namespace

char SimpleObfuscator::ID = 0;

// Register the pass
static RegisterPass<SimpleObfuscator> X(
  "simple-obfuscator",
  "Simple Obfuscation Pass - Renames functions and variables",
  false,
  false
);
