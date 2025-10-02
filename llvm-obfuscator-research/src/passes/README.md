# LLVM Custom Obfuscation Passes

This directory contains custom LLVM passes for code obfuscation.

## SimpleObfuscator

Basic obfuscation pass that demonstrates:
- Function renaming (f1, f2, f3...)
- Variable renaming (v1, v2, v3...)
- Debug information removal

### Building

```bash
# Find LLVM installation
llvm-config --version

# Compile the pass
clang++ -shared -fPIC SimpleObfuscator.cpp -o SimpleObfuscator.so \
  `llvm-config --cxxflags --ldflags --libs core`

# Or with explicit flags (macOS)
clang++ -dynamiclib -fPIC SimpleObfuscator.cpp -o SimpleObfuscator.dylib \
  `llvm-config --cxxflags --ldflags --system-libs --libs core`
```

### Usage

```bash
# Generate LLVM IR from source
clang -S -emit-llvm program.c -o program.ll

# Apply the obfuscation pass
opt -load ./SimpleObfuscator.so -simple-obfuscator -S program.ll -o program_obf.ll

# Compile obfuscated IR to binary
clang program_obf.ll -o program_obf

# Or compile directly (newer LLVM)
opt -load-pass-plugin ./SimpleObfuscator.so -passes="simple-obfuscator" \
  -S program.ll -o program_obf.ll
```

### Testing

```bash
# Test with factorial example
cd ../..
clang -S -emit-llvm src/factorial_recursive.c -o ir/factorial_recursive.ll
opt -load src/passes/SimpleObfuscator.so -simple-obfuscator \
  -S ir/factorial_recursive.ll -o ir/factorial_recursive_obf.ll

# Compare original and obfuscated IR
diff ir/factorial_recursive.ll ir/factorial_recursive_obf.ll

# Compile and test functionality
clang ir/factorial_recursive_obf.ll -o bin/factorial_obfuscated_test
./bin/factorial_obfuscated_test 5
```

## Future Passes

Ideas for additional obfuscation passes:

1. **ControlFlowFlattening** - Flatten control flow to make it harder to follow
2. **BogusControlFlow** - Add fake branches and dead code
3. **InstructionSubstitution** - Replace instructions with equivalent but more complex ones
4. **OpaquePredicates** - Add always-true/false conditions that are hard to detect
5. **StringEncryption** - Encrypt string constants (see string_obfuscator.py)
6. **ConstantObfuscation** - Hide constant values
7. **CallIndirection** - Replace direct calls with indirect calls through function pointers
8. **LoopUnrolling** - Unroll loops to increase code size and complexity

## Notes

- LLVM version compatibility: This pass is written for LLVM 10+
- Some features may require adjustments for different LLVM versions
- Always test obfuscated code to ensure functional equivalence
- Performance impact should be measured for each pass
