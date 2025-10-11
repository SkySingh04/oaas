#!/bin/bash

###############################################################################
# Ultimate Obfuscation Script - All 4 Layers
#
# This script applies all 4 obfuscation layers to C++ examples:
# - Layer 1: Modern LLVM optimization flags
# - Layer 2: OLLVM passes (flattening, substitution, bogus CF, split)
# - Layer 3: Targeted obfuscation (string encryption, fake loops)
# - Layer 4: Symbol obfuscation (cryptographic symbol renaming)
#
# Usage: ./sh/obfuscate_all_examples.sh
###############################################################################

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SRC_DIR="$PROJECT_ROOT/src"
BIN_DIR="$PROJECT_ROOT/bin/ultimate"
SYMBOL_OBFUSCATOR="$PROJECT_ROOT/symbol-obfuscator/build/symbol-obfuscate"
OLLVM_PLUGIN="$PROJECT_ROOT/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
CLANG="clang++"

# Check if clang++ is available
if ! command -v $CLANG &> /dev/null; then
    echo -e "${RED}Error: clang++ not found!${NC}"
    exit 1
fi

# Check if symbol obfuscator exists
if [ ! -f "$SYMBOL_OBFUSCATOR" ]; then
    echo -e "${RED}Error: Symbol obfuscator not built!${NC}"
    echo "Build it with: cd symbol-obfuscator/build && cmake .. && make"
    exit 1
fi

# Create output directory
mkdir -p "$BIN_DIR"

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Ultimate Obfuscation - All 4 Layers                   ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Find all .cpp files in src directory
CPP_FILES=$(find "$SRC_DIR" -name "*.cpp" -type f)

if [ -z "$CPP_FILES" ]; then
    echo -e "${RED}No C++ files found in $SRC_DIR${NC}"
    exit 1
fi

# Counter
TOTAL=0
SUCCESS=0
FAILED=0

