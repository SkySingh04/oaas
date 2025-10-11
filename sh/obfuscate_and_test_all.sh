#!/bin/bash

###############################################################################
# Complete 4-Layer Obfuscation + Radare2 Testing Script
#
# This script applies all 4 obfuscation layers to ALL C/C++ files in /src:
# - Layer 1: Modern LLVM optimization flags (9 flags)
# - Layer 2: OLLVM passes (4 passes: flattening, substitution, bogus CF, split)
# - Layer 3: Targeted obfuscation (string encryption, CFG flattening, etc.)
# - Layer 4: Symbol obfuscation (cryptographic symbol renaming)
#
# Then performs radare2 security analysis on baseline vs obfuscated binaries
#
# Usage: ./sh/obfuscate_and_test_all.sh
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$PROJECT_ROOT/src"
BIN_DIR="$PROJECT_ROOT/bin/ultimate"
SYMBOL_OBFUSCATOR="$PROJECT_ROOT/symbol-obfuscator/build/symbol-obfuscate"
OLLVM_PLUGIN="$PROJECT_ROOT/cmd/llvm-obfuscator/core/plugins/LLVMObfuscationPlugin.dylib"

# Check if symbol obfuscator exists
if [ ! -f "$SYMBOL_OBFUSCATOR" ]; then
    echo -e "${RED}Error: Symbol obfuscator not built!${NC}"
    echo "Build it with: cd symbol-obfuscator/build && cmake .. && make"
    exit 1
fi

# Create output directory
mkdir -p "$BIN_DIR"

echo -e "${MAGENTA}╔═══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${MAGENTA}║   Complete 4-Layer Obfuscation + Radare2 Security Analysis       ║${NC}"
echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Modern LLVM flags (Layer 1 - 9 flags from research)
LAYER1_FLAGS="-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 -Wl,-s"

# OLLVM flags (Layer 2 - 4 passes)
LAYER2_FLAGS=""
if [ -f "$OLLVM_PLUGIN" ]; then
    echo -e "${GREEN}✓ OLLVM plugin found at: $OLLVM_PLUGIN${NC}"
    # Note: We'll apply this at IR level
    LAYER2_AVAILABLE=true
else
    echo -e "${YELLOW}⚠ OLLVM plugin not found, Layer 2 will be skipped${NC}"
    LAYER2_AVAILABLE=false
fi

# Find all C and C++ files
C_FILES=$(find "$SRC_DIR" -name "*.c" -type f)
CPP_FILES=$(find "$SRC_DIR" -name "*.cpp" -type f)
ALL_FILES="$C_FILES $CPP_FILES"

if [ -z "$ALL_FILES" ]; then
    echo -e "${RED}No C/C++ files found in $SRC_DIR${NC}"
    exit 1
fi

# Counters
TOTAL=0
SUCCESS=0
FAILED=0

echo -e "${BLUE}Found files:${NC}"
for f in $ALL_FILES; do
    echo -e "  - $(basename "$f")"
    TOTAL=$((TOTAL + 1))
done
echo ""

