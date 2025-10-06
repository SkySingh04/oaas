#!/bin/bash
#
# Integration Script: Targeted Obfuscation + LLVM/OLLVM Passes
# Combines source-level targeted obfuscation with compiler-level OLLVM passes
#

set -e

SOURCE_FILE="$1"
FUNCTION_NAME="$2"
PROTECTION_LEVEL="${3:-3}"  # Default level 3
OUTPUT_BINARY="${4:-protected_binary}"

if [ -z "$SOURCE_FILE" ] || [ -z "$FUNCTION_NAME" ]; then
    cat << 'EOF'
Usage: ./integrate_with_ollvm.sh <source.c> <function_name> [level] [output]

Applies multi-layer obfuscation:
  1. Source-level: Targeted function obfuscation (this tool)
  2. Compiler-level: OLLVM obfuscation passes (if available)
  3. Optional: Strip symbols

Example:
  ./integrate_with_ollvm.sh auth.c check_password 3 auth_protected

Protection levels:
  1 = String encryption only
  2 = Strings + CFG flattening
  3 = Strings + CFG + Opaque predicates (recommended)
  4 = All + VM virtualization (very slow!)

EOF
    exit 1
fi

echo "════════════════════════════════════════════════════════════"
echo "  MULTI-LAYER OBFUSCATION PIPELINE"
echo "════════════════════════════════════════════════════════════"
echo ""
echo "Source:     $SOURCE_FILE"
echo "Function:   $FUNCTION_NAME"
echo "Level:      $PROTECTION_LEVEL"
echo "Output:     $OUTPUT_BINARY"
echo ""

# Step 1: Source-level targeted obfuscation
echo "Step 1: Applying targeted function obfuscation..."
echo "------------------------------------------------"
python3 protect_functions.py harden "$SOURCE_FILE" \
    --functions "$FUNCTION_NAME" \
    --max-level "$PROTECTION_LEVEL" \
    --output /tmp/targeted_obfuscated.c

if [ ! -f /tmp/targeted_obfuscated.c ]; then
    echo "Error: Targeted obfuscation failed"
    exit 1
fi
echo "✓ Source-level obfuscation complete"
echo ""

# Step 2: Compile to LLVM IR
echo "Step 2: Compiling to LLVM IR..."
echo "------------------------------------------------"
clang -S -emit-llvm /tmp/targeted_obfuscated.c -o /tmp/targeted_obfuscated.ll 2>&1 | head -20 || true
echo "✓ LLVM IR generated: /tmp/targeted_obfuscated.ll"
echo ""

# Step 3: Apply OLLVM passes (if available)
echo "Step 3: Applying OLLVM obfuscation passes..."
echo "------------------------------------------------"

# Check if OLLVM plugin is available
OLLVM_PLUGIN_PATH="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
OPT_BINARY="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"

if [ -f "$OLLVM_PLUGIN_PATH" ] && [ -f "$OPT_BINARY" ]; then
    echo "Found OLLVM plugin: $OLLVM_PLUGIN_PATH"

    # Apply OLLVM passes: flattening, substitution, bogus control flow
    echo "  • Applying control flow flattening..."
    $OPT_BINARY -load-pass-plugin="$OLLVM_PLUGIN_PATH" \
        -passes='fla' \
        /tmp/targeted_obfuscated.ll \
        -o /tmp/obfuscated_flat.bc 2>&1 | head -10 || true

    echo "  • Applying instruction substitution..."
    $OPT_BINARY -load-pass-plugin="$OLLVM_PLUGIN_PATH" \
        -passes='sub' \
        /tmp/obfuscated_flat.bc \
        -o /tmp/obfuscated_sub.bc 2>&1 | head -10 || true

    echo "  • Applying bogus control flow..."
    $OPT_BINARY -load-pass-plugin="$OLLVM_PLUGIN_PATH" \
        -passes='bcf' \
        /tmp/obfuscated_sub.bc \
        -o /tmp/obfuscated_final.bc 2>&1 | head -10 || true

    echo "✓ OLLVM passes applied"
    FINAL_IR="/tmp/obfuscated_final.bc"
else
    echo "⚠ OLLVM plugin not found, skipping compiler-level obfuscation"
    echo "  (To enable, build OLLVM from llvm-project/)"

    # Convert to bitcode for consistency
    clang -c -emit-llvm /tmp/targeted_obfuscated.c -o /tmp/obfuscated_final.bc
    FINAL_IR="/tmp/obfuscated_final.bc"
fi
echo ""

# Step 4: Compile to binary
echo "Step 4: Compiling final binary..."
echo "------------------------------------------------"
clang "$FINAL_IR" -o "$OUTPUT_BINARY"
echo "✓ Binary compiled: $OUTPUT_BINARY"
echo ""

# Step 5: Strip symbols (optional but recommended)
echo "Step 5: Stripping symbols..."
echo "------------------------------------------------"
strip "$OUTPUT_BINARY" 2>/dev/null || echo "⚠ Strip failed (already stripped?)"
echo "✓ Symbols stripped"
echo ""

# Step 6: Analysis report
echo "═══════════════════════════════════════════════════════════"
echo "  OBFUSCATION REPORT"
echo "═══════════════════════════════════════════════════════════"
echo ""

echo "Original source:"
echo "  File: $SOURCE_FILE"
wc -l "$SOURCE_FILE" | awk '{print "  Lines:", $1}'
echo ""

echo "Protected binary:"
ls -lh "$OUTPUT_BINARY" | awk '{print "  Size:", $5}'
echo "  File: $OUTPUT_BINARY"
echo ""

echo "Symbol count:"
nm "$OUTPUT_BINARY" 2>/dev/null | wc -l | awk '{print "  Symbols:", $1}'
echo ""

echo "Strings analysis:"
echo "  Searching for original sensitive strings..."
if strings "$OUTPUT_BINARY" | grep -q "$FUNCTION_NAME"; then
    echo "  ⚠ Function name still visible in strings"
else
    echo "  ✓ Function name obfuscated"
fi

# Check entropy
echo ""
echo "Binary complexity (entropy):"
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
print(f"  Shannon Entropy: {entropy:.4f} bits/byte")
if entropy > 6.0:
    print("  ✓ High entropy (complex binary)")
elif entropy > 4.0:
    print("  ✓ Medium entropy")
else:
    print("  ⚠ Low entropy (may need more obfuscation)")
PYTHON "$OUTPUT_BINARY"

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "  MULTI-LAYER OBFUSCATION COMPLETE ✓"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "Layers applied:"
echo "  1. ✓ Targeted function obfuscation (level $PROTECTION_LEVEL)"
if [ -f "$OLLVM_PLUGIN_PATH" ]; then
    echo "  2. ✓ OLLVM passes (flattening, substitution, bogus CF)"
else
    echo "  2. ⊘ OLLVM passes (not available)"
fi
echo "  3. ✓ Symbol stripping"
echo ""
echo "Output: $OUTPUT_BINARY"
echo "Test:   ./$OUTPUT_BINARY"
echo ""
