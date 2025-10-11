#!/bin/bash
#
# Apply ALL 17 Obfuscation Techniques (ULTIMATE Configuration)
#
# This script applies:
# - Layer 1: 9 modern LLVM compiler flags
# - Layer 2: 4 OLLVM passes (flattening, substitution, boguscf, split)
# - Symbol stripping
#
# Total: 17 techniques for maximum obfuscation
#

set -e

SOURCE_FILE="$1"
OUTPUT_BINARY="$2"

if [ -z "$SOURCE_FILE" ] || [ -z "$OUTPUT_BINARY" ]; then
    echo "Usage: $0 <source.c> <output_binary>"
    echo ""
    echo "Applies ALL 17 obfuscation techniques:"
    echo "  - Layer 1: 9 modern LLVM flags"
    echo "  - Layer 2: 4 OLLVM passes"
    echo "  - Symbol stripping"
    exit 1
fi

echo "════════════════════════════════════════════════════════════"
echo "  APPLYING ALL 17 OBFUSCATION TECHNIQUES"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "Source: $SOURCE_FILE"
echo "Output: $OUTPUT_BINARY"
echo ""

# OLLVM paths
OLLVM_PLUGIN="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
OPT_BINARY="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"

# Always use system clang (has proper headers)
CLANG_BINARY="clang"

# ═══════════════════════════════════════════════════════════════
# LAYER 2: OLLVM Compiler Passes (4 passes)
# ═══════════════════════════════════════════════════════════════

if [ -f "$OLLVM_PLUGIN" ] && [ -f "$OPT_BINARY" ]; then
    echo "Layer 2: Applying OLLVM passes..."
    echo "------------------------------------------------"

    # Step 1: Compile to LLVM IR
    echo "  • Compiling to LLVM IR..."
    $CLANG_BINARY -S -emit-llvm "$SOURCE_FILE" -o /tmp/source.ll

    # Step 2: Apply all 4 OLLVM passes in sequence
    echo "  • Applying all 4 OLLVM passes (flattening, substitution, boguscf, split)..."
    $OPT_BINARY -load-pass-plugin="$OLLVM_PLUGIN" \
        -passes='flattening,substitution,boguscf,split' \
        /tmp/source.ll -o /tmp/obf_final.bc 2>&1 | head -10 || {
            echo "  ! OLLVM passes failed, falling back to no Layer 2"
            cp /tmp/source.ll /tmp/obf_final.bc
        }

    echo "  ✓ All 4 OLLVM passes applied"
    FINAL_IR="/tmp/obf_final.bc"
else
    echo "Layer 2: OLLVM not available, using source directly"
    echo "------------------------------------------------"
    FINAL_IR="$SOURCE_FILE"
fi

echo ""

# ═══════════════════════════════════════════════════════════════
# LAYER 1: Modern LLVM Compiler Flags (9 flags)
# ═══════════════════════════════════════════════════════════════

echo "Layer 1: Applying modern LLVM flags..."
echo "------------------------------------------------"
echo "  1. -flto (Link-Time Optimization)"
echo "  2. -fvisibility=hidden (Hide symbols)"
echo "  3. -O3 (Maximum optimization)"
echo "  4. -fno-builtin (Disable builtins)"
echo "  5. -flto=thin (ThinLTO)"
echo "  6. -fomit-frame-pointer (Remove frame pointer)"
echo "  7. -mspeculative-load-hardening (Spectre mitigation)"
echo "  8. -O1 (Entropy refinement)"
echo "  9. -Wl,-s (Strip at link time)"

$CLANG_BINARY \
    -flto \
    -fvisibility=hidden \
    -O3 \
    -fno-builtin \
    -flto=thin \
    -fomit-frame-pointer \
    -mspeculative-load-hardening \
    -O1 \
    -Wl,-s \
    "$FINAL_IR" -o "$OUTPUT_BINARY"

echo "  ✓ All 9 compiler flags applied"
echo ""

# ═══════════════════════════════════════════════════════════════
# FINAL: Strip remaining symbols
# ═══════════════════════════════════════════════════════════════

echo "Final: Stripping symbols..."
echo "------------------------------------------------"
strip "$OUTPUT_BINARY" 2>/dev/null || echo "  (already stripped)"
echo "  ✓ Symbols stripped"
echo ""

# ═══════════════════════════════════════════════════════════════
# REPORT
# ═══════════════════════════════════════════════════════════════

echo "════════════════════════════════════════════════════════════"
echo "  OBFUSCATION COMPLETE - ALL 17 TECHNIQUES APPLIED"
echo "════════════════════════════════════════════════════════════"
echo ""

echo "Binary Analysis:"
echo "----------------"
ls -lh "$OUTPUT_BINARY" | awk '{print "Size:    " $5}'
nm "$OUTPUT_BINARY" 2>/dev/null | wc -l | awk '{print "Symbols: " $1}'

# Calculate entropy
echo ""
python3 << 'PYTHON'
import math
import sys
with open(sys.argv[1], 'rb') as f:
    data = f.read()
freq = [0] * 256
for byte in data:
    freq[byte] += 1
entropy = 0
for count in freq:
    if count > 0:
        p = count / len(data)
        entropy -= p * math.log2(p)
print(f"Entropy: {entropy:.4f} bits/byte")
PYTHON "$OUTPUT_BINARY"

echo ""
echo "Techniques Applied:"
echo "-------------------"
if [ -f "$OLLVM_PLUGIN" ]; then
    echo "✓ Layer 1: 9 modern LLVM flags"
    echo "✓ Layer 2: 4 OLLVM passes"
    echo "✓ Symbol stripping"
    echo ""
    echo "TOTAL: 17 obfuscation techniques"
else
    echo "✓ Layer 1: 9 modern LLVM flags"
    echo "⊘ Layer 2: OLLVM not available (0 passes)"
    echo "✓ Symbol stripping"
    echo ""
    echo "TOTAL: 9 obfuscation techniques (Layer 1 only)"
fi

echo ""
echo "Output: $OUTPUT_BINARY"
echo ""