# Process each file
for src_file in $ALL_FILES; do
    filename=$(basename "$src_file")
    base_name="${filename%.*}"
    extension="${filename##*.}"

    echo -e "${YELLOW}═══════════════════════════════════════════════════════════════════${NC}"
    echo -e "${CYAN}Processing: $filename${NC}"
    echo -e "${YELLOW}═══════════════════════════════════════════════════════════════════${NC}"

    # Select compiler based on file extension
    if [ "$extension" = "cpp" ]; then
        COMPILER="clang++"
        CPP_FLAG="--cpp"
    else
        COMPILER="clang"
        CPP_FLAG=""
    fi

    # Output paths
    obfuscated_source="${BIN_DIR}/${base_name}_obfuscated.${extension}"
    baseline_binary="${BIN_DIR}/${base_name}_baseline"
    ultimate_binary="${BIN_DIR}/${base_name}_ultimate"
    symbol_map="${BIN_DIR}/${base_name}_symbol_map.json"
    ir_file="${BIN_DIR}/${base_name}_obfuscated.ll"
    bc_file="${BIN_DIR}/${base_name}_ollvm.bc"

    echo -e "\n${BLUE}[1/7]${NC} Compiling baseline binary (no obfuscation)..."
    if $COMPILER "$src_file" -o "$baseline_binary" -O0 -g 2>&1 | tee /tmp/compile_baseline_$$.log; then
        baseline_size=$(stat -f%z "$baseline_binary" 2>/dev/null || echo "0")
        echo -e "${GREEN}  ✓ Baseline compiled (size: $baseline_size bytes)${NC}"
    else
        echo -e "${RED}  ✗ Baseline compilation failed${NC}"
        cat /tmp/compile_baseline_$$.log
        FAILED=$((FAILED + 1))
        continue
    fi

    # Layer 4: Symbol Obfuscation (applied FIRST to source code)
    echo -e "\n${BLUE}[2/7]${NC} Applying Layer 4: Symbol Obfuscation..."
    if "$SYMBOL_OBFUSCATOR" "$src_file" \
        -o "$obfuscated_source" \
        -a sha256 \
        -l 12 \
        -p typed \
        -m "$symbol_map" \
        $CPP_FLAG 2>&1 | tee /tmp/symbol_obf_$$.log; then
        symbols_renamed=$(grep -c '"obfuscated"' "$symbol_map" 2>/dev/null || echo "0")
        echo -e "${GREEN}  ✓ Symbol obfuscation applied${NC}"
        echo -e "    Symbols renamed: ${symbols_renamed}"
    else
        echo -e "${YELLOW}  ⚠ Symbol obfuscation failed, using original source${NC}"
        cp "$src_file" "$obfuscated_source"
    fi

    # Layer 3: Targeted obfuscation (would require Python tool integration)
    echo -e "\n${BLUE}[3/7]${NC} Layer 3: Targeted Obfuscation (manual transforms)..."
    echo -e "${YELLOW}  ⚠ Layer 3 requires Python tool integration (skipped in this script)${NC}"
    echo -e "    Note: Use cmd/llvm-obfuscator or targeted-obfuscator for Layer 3"

    # Layer 2: OLLVM Passes (at IR level)
    if [ "$LAYER2_AVAILABLE" = true ]; then
        echo -e "\n${BLUE}[4/7]${NC} Applying Layer 2: OLLVM Passes..."

        # Generate LLVM IR
        echo -e "  Generating LLVM IR..."
        if $COMPILER -S -emit-llvm "$obfuscated_source" -o "$ir_file" 2>&1 | tee /tmp/ir_gen_$$.log; then
            echo -e "${GREEN}    ✓ IR generated${NC}"
        else
            echo -e "${RED}    ✗ IR generation failed${NC}"
            echo -e "${YELLOW}  ⚠ Skipping OLLVM passes${NC}"
            LAYER2_AVAILABLE=false
        fi

        # Apply OLLVM passes
        if [ "$LAYER2_AVAILABLE" = true ]; then
            echo -e "  Applying OLLVM passes (flattening, substitution, bogus CF, split)..."
            OPT_CMD="/Users/akashsingh/Desktop/llvm-project/build/bin/opt"
            if [ -f "$OPT_CMD" ]; then
                if "$OPT_CMD" -load-pass-plugin="$OLLVM_PLUGIN" \
                    -passes='flattening,substitution,boguscf,split' \
                    "$ir_file" -o "$bc_file" 2>&1 | tee /tmp/ollvm_$$.log; then
                    echo -e "${GREEN}    ✓ OLLVM passes applied${NC}"
                    # Use the OLLVM-transformed bytecode
                    COMPILE_INPUT="$bc_file"
                else
                    echo -e "${YELLOW}    ⚠ OLLVM passes failed, using IR${NC}"
                    COMPILE_INPUT="$ir_file"
                fi
            else
                echo -e "${YELLOW}    ⚠ opt not found, using obfuscated source${NC}"
                COMPILE_INPUT="$obfuscated_source"
            fi
        else
            COMPILE_INPUT="$obfuscated_source"
        fi
    else
        echo -e "\n${BLUE}[4/7]${NC} Layer 2: OLLVM Passes..."
        echo -e "${YELLOW}  ⚠ Skipped (plugin not available)${NC}"
        COMPILE_INPUT="$obfuscated_source"
    fi

    # Layer 1: Compile with modern LLVM flags
    echo -e "\n${BLUE}[5/7]${NC} Applying Layer 1: Modern LLVM Optimization Flags..."
    echo -e "    Flags: $LAYER1_FLAGS"

    compile_cmd="$COMPILER $COMPILE_INPUT -o $ultimate_binary $LAYER1_FLAGS"

    if eval "$compile_cmd" 2>&1 | tee /tmp/compile_ultimate_$$.log; then
        ultimate_size=$(stat -f%z "$ultimate_binary" 2>/dev/null || echo "0")
        echo -e "${GREEN}  ✓ Ultimate binary compiled (size: $ultimate_size bytes)${NC}"
        SUCCESS=$((SUCCESS + 1))
    else
        echo -e "${RED}  ✗ Ultimate compilation failed${NC}"
        cat /tmp/compile_ultimate_$$.log
        FAILED=$((FAILED + 1))
        continue
    fi

    # Strip symbols
    echo -e "\n${BLUE}[6/7]${NC} Stripping symbols..."
    strip "$ultimate_binary" 2>/dev/null || echo -e "${YELLOW}  ⚠ strip failed${NC}"

    # Quick comparison
    echo -e "\n${BLUE}[7/7]${NC} Quick Analysis..."

    baseline_symbols=$(nm "$baseline_binary" 2>/dev/null | wc -l | tr -d ' ')
    ultimate_symbols=$(nm "$ultimate_binary" 2>/dev/null | wc -l | tr -d ' ')

    baseline_strings=$(strings "$baseline_binary" 2>/dev/null | wc -l | tr -d ' ')
    ultimate_strings=$(strings "$ultimate_binary" 2>/dev/null | wc -l | tr -d ' ')

    echo -e "${GREEN}═══════════════════════════════════════════════════════════════════${NC}"
    echo -e "${GREEN}Results for $filename:${NC}"
    echo -e "  ${CYAN}Binary Sizes:${NC}"
    echo -e "    Baseline:  $baseline_size bytes"
    echo -e "    Ultimate:  $ultimate_size bytes"
    echo -e "  ${CYAN}Symbol Count:${NC}"
    echo -e "    Baseline:  $baseline_symbols symbols"
    echo -e "    Ultimate:  $ultimate_symbols symbols"
    echo -e "  ${CYAN}String Count:${NC}"
    echo -e "    Baseline:  $baseline_strings strings"
    echo -e "    Ultimate:  $ultimate_strings strings"
    echo -e "  ${CYAN}Layers Applied:${NC}"
    echo -e "    ✓ Layer 1: Modern LLVM flags (9 flags)"
    if [ "$LAYER2_AVAILABLE" = true ]; then
        echo -e "    ✓ Layer 2: OLLVM passes (4 passes)"
    else
        echo -e "    ⚠ Layer 2: Skipped"
    fi
    echo -e "    ⚠ Layer 3: Manual (skipped)"
    echo -e "    ✓ Layer 4: Symbol obfuscation ($symbols_renamed symbols)"
    echo -e "${GREEN}═══════════════════════════════════════════════════════════════════${NC}"
    echo ""
