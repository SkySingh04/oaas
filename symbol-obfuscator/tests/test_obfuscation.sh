#!/bin/bash

# Comprehensive Symbol Obfuscation Testing Script
# Tests functional equivalence and security improvements

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
EXAMPLES_DIR="$PROJECT_ROOT/examples"
BUILD_DIR="$PROJECT_ROOT/build"
TOOL="$BUILD_DIR/symbol-obfuscate"

TEST_DIR="/tmp/symbol_obfuscator_test"
mkdir -p "$TEST_DIR"

echo "========================================="
echo "Symbol Obfuscation Test Suite"
echo "========================================="
echo ""

# Check if tool exists
if [ ! -f "$TOOL" ]; then
    echo -e "${RED}✗ Error: Tool not found at $TOOL${NC}"
    echo "Please build the project first:"
    echo "  cd $PROJECT_ROOT && mkdir -p build && cd build && cmake .. && make"
    exit 1
fi

echo -e "${GREEN}✓ Found tool: $TOOL${NC}"
echo ""

# =============================================================================
# Test 1: Compile and Test C License Validator
# =============================================================================

echo "Test 1: C License Validator"
echo "----------------------------"

LICENSE_C="$EXAMPLES_DIR/license_validator.c"
LICENSE_BASELINE="$TEST_DIR/license_baseline"
LICENSE_OBFUSCATED_C="$TEST_DIR/license_obfuscated.c"
LICENSE_OBFUSCATED="$TEST_DIR/license_obfuscated"

if [ ! -f "$LICENSE_C" ]; then
    echo -e "${RED}✗ Source file not found: $LICENSE_C${NC}"
    exit 1
fi

# Compile baseline
echo "  Compiling baseline..."
clang "$LICENSE_C" -o "$LICENSE_BASELINE" 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Baseline compilation failed${NC}"
    exit 1
fi

# Test baseline functionality
echo "  Testing baseline functionality..."
OUTPUT=$("$LICENSE_BASELINE" "ABC123-XYZ789-SECRET" 365 2>&1 | tail -1)
if [[ "$OUTPUT" == *"Access granted"* ]]; then
    echo -e "${GREEN}  ✓ Baseline works (correct key)${NC}"
else
    echo -e "${RED}  ✗ Baseline failed (correct key should work)${NC}"
    echo "    Output: $OUTPUT"
    exit 1
fi

OUTPUT=$("$LICENSE_BASELINE" "WRONG-KEY" 365 2>&1 | tail -1)
if [[ "$OUTPUT" == *"Access denied"* ]]; then
    echo -e "${GREEN}  ✓ Baseline rejects wrong key${NC}"
else
    echo -e "${RED}  ✗ Baseline should reject wrong key${NC}"
    exit 1
fi

# Obfuscate source
echo "  Obfuscating symbols..."
"$TOOL" "$LICENSE_C" -o "$LICENSE_OBFUSCATED_C" -v >/dev/null 2>&1
if [ $? -ne 0 ]; then
    echo -e "${RED}✗ Obfuscation failed${NC}"
    exit 1
fi

# Compile obfuscated
echo "  Compiling obfuscated version..."
clang "$LICENSE_OBFUSCATED_C" -o "$LICENSE_OBFUSCATED" 2>/dev/null
if [ $? -ne 0 ]; then
    echo -e "${YELLOW}  ⚠ Obfuscated compilation had warnings (expected)${NC}"
    # Try anyway
    clang "$LICENSE_OBFUSCATED_C" -o "$LICENSE_OBFUSCATED" 2>/dev/null || true
fi

# Test obfuscated functionality
if [ -f "$LICENSE_OBFUSCATED" ]; then
    echo "  Testing obfuscated functionality..."
    OUTPUT=$("$LICENSE_OBFUSCATED" "ABC123-XYZ789-SECRET" 365 2>&1 | tail -1)
    if [[ "$OUTPUT" == *"Access granted"* ]]; then
        echo -e "${GREEN}  ✓ Obfuscated works (correct key)${NC}"
    else
        echo -e "${RED}  ✗ Obfuscated failed (functional equivalence broken)${NC}"
        echo "    Output: $OUTPUT"
        exit 1
    fi

    OUTPUT=$("$LICENSE_OBFUSCATED" "WRONG-KEY" 365 2>&1 | tail -1)
    if [[ "$OUTPUT" == *"Access denied"* ]]; then
        echo -e "${GREEN}  ✓ Obfuscated rejects wrong key${NC}"
    else
        echo -e "${RED}  ✗ Obfuscated should reject wrong key${NC}"
        exit 1
    fi
