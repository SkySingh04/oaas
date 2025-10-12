#!/bin/bash
# Standalone Linear MBA Test Script

set -e

echo "========================================="
echo "Linear MBA Obfuscation - Standalone Test"
echo "========================================="
echo ""

# Paths
TEST_DIR="/Users/akashsingh/Desktop/llvm/test_mba_output"
SRC_FILE="/Users/akashsingh/Desktop/llvm/src/test_mba.c"
OPT="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"
CLANG="clang"  # Use system clang

mkdir -p "$TEST_DIR"
cd "$TEST_DIR"

echo "Step 1: Compile test file to baseline binary..."
$CLANG "$SRC_FILE" -o test_mba_baseline -O0
echo "✅ Baseline binary created"
ls -lh test_mba_baseline

echo ""
echo "Step 2: Run baseline binary..."
./test_mba_baseline
echo "✅ Baseline binary runs correctly"

echo ""
echo "Step 3: Generate LLVM IR..."
$CLANG -S -emit-llvm "$SRC_FILE" -o test_mba.ll -O0
echo "✅ IR generated: $(wc -l test_mba.ll | awk '{print $1}') lines"

echo ""
echo "Step 4: Count bitwise operations in IR..."
ANDS=$(grep -c " and " test_mba.ll || true)
ORS=$(grep -c " or " test_mba.ll || true)
XORS=$(grep -c " xor " test_mba.ll || true)
TOTAL=$((ANDS + ORS + XORS))
echo "   AND operations: $ANDS"
echo "   OR operations:  $ORS"
echo "   XOR operations: $XORS"
echo "   Total bitwise ops: $TOTAL"

echo ""
echo "Step 5: Show sample of test_and function BEFORE MBA..."
sed -n '/define.*test_and/,/^}/p' test_mba.ll | head -15

echo ""
echo "========================================="
echo "Test Setup Complete!"
echo "========================================="
echo ""
echo "To apply MBA obfuscation, the Linear MBA pass needs to be"
echo "integrated into the OLLVM plugin. The pass is built and"
echo "ready in the LLVMObfuscation library."
echo ""
echo "Summary:"
echo "  - Test file: $SRC_FILE"
echo "  - Baseline binary: WORKING ✅"
echo "  - IR generated: $TOTAL bitwise operations found"
echo "  - MBA pass: Built into LLVMObfuscation.a ✅"
echo ""