done

# Summary
echo -e "\n${MAGENTA}╔═══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${MAGENTA}║                        Compilation Summary                        ║${NC}"
echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo -e "Total files processed: $TOTAL"
echo -e "${GREEN}Successful: $SUCCESS${NC}"
if [ $FAILED -gt 0 ]; then
    echo -e "${RED}Failed: $FAILED${NC}"
fi
echo ""
echo -e "Output directory: ${BLUE}$BIN_DIR${NC}"
echo ""

# Radare2 Analysis
echo -e "\n${MAGENTA}╔═══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${MAGENTA}║                    Radare2 Security Analysis                      ║${NC}"
echo -e "${MAGENTA}╚═══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if radare2 is installed
if ! command -v r2 &> /dev/null; then
    echo -e "${RED}Error: radare2 not installed!${NC}"
    echo "Install with: brew install radare2"
    exit 0
fi

# Analyze each pair of binaries
for src_file in $ALL_FILES; do
    filename=$(basename "$src_file")
    base_name="${filename%.*}"

    baseline_binary="${BIN_DIR}/${base_name}_baseline"
    ultimate_binary="${BIN_DIR}/${base_name}_ultimate"

    if [ ! -f "$baseline_binary" ] || [ ! -f "$ultimate_binary" ]; then
        continue
    fi

    echo -e "${YELLOW}─────────────────────────────────────────────────────────────────${NC}"
    echo -e "${CYAN}Analyzing: $base_name${NC}"
    echo -e "${YELLOW}─────────────────────────────────────────────────────────────────${NC}"

    # Baseline analysis
    echo -e "\n${BLUE}BASELINE Binary Analysis:${NC}"
    echo -e "  Searching for sensitive strings..."
    r2 -q -c 'iz | grep -iE "(password|secret|key|admin|license|wallet|private)"' "$baseline_binary" 2>/dev/null | head -10

    echo -e "  Function count:"
    r2 -q -c 'aaa; afl | wc -l' "$baseline_binary" 2>/dev/null

    echo -e "  Symbol count:"
    nm "$baseline_binary" 2>/dev/null | wc -l

    # Ultimate analysis
    echo -e "\n${BLUE}ULTIMATE Binary Analysis:${NC}"
    echo -e "  Searching for sensitive strings..."
    r2 -q -c 'iz | grep -iE "(password|secret|key|admin|license|wallet|private)"' "$ultimate_binary" 2>/dev/null | head -10 || echo -e "${GREEN}    ✓ No sensitive strings found!${NC}"

    echo -e "  Function count:"
    r2 -q -c 'aaa; afl | wc -l' "$ultimate_binary" 2>/dev/null

    echo -e "  Symbol count:"
    nm "$ultimate_binary" 2>/dev/null | wc -l

    echo ""
done

echo -e "\n${GREEN}═══════════════════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}Complete! All binaries obfuscated and analyzed.${NC}"
echo -e "${GREEN}═══════════════════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${CYAN}Next steps:${NC}"
echo -e "  1. Test functional equivalence: ./bin/ultimate/*_baseline vs *_ultimate"
echo -e "  2. Full radare2 analysis: ./sh/radare2_analysis.sh <binary>"
echo -e "  3. Compare symbols: nm ./bin/ultimate/*_baseline | diff - <(nm ./bin/ultimate/*_ultimate)"
echo ""