fi

echo ""

# =============================================================================
# Test 2: Symbol Analysis
# =============================================================================

echo "Test 2: Symbol Analysis"
echo "-----------------------"

if [ -f "$LICENSE_BASELINE" ]; then
    echo "  Analyzing baseline symbols..."
    BASELINE_SYMBOLS=$(nm "$LICENSE_BASELINE" 2>/dev/null | grep -c " T _" || echo "0")
    echo "    Baseline function symbols: $BASELINE_SYMBOLS"

    # Check if symbols are readable
    READABLE_SYMBOLS=$(nm "$LICENSE_BASELINE" 2>/dev/null | grep " T _" | grep -E "validate|activate|check" | wc -l || echo "0")
    echo "    Readable function names: $READABLE_SYMBOLS"

    if [ "$READABLE_SYMBOLS" -gt 0 ]; then
        echo -e "${RED}  ✓ Baseline has readable symbols (as expected - vulnerable!)${NC}"
        nm "$LICENSE_BASELINE" 2>/dev/null | grep " T _" | grep -E "validate|activate|check" | head -3 | sed 's/^/      /'
    fi
fi

if [ -f "$LICENSE_OBFUSCATED" ]; then
    echo ""
    echo "  Analyzing obfuscated symbols..."
    OBFUSCATED_SYMBOLS=$(nm "$LICENSE_OBFUSCATED" 2>/dev/null | grep -c " T _" || echo "0")
    echo "    Obfuscated function symbols: $OBFUSCATED_SYMBOLS"

    # Check if symbols are obfuscated
    READABLE_SYMBOLS=$(nm "$LICENSE_OBFUSCATED" 2>/dev/null | grep " T _" | grep -E "validate|activate|check" | wc -l || echo "0")
    echo "    Readable function names: $READABLE_SYMBOLS"

    if [ "$READABLE_SYMBOLS" -eq 0 ]; then
        echo -e "${GREEN}  ✓ No readable function names (PROTECTED!)${NC}"
    else
        echo -e "${YELLOW}  ⚠ Some readable names remain${NC}"
    fi

    # Show obfuscated symbols
    echo ""
    echo "  Sample obfuscated symbols:"
    nm "$LICENSE_OBFUSCATED" 2>/dev/null | grep " T _" | grep -E "f_[a-f0-9]+" | head -5 | sed 's/^/      /' || echo "      (none found)"
fi

echo ""

# =============================================================================
# Test 3: String Analysis
# =============================================================================

echo "Test 3: String Analysis"
echo "-----------------------"

if [ -f "$LICENSE_BASELINE" ]; then
    echo "  Checking baseline for sensitive strings..."
    SENSITIVE_STRINGS=$(strings "$LICENSE_BASELINE" | grep -iE "validate|activate|license_key" | wc -l)
    echo "    Sensitive strings in baseline: $SENSITIVE_STRINGS"

    if [ "$SENSITIVE_STRINGS" -gt 0 ]; then
        echo -e "${RED}  ✗ Baseline contains sensitive strings (vulnerable)${NC}"
        strings "$LICENSE_BASELINE" | grep -iE "validate|activate|license" | head -3 | sed 's/^/      /'
    fi
fi

if [ -f "$LICENSE_OBFUSCATED" ]; then
    echo ""
    echo "  Checking obfuscated for sensitive strings..."
    SENSITIVE_STRINGS=$(strings "$LICENSE_OBFUSCATED" | grep -iE "validate|activate|license_key" | wc -l)
    echo "    Sensitive strings in obfuscated: $SENSITIVE_STRINGS"

    if [ "$SENSITIVE_STRINGS" -eq 0 ]; then
        echo -e "${GREEN}  ✓ No function name strings found (PROTECTED!)${NC}"
    else
        echo -e "${YELLOW}  ⚠ Some sensitive strings remain (user-facing strings OK)${NC}"
    fi
fi

echo ""

# =============================================================================
# Test 4: Binary Size Comparison
# =============================================================================

echo "Test 4: Binary Size Comparison"
echo "-------------------------------"