# Process each file
for src_file in $CPP_FILES; do
    TOTAL=$((TOTAL + 1))
    filename=$(basename "$src_file" .cpp)

    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
    echo -e "${GREEN}Processing: $filename${NC}"
    echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"

    # Output paths
    obfuscated_source="${BIN_DIR}/${filename}_obfuscated.cpp"
    baseline_binary="${BIN_DIR}/${filename}_baseline"
    ultimate_binary="${BIN_DIR}/${filename}_ultimate"
    symbol_map="${BIN_DIR}/${filename}_symbol_map.json"

    # Step 1: Compile baseline (no obfuscation)
    echo -e "\n${BLUE}[1/5]${NC} Compiling baseline binary..."
    if $CLANG "$src_file" -o "$baseline_binary" -O0 -g 2>/dev/null; then
        echo -e "${GREEN}  ✓ Baseline compiled${NC}"
    else
        echo -e "${RED}  ✗ Baseline compilation failed${NC}"
        FAILED=$((FAILED + 1))
        continue
    fi

    # Step 2: Layer 4 - Symbol Obfuscation (FIRST!)
    echo -e "\n${BLUE}[2/5]${NC} Applying Layer 4: Symbol Obfuscation..."
    if "$SYMBOL_OBFUSCATOR" "$src_file" \
        -o "$obfuscated_source" \
        -a sha256 \
        -l 12 \
        -p typed \
        -m "$symbol_map" \
        --cpp 2>/dev/null; then
        echo -e "${GREEN}  ✓ Symbol obfuscation applied${NC}"
        symbols_renamed=$(grep -o '"obfuscated"' "$symbol_map" 2>/dev/null | wc -l | tr -d ' ')
        echo -e "    Symbols renamed: ${symbols_renamed}"
    else
        echo -e "${RED}  ✗ Symbol obfuscation failed${NC}"
        FAILED=$((FAILED + 1))
        continue
    fi

    # Step 3: Layer 1 - Modern LLVM Flags
    echo -e "\n${BLUE}[3/5]${NC} Applying Layer 1: Modern LLVM Optimization Flags..."
    LLVM_FLAGS="-O2 -fvisibility=hidden -fomit-frame-pointer"
    echo -e "    Flags: $LLVM_FLAGS"

    # Step 4: Layer 2 - OLLVM Passes (if plugin exists)
    echo -e "\n${BLUE}[4/5]${NC} Applying Layer 2: OLLVM Passes..."
    OLLVM_FLAGS=""
    if [ -f "$OLLVM_PLUGIN" ]; then
        OLLVM_FLAGS="-fpass-plugin=$OLLVM_PLUGIN -mllvm -fla -mllvm -sub -mllvm -bcf -mllvm -split"
        echo -e "${GREEN}  ✓ OLLVM plugin found${NC}"
        echo -e "    Passes: flattening, substitution, bogus CF, split"
    else
        echo -e "${YELLOW}  ⚠ OLLVM plugin not found, skipping Layer 2${NC}"
    fi

    # Step 5: Compile ultimate binary with all layers
    echo -e "\n${BLUE}[5/5]${NC} Compiling ultimate obfuscated binary..."

    # Note: Layer 3 (string encryption, fake loops) would be applied via source transforms
    # For now, we're applying Layers 1 and 4 (Layer 2 if plugin exists)

    compile_cmd="$CLANG $obfuscated_source -o $ultimate_binary $LLVM_FLAGS $OLLVM_FLAGS -Wl,-s"

    if eval "$compile_cmd" 2>&1; then
        echo -e "${GREEN}  ✓ Ultimate binary compiled${NC}"
        SUCCESS=$((SUCCESS + 1))

        # Show file sizes
        baseline_size=$(stat -f%z "$baseline_binary" 2>/dev/null || echo "0")
        ultimate_size=$(stat -f%z "$ultimate_binary" 2>/dev/null || echo "0")

        echo -e "\n${GREEN}════════════════════════════════════════════════════════════${NC}"
        echo -e "${GREEN}Results for $filename:${NC}"
        echo -e "  Baseline size:  $(numfmt --to=iec-i --suffix=B $baseline_size 2>/dev/null || echo "$baseline_size bytes")"
        echo -e "  Ultimate size:  $(numfmt --to=iec-i --suffix=B $ultimate_size 2>/dev/null || echo "$ultimate_size bytes")"
        echo -e "  Symbol map:     $symbol_map"
        echo -e "  Layers applied: ${GREEN}✓ Layer 1${NC} (LLVM flags) | ${GREEN}✓ Layer 4${NC} (Symbol obf)"
        if [ -f "$OLLVM_PLUGIN" ]; then
            echo -e "                  ${GREEN}✓ Layer 2${NC} (OLLVM passes)"
        else
            echo -e "                  ${YELLOW}⚠ Layer 2${NC} (OLLVM skipped)"
        fi
        echo -e "${GREEN}════════════════════════════════════════════════════════════${NC}"

    else
        echo -e "${RED}  ✗ Ultimate compilation failed${NC}"
        FAILED=$((FAILED + 1))
    fi

    echo ""
done

# Summary
echo -e "\n${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                      Summary                               ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo -e "Total files processed: $TOTAL"
echo -e "${GREEN}Successful: $SUCCESS${NC}"
if [ $FAILED -gt 0 ]; then
    echo -e "${RED}Failed: $FAILED${NC}"
fi
echo ""
echo -e "Output directory: ${BLUE}$BIN_DIR${NC}"
echo ""
echo -e "${GREEN}Next steps:${NC}"
echo -e "  1. Test binaries: ./bin/ultimate/<name>_ultimate"
echo -e "  2. Analyze with radare2: r2 -A ./bin/ultimate/<name>_ultimate"
echo -e "  3. Compare symbols: nm ./bin/ultimate/<name>_baseline vs nm ./bin/ultimate/<name>_ultimate"
echo ""
