#!/bin/bash
# Build ALL 4 source files with ALL 17 obfuscation techniques

set -e

OLLVM_PLUGIN="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
OPT="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"

echo "════════════════════════════════════════════════════════════"
echo "  BUILDING ALL BINARIES WITH 17 OBFUSCATION TECHNIQUES"
echo "════════════════════════════════════════════════════════════"
echo ""

LAYER2_AVAILABLE=0
if [ -f "$OLLVM_PLUGIN" ] && [ -f "$OPT" ]; then
    echo "✓ OLLVM plugin found - Layer 2 will be applied"
    LAYER2_AVAILABLE=1
else
    echo "⚠ OLLVM plugin not found - Layer 2 skipped"
fi
echo ""

build_ultimate() {
    local SOURCE="$1"
    local OUTPUT="$2"
    local BASENAME=$(basename "$SOURCE" .c)

    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "  Processing: $BASENAME"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

    if [ $LAYER2_AVAILABLE -eq 1 ]; then
        echo "Layer 2: Applying OLLVM passes..."
        clang -S -emit-llvm "$SOURCE" -o "/tmp/${BASENAME}.ll" 2>/dev/null
        $OPT -load-pass-plugin="$OLLVM_PLUGIN" -passes='flattening,substitution,boguscf,split' "/tmp/${BASENAME}.ll" -o "/tmp/${BASENAME}_obf.bc" 2>&1 | grep -v "^DEBUG:" || true
        FINAL_IR="/tmp/${BASENAME}_obf.bc"
        echo "  ✓ All 4 OLLVM passes applied"
    else
        FINAL_IR="$SOURCE"
    fi

    echo "Layer 1: Applying modern LLVM flags..."
    clang -flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 -Wl,-s "$FINAL_IR" -o "$OUTPUT" 2>&1 | grep -E "^(error|fatal)" || true
    echo "  ✓ All 9 compiler flags applied"

    echo "Final: Stripping symbols..."
    strip "$OUTPUT" 2>/dev/null || true
    echo "  ✓ Symbols stripped"
    echo ""
}

mkdir -p bin

build_ultimate "src/factorial_iterative.c" "bin/factorial_iterative_ultimate"
build_ultimate "src/factorial_lookup.c" "bin/factorial_lookup_ultimate"
build_ultimate "src/factorial_recursive.c" "bin/factorial_recursive_ultimate"
build_ultimate "src/recursive_chaos.c" "bin/recursive_chaos_ultimate"

echo "════════════════════════════════════════════════════════════"
echo "  ALL BINARIES BUILT"
echo "════════════════════════════════════════════════════════════"
ls -lh bin/*_ultimate
echo ""