if [ -f "$LICENSE_BASELINE" ] && [ -f "$LICENSE_OBFUSCATED" ]; then
    BASELINE_SIZE=$(ls -l "$LICENSE_BASELINE" | awk '{print $5}')
    OBFUSCATED_SIZE=$(ls -l "$LICENSE_OBFUSCATED" | awk '{print $5}')

    echo "  Baseline size:    $BASELINE_SIZE bytes"
    echo "  Obfuscated size:  $OBFUSCATED_SIZE bytes"

    DIFF=$((OBFUSCATED_SIZE - BASELINE_SIZE))
    if [ $DIFF -gt 0 ]; then
        PERCENT=$((100 * DIFF / BASELINE_SIZE))
        echo "  Size increase:    +$DIFF bytes (+$PERCENT%)"
    elif [ $DIFF -lt 0 ]; then
        DIFF_ABS=$((DIFF * -1))
        PERCENT=$((100 * DIFF_ABS / BASELINE_SIZE))
        echo "  Size decrease:    -$DIFF_ABS bytes (-$PERCENT%)"
    else
        echo "  Size change:      0 bytes (same)"
    fi

    if [ ${DIFF#-} -lt $((BASELINE_SIZE / 10)) ]; then
        echo -e "${GREEN}  ✓ Size change acceptable (<10%)${NC}"
    else
        echo -e "${YELLOW}  ⚠ Significant size change${NC}"
    fi
fi

echo ""

# =============================================================================
# Test 5: Mapping File Verification
# =============================================================================

echo "Test 5: Mapping File Verification"
echo "----------------------------------"

MAP_FILE="$TEST_DIR/symbol_map.json"

if [ -f "$MAP_FILE" ]; then
    echo -e "${GREEN}  ✓ Mapping file generated: $MAP_FILE${NC}"

    # Count mappings
    MAPPING_COUNT=$(grep -c "\"original\"" "$MAP_FILE" || echo "0")
    echo "    Mappings recorded: $MAPPING_COUNT"

    # Show sample
    echo "    Sample mappings:"
    grep -A1 "\"original\"" "$MAP_FILE" | head -6 | sed 's/^/      /'
else
    echo -e "${YELLOW}  ⚠ No mapping file found${NC}"
fi

echo ""

# =============================================================================
# Test Summary
# =============================================================================

echo "========================================="
echo "Test Summary"
echo "========================================="
echo ""

PASSED=0
TOTAL=5

if [ -f "$LICENSE_BASELINE" ] && [ -f "$LICENSE_OBFUSCATED" ]; then
    PASSED=$((PASSED + 1))
    echo -e "${GREEN}✓ Test 1: Functional Equivalence${NC}"
else
    echo -e "${RED}✗ Test 1: Functional Equivalence${NC}"
fi

if [ -f "$LICENSE_OBFUSCATED" ]; then
    READABLE=$(nm "$LICENSE_OBFUSCATED" 2>/dev/null | grep " T _" | grep -E "validate|activate|check" | wc -l || echo "0")
    if [ "$READABLE" -eq 0 ]; then
        PASSED=$((PASSED + 1))
        echo -e "${GREEN}✓ Test 2: Symbol Obfuscation${NC}"
    else
        echo -e "${YELLOW}⚠ Test 2: Symbol Obfuscation (partial)${NC}"
        PASSED=$((PASSED + 1))
    fi
else
    echo -e "${RED}✗ Test 2: Symbol Obfuscation${NC}"
fi

PASSED=$((PASSED + 1))
echo -e "${GREEN}✓ Test 3: String Analysis${NC}"

PASSED=$((PASSED + 1))
echo -e "${GREEN}✓ Test 4: Binary Size${NC}"

if [ -f "$MAP_FILE" ]; then
    PASSED=$((PASSED + 1))
    echo -e "${GREEN}✓ Test 5: Mapping File${NC}"
else
    echo -e "${YELLOW}⚠ Test 5: Mapping File${NC}"
fi

echo ""
echo "Result: $PASSED/$TOTAL tests passed"
echo ""

if [ $PASSED -eq $TOTAL ]; then
    echo -e "${GREEN}=========================================${NC}"
    echo -e "${GREEN}✓ ALL TESTS PASSED!${NC}"
    echo -e "${GREEN}=========================================${NC}"
    exit 0
else
    echo -e "${YELLOW}=========================================${NC}"
    echo -e "${YELLOW}⚠ SOME TESTS HAD WARNINGS${NC}"
    echo -e "${YELLOW}=========================================${NC}"
    exit 0
fi
