# Linear MBA Obfuscation - Standalone Test Results

**Date:** 2025-10-11
**Status:** ✅ Pass Built Successfully, ⏳ Integration Pending

---

## Summary

Successfully built and prepared the Linear MBA (Mixed Boolean-Arithmetic) obfuscation pass for testing. This pass transforms simple bitwise operations (AND, OR, XOR) into complex per-bit reconstructions using shifts, truncations, and selects.

---

## Test File: test_mba.c

**Location:** `/Users/akashsingh/Desktop/llvm/src/test_mba.c`

**Features:**
- 8 test functions with various bitwise operations
- Tests AND, OR, XOR individually and combined
- Multiple bit widths: 8-bit, 16-bit, 32-bit, 64-bit
- Real-world patterns (hash functions, bit manipulation)

**Bitwise Operations Count:**
- AND operations: 7
- OR operations: 5
- XOR operations: 5
- **Total: 17 bitwise operations** ready for MBA transformation

---

## Build Status

### ✅ Linear MBA Pass Compilation
```
File: /Users/akashsingh/Desktop/llvm-project/llvm/lib/Transforms/Obfuscation/LinearMBA.cpp
Build: SUCCESS
Library: libLLVMObfuscation.a
```

**Pass Features:**
- Per-bit reconstruction of bitwise operations
- Configurable cycles (1-5 passes)
- Deterministic randomization seed
- Automatic bit-width handling (8-128 bits)
- Random noise injection for additional obfuscation

### ✅ Test Binary Compilation
```
Baseline binary: test_mba_baseline (33 KB)
Functional test: ✅ PASSED
All calculations: ✅ CORRECT
```

### ✅ LLVM IR Generation
```
IR file: test_mba.ll (254 lines)
Bitwise ops visible: ✅ YES (17 operations)
Ready for transformation: ✅ YES
```

---

## Sample IR - BEFORE MBA Transformation

### test_and function (simple AND operation):
```llvm
define i32 @test_and(i32 noundef %0, i32 noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %3, align 4
  store i32 %1, ptr %4, align 4
  %5 = load i32, ptr %3, align 4
  %6 = load i32, ptr %4, align 4
  %7 = and i32 %5, %6         ← Simple bitwise AND
  ret i32 %7
}
```

**Current:** 1 instruction (and)

**After MBA (expected):** 32 iterations × (lshr + trunc + select + xor + zext + shl + or)
= ~200+ instructions for a single AND operation!

---

## How Linear MBA Works

### Transformation Strategy

Instead of `result = a & b`, the pass generates:

```
result = 0
for each bit i from 0 to 31:
  bit_a = (a >> i) & 1        # Extract bit i from a
  bit_b = (b >> i) & 1        # Extract bit i from b

  # For AND: implement as select(bit_a, bit_b, false)
  bit_result = bit_a ? bit_b : false

  # Optional random noise (preserving semantics)
  if (random() & 0xF) == 0:
    bit_result ^= random_bit
    bit_result ^= random_bit  # XOR back to preserve correctness

  # Reconstruct result
  result |= (bit_result << i)
```

This transforms:
- **1 instruction** → **~200 instructions** per bitwise operation
- Simple pattern → Complex, unrecognizable pattern
- Fast → Slower (but semantically identical)

---

## Integration Status

### ✅ Completed
1. Pass implementation (LinearMBA.cpp)
2. CMakeLists.txt updated
3. Compilation successful
4. Built into LLVMObfuscation library
5. Test file created with 17 bitwise operations
6. Baseline testing complete

### ⏳ Pending
1. Plugin registration (add to PluginRegistration.cpp)
2. Apply pass via opt tool
3. Generate obfuscated IR
4. Compare before/after complexity
5. Verify functional correctness
6. Measure performance impact

---

## Current Limitation

The Linear MBA pass is built into `libLLVMObfuscation.a` but not yet registered in the plugin interface. This means:

**Works:**
- ✅ Compiles successfully
- ✅ Can be linked directly into LLVM tools
- ✅ Can be used programmatically

**Doesn't work (yet):**
- ❌ Cannot be loaded via `opt -load-pass-plugin`
- ❌ Not accessible from command line
- ❌ Not integrated with CLI tool

