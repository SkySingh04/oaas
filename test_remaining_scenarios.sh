#!/bin/bash

################################################################################
# Remaining Obfuscation Tests (after crash fix)
################################################################################

set +e  # Don't exit on error

# Configuration
SOURCE_FILE="/Users/akashsingh/Desktop/llvm/src/simple_auth.c"
OPT_TOOL="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"
CLANG="/usr/bin/clang"
PLUGIN="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
OUTPUT_DIR="/Users/akashsingh/Desktop/llvm/test_results"
METRICS_FILE="$OUTPUT_DIR/comprehensive_metrics.csv"

# Color codes
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

print_header() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

measure_binary() {
    local binary=$1
    local name=$2

    if [ ! -f "$binary" ]; then
        echo "$name,ERROR,ERROR,ERROR,ERROR,ERROR" >> "$METRICS_FILE"
        echo -e "${RED}Binary not found${NC}"
        return 1
    fi

    echo -n "Analyzing $name... "

    local size=$(stat -f%z "$binary" 2>/dev/null || echo "0")
    local symbols=$(nm "$binary" 2>/dev/null | grep -v ' U ' | wc -l | tr -d ' ')
    local functions=$(nm "$binary" 2>/dev/null | grep ' T ' | wc -l | tr -d ' ')
    local secrets=$(strings "$binary" 2>/dev/null | grep -iE "AdminPass2024|sk_live_secret|DBSecret2024" | wc -l | tr -d ' ')

    local entropy="N/A"
    if command -v python3 &> /dev/null; then
        entropy=$(python3 -c "
import math
from collections import Counter
data = open('$binary', 'rb').read()
counter = Counter(data)
length = len(data)
entropy = -sum((count/length) * math.log2(count/length) for count in counter.values())
print(f'{entropy:.4f}')
" 2>/dev/null || echo "N/A")
    fi

    echo "$name,$size,$symbols,$functions,$secrets,$entropy" >> "$METRICS_FILE"
    echo -e "${GREEN}Done${NC}"
}

test_functionality() {
    local binary=$1
    local name=$2

    if [ ! -f "$binary" ]; then
        return 1
    fi

    echo -n "Testing $name functionality... "

    if "$binary" "AdminPass2024!" "sk_live_secret_12345" > /dev/null 2>&1; then
        echo -e "${GREEN}PASS${NC}"
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        return 1
    fi
}

################################################################################
print_header "SCENARIO 5b: Single Iteration Only (avoiding crash)"
################################################################################

echo "5a. Single pass application (control)..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/05a_single.bc" 2>&1 | grep -q "Segmentation fault"; then
    echo "ERROR: Single pass failed!"
else
    $CLANG -O0 "$OUTPUT_DIR/ir/05a_single.bc" -o "$OUTPUT_DIR/binaries/05a_single_pass"
    measure_binary "$OUTPUT_DIR/binaries/05a_single_pass" "05a_single_pass"
    test_functionality "$OUTPUT_DIR/binaries/05a_single_pass" "05a_single_pass"
fi

################################################################################
print_header "SCENARIO 6: Optimization with Layer 1 Flags"
################################################################################

LAYER1_FLAGS="-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 -Wl,-s"

echo "6a. Layer 1 flags only (no OLLVM)..."
$CLANG $LAYER1_FLAGS "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06a_layer1_only"
measure_binary "$OUTPUT_DIR/binaries/06a_layer1_only" "06a_layer1_only"
test_functionality "$OUTPUT_DIR/binaries/06a_layer1_only" "06a_layer1_only"

echo "6b. OLLVM passes + Layer 1 flags..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/06b_obf.bc" 2>/dev/null; then
    $CLANG $LAYER1_FLAGS "$OUTPUT_DIR/ir/06b_obf.bc" -o "$OUTPUT_DIR/binaries/06b_ollvm_plus_layer1"
    measure_binary "$OUTPUT_DIR/binaries/06b_ollvm_plus_layer1" "06b_ollvm_plus_layer1"
    test_functionality "$OUTPUT_DIR/binaries/06b_ollvm_plus_layer1" "06b_ollvm_plus_layer1"
fi

echo "6c. Individual Layer 1 flags..."
$CLANG -flto "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06c_lto_only"
measure_binary "$OUTPUT_DIR/binaries/06c_lto_only" "06c_lto_only"

$CLANG -fvisibility=hidden "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06d_visibility_only"
measure_binary "$OUTPUT_DIR/binaries/06d_visibility_only" "06d_visibility_only"

$CLANG -O3 "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06e_O3_only"
measure_binary "$OUTPUT_DIR/binaries/06e_O3_only" "06e_O3_only"

$CLANG -mspeculative-load-hardening -O3 "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06f_spectre_O3"
measure_binary "$OUTPUT_DIR/binaries/06f_spectre_O3" "06f_spectre_O3"

################################################################################
print_header "SCENARIO 7: Pattern Recognition Analysis"
################################################################################

echo "7. Capturing IR transformations..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/07a_original.ll"

if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening' \
    "$OUTPUT_DIR/ir/07a_original.ll" -S -o "$OUTPUT_DIR/ir/07b_after_flatten.ll" 2>/dev/null; then

    $OPT_TOOL -O1 "$OUTPUT_DIR/ir/07b_after_flatten.ll" -S -o "$OUTPUT_DIR/ir/07c_after_O1.ll" 2>/dev/null || true
    $OPT_TOOL -O2 "$OUTPUT_DIR/ir/07c_after_O1.ll" -S -o "$OUTPUT_DIR/ir/07d_after_O2.ll" 2>/dev/null || true
    $OPT_TOOL -O3 "$OUTPUT_DIR/ir/07d_after_O2.ll" -S -o "$OUTPUT_DIR/ir/07e_after_O3.ll" 2>/dev/null || true

    echo "Analyzing IR size changes..."
    for ir_file in "$OUTPUT_DIR/ir/07"*.ll; do
        if [ -f "$ir_file" ]; then
            name=$(basename "$ir_file")
            lines=$(wc -l < "$ir_file")
            bbs=$(grep -c "^[a-zA-Z0-9_]*:" "$ir_file" || echo "0")
            switches=$(grep -c "switch i32" "$ir_file" || echo "0")
            echo "  $name: $lines lines, $bbs basic blocks, $switches switches"
        fi
    done
fi

################################################################################
print_header "SCENARIO 8: Optimization Level Impact"
################################################################################

echo "Testing how different optimization levels affect obfuscated code..."

for opt_level in 0 1 2 3 s z; do
    echo "8.$opt_level. OLLVM + O$opt_level..."
    $CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
    if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
        "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/08_${opt_level}_obf.bc" 2>/dev/null; then
        $CLANG -O$opt_level "$OUTPUT_DIR/ir/08_${opt_level}_obf.bc" -o "$OUTPUT_DIR/binaries/08_${opt_level}_ollvm_O${opt_level}" 2>/dev/null || true
        measure_binary "$OUTPUT_DIR/binaries/08_${opt_level}_ollvm_O${opt_level}" "08_${opt_level}_ollvm_O${opt_level}"
        test_functionality "$OUTPUT_DIR/binaries/08_${opt_level}_ollvm_O${opt_level}" "08_${opt_level}_ollvm_O${opt_level}"
    fi
done

################################################################################
print_header "SCENARIO 9: Individual Pass Impact with O3"
################################################################################

echo "Testing each OLLVM pass individually WITH O3 optimization..."

echo "9a. Flattening + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09a_flat.bc" 2>/dev/null; then
    $CLANG -O3 "$OUTPUT_DIR/ir/09a_flat.bc" -o "$OUTPUT_DIR/binaries/09a_flat_O3"
    measure_binary "$OUTPUT_DIR/binaries/09a_flat_O3" "09a_flat_O3"
    test_functionality "$OUTPUT_DIR/binaries/09a_flat_O3" "09a_flat_O3"
fi

echo "9b. Substitution + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='substitution' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09b_subst.bc" 2>/dev/null; then
    $CLANG -O3 "$OUTPUT_DIR/ir/09b_subst.bc" -o "$OUTPUT_DIR/binaries/09b_subst_O3"
    measure_binary "$OUTPUT_DIR/binaries/09b_subst_O3" "09b_subst_O3"
    test_functionality "$OUTPUT_DIR/binaries/09b_subst_O3" "09b_subst_O3"
fi

echo "9c. Bogus CF + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='boguscf' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09c_bogus.bc" 2>/dev/null; then
    $CLANG -O3 "$OUTPUT_DIR/ir/09c_bogus.bc" -o "$OUTPUT_DIR/binaries/09c_bogus_O3"
    measure_binary "$OUTPUT_DIR/binaries/09c_bogus_O3" "09c_bogus_O3"
    test_functionality "$OUTPUT_DIR/binaries/09c_bogus_O3" "09c_bogus_O3"
fi

echo "9d. Split + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09d_split.bc" 2>/dev/null; then
    $CLANG -O3 "$OUTPUT_DIR/ir/09d_split.bc" -o "$OUTPUT_DIR/binaries/09d_split_O3"
    measure_binary "$OUTPUT_DIR/binaries/09d_split_O3" "09d_split_O3"
    test_functionality "$OUTPUT_DIR/binaries/09d_split_O3" "09d_split_O3"
fi

################################################################################
print_header "SCENARIO 10: Comprehensive Combinations"
################################################################################

echo "10a. Each flag from Layer 1 + OLLVM..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
if $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/10a_obf.bc" 2>/dev/null; then

    $CLANG -flto "$OUTPUT_DIR/ir/10a_obf.bc" -o "$OUTPUT_DIR/binaries/10a_ollvm_lto"
    measure_binary "$OUTPUT_DIR/binaries/10a_ollvm_lto" "10a_ollvm_lto"

    $CLANG -flto -fvisibility=hidden "$OUTPUT_DIR/ir/10a_obf.bc" -o "$OUTPUT_DIR/binaries/10b_ollvm_lto_vis"
    measure_binary "$OUTPUT_DIR/binaries/10b_ollvm_lto_vis" "10b_ollvm_lto_vis"

    $CLANG -flto -fvisibility=hidden -O3 "$OUTPUT_DIR/ir/10a_obf.bc" -o "$OUTPUT_DIR/binaries/10c_ollvm_lto_vis_O3"
    measure_binary "$OUTPUT_DIR/binaries/10c_ollvm_lto_vis_O3" "10c_ollvm_lto_vis_O3"
fi

print_header "Test Complete"
echo ""
echo "Results summary:"
cat "$METRICS_FILE" | column -t -s,
