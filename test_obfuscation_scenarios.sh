#!/bin/bash

################################################################################
# Comprehensive Obfuscation Testing Script
# Purpose: Test all scenarios to understand LLVM optimization vs obfuscation
# Date: 2025-10-11
################################################################################

set -e

# Configuration
SOURCE_FILE="/Users/akashsingh/Desktop/llvm/src/simple_auth.c"
OPT_TOOL="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"
CLANG="/usr/bin/clang"
PLUGIN="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
OUTPUT_DIR="/Users/akashsingh/Desktop/llvm/test_results"
METRICS_FILE="$OUTPUT_DIR/comprehensive_metrics.csv"

# Create output directory
mkdir -p "$OUTPUT_DIR"/{binaries,ir,reports}

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper function to print section headers
print_header() {
    echo ""
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BLUE}  $1${NC}"
    echo -e "${BLUE}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
}

# Helper function to measure binary metrics
measure_binary() {
    local binary=$1
    local name=$2

    echo -n "Analyzing $name... "

    # Basic metrics
    local size=$(stat -f%z "$binary" 2>/dev/null || echo "0")
    local symbols=$(nm "$binary" 2>/dev/null | grep -v ' U ' | wc -l | tr -d ' ')
    local functions=$(nm "$binary" 2>/dev/null | grep ' T ' | wc -l | tr -d ' ')
    local secrets=$(strings "$binary" 2>/dev/null | grep -iE "AdminPass2024|sk_live_secret|DBSecret2024" | wc -l | tr -d ' ')

    # Calculate entropy (simplified)
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

# Helper function to test functionality
test_functionality() {
    local binary=$1
    local name=$2

    echo -n "Testing $name functionality... "

    # Test correct password
    if "$binary" "AdminPass2024!" "sk_live_secret_12345" > /dev/null 2>&1; then
        echo -e "${GREEN}PASS${NC}"
        return 0
    else
        echo -e "${RED}FAIL${NC}"
        return 1
    fi
}

# Initialize metrics file
echo "Configuration,Size,Symbols,Functions,Secrets_Visible,Entropy" > "$METRICS_FILE"

################################################################################
print_header "SCENARIO 1: Baseline (No Obfuscation)"
################################################################################

echo "Building baseline binary with -O0..."
$CLANG -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/01_baseline_O0"
measure_binary "$OUTPUT_DIR/binaries/01_baseline_O0" "01_baseline_O0"
test_functionality "$OUTPUT_DIR/binaries/01_baseline_O0" "01_baseline_O0"

echo "Building baseline binary with -O3..."
$CLANG -O3 "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/02_baseline_O3"
measure_binary "$OUTPUT_DIR/binaries/02_baseline_O3" "02_baseline_O3"
test_functionality "$OUTPUT_DIR/binaries/02_baseline_O3" "02_baseline_O3"

################################################################################
print_header "SCENARIO 2: Custom Passes WITHOUT O3"
################################################################################

echo "Testing each pass individually without optimization..."

# Flattening without O3
echo "2a. Flattening only (no optimization)..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/02a_flat_noopt.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/02a_flat_noopt.bc" -o "$OUTPUT_DIR/binaries/02a_flat_noopt"
measure_binary "$OUTPUT_DIR/binaries/02a_flat_noopt" "02a_flat_noopt"
test_functionality "$OUTPUT_DIR/binaries/02a_flat_noopt" "02a_flat_noopt"

# Substitution without O3
echo "2b. Substitution only (no optimization)..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='substitution' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/02b_subst_noopt.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/02b_subst_noopt.bc" -o "$OUTPUT_DIR/binaries/02b_subst_noopt"
measure_binary "$OUTPUT_DIR/binaries/02b_subst_noopt" "02b_subst_noopt"
test_functionality "$OUTPUT_DIR/binaries/02b_subst_noopt" "02b_subst_noopt"

# Bogus CF without O3
echo "2c. Bogus Control Flow only (no optimization)..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='boguscf' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/02c_bogus_noopt.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/02c_bogus_noopt.bc" -o "$OUTPUT_DIR/binaries/02c_bogus_noopt"
measure_binary "$OUTPUT_DIR/binaries/02c_bogus_noopt" "02c_bogus_noopt"
test_functionality "$OUTPUT_DIR/binaries/02c_bogus_noopt" "02c_bogus_noopt"

# Split without O3
echo "2d. Split Basic Blocks only (no optimization)..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/02d_split_noopt.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/02d_split_noopt.bc" -o "$OUTPUT_DIR/binaries/02d_split_noopt"
measure_binary "$OUTPUT_DIR/binaries/02d_split_noopt" "02d_split_noopt"
test_functionality "$OUTPUT_DIR/binaries/02d_split_noopt" "02d_split_noopt"

# All passes without O3
echo "2e. All passes combined (no optimization)..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/02e_all_noopt.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/02e_all_noopt.bc" -o "$OUTPUT_DIR/binaries/02e_all_noopt"
measure_binary "$OUTPUT_DIR/binaries/02e_all_noopt" "02e_all_noopt"
test_functionality "$OUTPUT_DIR/binaries/02e_all_noopt" "02e_all_noopt"

################################################################################
print_header "SCENARIO 3: Obfuscation BEFORE Optimization"
################################################################################

echo "Testing obfuscation first, then optimization..."

echo "3a. All passes -> then O1..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/03a_obf_temp.bc"
$CLANG -O1 "$OUTPUT_DIR/ir/03a_obf_temp.bc" -o "$OUTPUT_DIR/binaries/03a_obf_then_O1"
measure_binary "$OUTPUT_DIR/binaries/03a_obf_then_O1" "03a_obf_then_O1"
test_functionality "$OUTPUT_DIR/binaries/03a_obf_then_O1" "03a_obf_then_O1"

echo "3b. All passes -> then O2..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/03b_obf_temp.bc"
$CLANG -O2 "$OUTPUT_DIR/ir/03b_obf_temp.bc" -o "$OUTPUT_DIR/binaries/03b_obf_then_O2"
measure_binary "$OUTPUT_DIR/binaries/03b_obf_then_O2" "03b_obf_then_O2"
test_functionality "$OUTPUT_DIR/binaries/03b_obf_then_O2" "03b_obf_then_O2"

echo "3c. All passes -> then O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/03c_obf_temp.bc"
$CLANG -O3 "$OUTPUT_DIR/ir/03c_obf_temp.bc" -o "$OUTPUT_DIR/binaries/03c_obf_then_O3"
measure_binary "$OUTPUT_DIR/binaries/03c_obf_then_O3" "03c_obf_then_O3"
test_functionality "$OUTPUT_DIR/binaries/03c_obf_then_O3" "03c_obf_then_O3"

################################################################################
print_header "SCENARIO 4: Different Pass Orderings"
################################################################################

echo "Testing different orderings of OLLVM passes..."

# Test all 24 permutations of 4 passes (flattening, substitution, boguscf, split)
ORDERINGS=(
    "flattening,substitution,boguscf,split"
    "flattening,substitution,split,boguscf"
    "flattening,boguscf,substitution,split"
    "flattening,boguscf,split,substitution"
    "flattening,split,substitution,boguscf"
    "flattening,split,boguscf,substitution"
    "substitution,flattening,boguscf,split"
    "substitution,flattening,split,boguscf"
    "substitution,boguscf,flattening,split"
    "substitution,boguscf,split,flattening"
    "boguscf,flattening,substitution,split"
    "split,substitution,boguscf,flattening"
)

idx=0
for order in "${ORDERINGS[@]}"; do
    idx=$((idx + 1))
    echo "4.$idx. Order: $order (no opt)..."
    $CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
    $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes="$order" \
        "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/04_${idx}_temp.bc"
    $CLANG -O0 "$OUTPUT_DIR/ir/04_${idx}_temp.bc" -o "$OUTPUT_DIR/binaries/04_${idx}_order_noopt"
    measure_binary "$OUTPUT_DIR/binaries/04_${idx}_order_noopt" "04_${idx}_order_noopt"
    test_functionality "$OUTPUT_DIR/binaries/04_${idx}_order_noopt" "04_${idx}_order_noopt"
done

################################################################################
print_header "SCENARIO 5: Multiple Pass Iterations"
################################################################################

echo "Testing multiple iterations of obfuscation passes..."

echo "5a. Apply all passes 2 times..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/05a_iter1.bc"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/05a_iter1.bc" -o "$OUTPUT_DIR/ir/05a_iter2.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/05a_iter2.bc" -o "$OUTPUT_DIR/binaries/05a_double_pass"
measure_binary "$OUTPUT_DIR/binaries/05a_double_pass" "05a_double_pass"
test_functionality "$OUTPUT_DIR/binaries/05a_double_pass" "05a_double_pass"

echo "5b. Apply all passes 3 times..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/05b_iter1.bc"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/05b_iter1.bc" -o "$OUTPUT_DIR/ir/05b_iter2.bc"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/05b_iter2.bc" -o "$OUTPUT_DIR/ir/05b_iter3.bc"
$CLANG -O0 "$OUTPUT_DIR/ir/05b_iter3.bc" -o "$OUTPUT_DIR/binaries/05b_triple_pass"
measure_binary "$OUTPUT_DIR/binaries/05b_triple_pass" "05b_triple_pass"
test_functionality "$OUTPUT_DIR/binaries/05b_triple_pass" "05b_triple_pass"

################################################################################
print_header "SCENARIO 6: Optimization with Layer 1 Flags"
################################################################################

echo "Testing modern LLVM flags (Layer 1) with and without OLLVM..."

LAYER1_FLAGS="-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 -Wl,-s"

echo "6a. Layer 1 flags only (no OLLVM)..."
$CLANG $LAYER1_FLAGS "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06a_layer1_only"
measure_binary "$OUTPUT_DIR/binaries/06a_layer1_only" "06a_layer1_only"
test_functionality "$OUTPUT_DIR/binaries/06a_layer1_only" "06a_layer1_only"

echo "6b. OLLVM passes + Layer 1 flags..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/06b_obf.bc"
$CLANG $LAYER1_FLAGS "$OUTPUT_DIR/ir/06b_obf.bc" -o "$OUTPUT_DIR/binaries/06b_ollvm_plus_layer1"
measure_binary "$OUTPUT_DIR/binaries/06b_ollvm_plus_layer1" "06b_ollvm_plus_layer1"
test_functionality "$OUTPUT_DIR/binaries/06b_ollvm_plus_layer1" "06b_ollvm_plus_layer1"

echo "6c. Layer 1 individual flag testing..."
# Test impact of each Layer 1 flag
$CLANG -flto "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06c_lto_only"
measure_binary "$OUTPUT_DIR/binaries/06c_lto_only" "06c_lto_only"

$CLANG -fvisibility=hidden "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06d_visibility_only"
measure_binary "$OUTPUT_DIR/binaries/06d_visibility_only" "06d_visibility_only"

$CLANG -O3 "$SOURCE_FILE" -o "$OUTPUT_DIR/binaries/06e_O3_only"
measure_binary "$OUTPUT_DIR/binaries/06e_O3_only" "06e_O3_only"

################################################################################
print_header "SCENARIO 7: Pattern Recognition Analysis"
################################################################################

echo "Testing if LLVM recognizes and optimizes away obfuscation patterns..."

# Save IR at different stages to analyze transformations
echo "7a. Capturing IR transformations..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/07a_original.ll"

$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening' \
    "$OUTPUT_DIR/ir/07a_original.ll" -S -o "$OUTPUT_DIR/ir/07b_after_flatten.ll"

$OPT_TOOL -O1 "$OUTPUT_DIR/ir/07b_after_flatten.ll" -S -o "$OUTPUT_DIR/ir/07c_after_O1.ll"

$OPT_TOOL -O2 "$OUTPUT_DIR/ir/07c_after_O1.ll" -S -o "$OUTPUT_DIR/ir/07d_after_O2.ll"

$OPT_TOOL -O3 "$OUTPUT_DIR/ir/07d_after_O2.ll" -S -o "$OUTPUT_DIR/ir/07e_after_O3.ll"

echo "Analyzing IR size changes..."
for ir_file in "$OUTPUT_DIR/ir/07"*.ll; do
    name=$(basename "$ir_file")
    lines=$(wc -l < "$ir_file")
    bbs=$(grep -c "^[a-zA-Z0-9_]*:" "$ir_file" || echo "0")
    switches=$(grep -c "switch i32" "$ir_file" || echo "0")
    echo "  $name: $lines lines, $bbs basic blocks, $switches switches"
done

################################################################################
print_header "SCENARIO 8: Optimization Level Impact"
################################################################################

echo "Testing how different optimization levels affect obfuscated code..."

for opt_level in 0 1 2 3 s z; do
    echo "8.$opt_level. OLLVM + O$opt_level..."
    $CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
    $OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening,substitution,boguscf,split' \
        "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/08_${opt_level}_obf.bc"
    $CLANG -O$opt_level "$OUTPUT_DIR/ir/08_${opt_level}_obf.bc" -o "$OUTPUT_DIR/binaries/08_${opt_level}_ollvm_O${opt_level}"
    measure_binary "$OUTPUT_DIR/binaries/08_${opt_level}_ollvm_O${opt_level}" "08_${opt_level}_ollvm_O${opt_level}"
    test_functionality "$OUTPUT_DIR/binaries/08_${opt_level}_ollvm_O${opt_level}" "08_${opt_level}_ollvm_O${opt_level}"
done

################################################################################
print_header "SCENARIO 9: Individual Pass Impact with O3"
################################################################################

echo "Testing each OLLVM pass individually WITH O3 optimization..."

echo "9a. Flattening + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='flattening' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09a_flat.bc"
$CLANG -O3 "$OUTPUT_DIR/ir/09a_flat.bc" -o "$OUTPUT_DIR/binaries/09a_flat_O3"
measure_binary "$OUTPUT_DIR/binaries/09a_flat_O3" "09a_flat_O3"
test_functionality "$OUTPUT_DIR/binaries/09a_flat_O3" "09a_flat_O3"

echo "9b. Substitution + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='substitution' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09b_subst.bc"
$CLANG -O3 "$OUTPUT_DIR/ir/09b_subst.bc" -o "$OUTPUT_DIR/binaries/09b_subst_O3"
measure_binary "$OUTPUT_DIR/binaries/09b_subst_O3" "09b_subst_O3"
test_functionality "$OUTPUT_DIR/binaries/09b_subst_O3" "09b_subst_O3"

echo "9c. Bogus CF + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='boguscf' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09c_bogus.bc"
$CLANG -O3 "$OUTPUT_DIR/ir/09c_bogus.bc" -o "$OUTPUT_DIR/binaries/09c_bogus_O3"
measure_binary "$OUTPUT_DIR/binaries/09c_bogus_O3" "09c_bogus_O3"
test_functionality "$OUTPUT_DIR/binaries/09c_bogus_O3" "09c_bogus_O3"

echo "9d. Split + O3..."
$CLANG -S -emit-llvm -O0 "$SOURCE_FILE" -o "$OUTPUT_DIR/ir/test.ll"
$OPT_TOOL -load-pass-plugin="$PLUGIN" -passes='split' \
    "$OUTPUT_DIR/ir/test.ll" -o "$OUTPUT_DIR/ir/09d_split.bc"
$CLANG -O3 "$OUTPUT_DIR/ir/09d_split.bc" -o "$OUTPUT_DIR/binaries/09d_split_O3"
measure_binary "$OUTPUT_DIR/binaries/09d_split_O3" "09d_split_O3"
test_functionality "$OUTPUT_DIR/binaries/09d_split_O3" "09d_split_O3"

################################################################################
print_header "Test Results Summary"
################################################################################

echo -e "${GREEN}All tests completed!${NC}"
echo ""
echo "Results saved to: $OUTPUT_DIR"
echo "  - Binaries: $OUTPUT_DIR/binaries/"
echo "  - IR files: $OUTPUT_DIR/ir/"
echo "  - Metrics: $METRICS_FILE"
echo ""
echo "Quick summary:"
cat "$METRICS_FILE" | column -t -s,
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo "  1. Analyze metrics CSV for patterns"
echo "  2. Compare IR files to see optimization impact"
echo "  3. Test binaries with radare2 for deeper analysis"
echo "  4. Document findings in OBFUSCATION_COMPLETE.md"