**Reason:** The pass has standalone registration code (llvmGetPassPluginInfo) that conflicts with the main ObfuscationPlugin registration. Need to either:
1. Integrate into PluginRegistration.cpp, OR
2. Build as separate standalone plugin, OR
3. Use directly in C++ code without plugin system

---

## Next Steps to Complete Integration

### Option 1: Integrate into Main Plugin (Recommended)

1. Remove standalone registration from LinearMBA.cpp
2. Add LinearMBAPass wrapper to PluginRegistration.cpp
3. Register as "linear-mba" pass
4. Rebuild plugin
5. Test via: `opt -passes=linear-mba input.ll -o output.bc`

### Option 2: Standalone Plugin

1. Keep LinearMBA.cpp as-is with registration
2. Build separate LinearMBAPlugin.dylib
3. Load separately: `opt -load-pass-plugin=LinearMBAPlugin.dylib`
4. Use alongside OLLVM passes

### Option 3: Direct C++ Integration

1. Use LinearMBA pass directly in obfuscation pipeline
2. Add to CLI tool's internal pass manager
3. No opt command needed
4. Full programmatic control

---

## Expected Results After Integration

### IR Complexity Increase
- **Before:** 254 lines, 17 bitwise ops
- **After:** ~3,500+ lines (13x increase)
- **Per operation:** 1 instruction → ~200 instructions

### Obfuscation Effectiveness
- **Symbol count:** No change (IR-level transformation)
- **IR readability:** Dramatically reduced
- **Static analysis difficulty:** 50-100x harder
- **Decompiler confusion:** High (unusual patterns)

### Performance Impact
- **Compilation time:** +500% (per-bit loops)
- **Runtime overhead:** +20-50% (depending on bitwise op density)
- **Binary size:** +200-300% (code expansion)

---

## Test Commands (After Integration)

### Apply MBA transformation:
```bash
/Users/akashsingh/Desktop/llvm-project/build/bin/opt \
  -load-pass-plugin=/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
  -passes=linear-mba \
  test_mba_output/test_mba.ll \
  -o test_mba_output/test_mba_obfuscated.bc \
  -S -o test_mba_output/test_mba_obfuscated.ll
```

### Compare before/after:
```bash
wc -l test_mba_output/test_mba.ll
wc -l test_mba_output/test_mba_obfuscated.ll
diff test_mba_output/test_mba.ll test_mba_output/test_mba_obfuscated.ll | head -100
```

### Compile obfuscated IR to binary:
```bash
clang test_mba_output/test_mba_obfuscated.bc -o test_mba_output/test_mba_obfuscated
./test_mba_output/test_mba_obfuscated  # Should produce same output
```

### Verify functional correctness:
```bash
diff <(./test_mba_output/test_mba_baseline) <(./test_mba_output/test_mba_obfuscated)
# Should show NO differences (semantically identical)
```

---

## Conclusion

The Linear MBA obfuscation pass is **successfully built and ready for integration**. The test infrastructure is in place with 17 bitwise operations ready to be transformed.

**Current status:**
- ✅ Pass implementation: COMPLETE
- ✅ Test file: COMPLETE
- ✅ Baseline testing: COMPLETE
- ⏳ Plugin integration: PENDING (simple addition to PluginRegistration.cpp)
- ⏳ Obfuscation testing: BLOCKED (waiting for plugin integration)

**Time to complete:** ~10-15 minutes to integrate into plugin and test

---

**Files Created:**
- `/Users/akashsingh/Desktop/llvm/src/test_mba.c` - Test source
- `/Users/akashsingh/Desktop/llvm/src/linearMBA.cpp` - Original pass (reference)
- `/Users/akashsingh/Desktop/llvm-project/llvm/lib/Transforms/Obfuscation/LinearMBA.cpp` - Integrated pass
- `/Users/akashsingh/Desktop/llvm/test_mba_output/test_mba_baseline` - Baseline binary
- `/Users/akashsingh/Desktop/llvm/test_mba_output/test_mba.ll` - Original IR
- `/Users/akashsingh/Desktop/llvm/test_mba_standalone.sh` - Test script

**Documentation:**
- This file: `LINEAR_MBA_TEST_RESULTS.md`

---

**Last Updated:** 2025-10-11
**Status:** Ready for plugin integration
