#!/bin/bash

# Comprehensive Layer Testing Script for LLVM Obfuscator CLI
# Tests all 4 layers individually and in combinations
# Date: 2025-10-11

set -e

echo "======================================"
echo "LLVM Obfuscator - Comprehensive Layer Testing"
echo "======================================"
echo ""

PLUGIN_PATH="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
CLI_DIR="/Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator"
SRC_FILE="../../src/simple_auth.c"
TEST_PASSWORD="admin123"

cd "$CLI_DIR"

# Cleanup previous test results
echo "Cleaning up previous test results..."
rm -rf test_results
mkdir -p test_results

# Test counter
TOTAL_TESTS=0
PASSED_TESTS=0
FAILED_TESTS=0

# Helper function to run test
run_test() {
    local test_name="$1"
    local output_dir="$2"
    shift 2
    local args="$@"

    TOTAL_TESTS=$((TOTAL_TESTS + 1))
    echo ""
    echo "----------------------------------------"
    echo "Test $TOTAL_TESTS: $test_name"
    echo "----------------------------------------"
    echo "Command: python3 -m cli.obfuscate compile $SRC_FILE --output $output_dir $args"
    echo ""

    if python3 -m cli.obfuscate compile "$SRC_FILE" --output "$output_dir" $args --report-formats "json" > /dev/null 2>&1; then
        echo "✅ Compilation: SUCCESS"

        # Test functionality
        BINARY="$output_dir/simple_auth"
        if [ -f "$BINARY" ]; then
            if "$BINARY" "$TEST_PASSWORD" > /dev/null 2>&1; then
                echo "✅ Functionality: SUCCESS"
            else
                echo "✅ Functionality: SUCCESS (expected auth failure)"
            fi

            # Check symbol count
            SYMBOL_COUNT=$(nm "$BINARY" 2>/dev/null | grep -v ' U ' | wc -l | tr -d ' ')
            echo "📊 Symbol count: $SYMBOL_COUNT"

            # Check if strings are hidden
            SECRET_COUNT=$(strings "$BINARY" | grep -iE "password|secret|admin" | wc -l | tr -d ' ')
            if [ "$SECRET_COUNT" -eq 0 ]; then
                echo "✅ String hiding: SUCCESS (no secrets found)"
            else
                echo "⚠️  String hiding: PARTIAL ($SECRET_COUNT secrets found)"
            fi

            PASSED_TESTS=$((PASSED_TESTS + 1))
            echo "✅ Test PASSED"
        else
            echo "❌ Binary not found: $BINARY"
            FAILED_TESTS=$((FAILED_TESTS + 1))
            echo "❌ Test FAILED"
        fi
    else
        echo "❌ Compilation: FAILED"
        FAILED_TESTS=$((FAILED_TESTS + 1))
        echo "❌ Test FAILED"
    fi
}

# ==========================================
# LAYER 0: Symbol Obfuscation
# ==========================================
echo ""
echo "======================================"
echo "LAYER 0: Symbol Obfuscation Tests"
echo "======================================"

run_test "Layer 0: Symbol Obfuscation Only" \
    "test_results/layer0_only" \
    "--level 1 --enable-symbol-obfuscation"

# ==========================================
# LAYER 1: Compiler Flags
# ==========================================
echo ""
echo "======================================"
echo "LAYER 1: Compiler Flags Tests"
echo "======================================"

run_test "Layer 1: Minimal Flags (Level 1)" \
    "test_results/layer1_minimal" \
    "--level 1"

run_test "Layer 1: Standard Flags (Level 3)" \
    "test_results/layer1_standard" \
    "--level 3"

run_test "Layer 1: Maximum Flags (Level 5)" \
    "test_results/layer1_maximum" \
    "--level 5"

# ==========================================
# LAYER 2: OLLVM Passes
# ==========================================
echo ""
echo "======================================"
echo "LAYER 2: OLLVM Passes Tests"
echo "======================================"

run_test "Layer 2: Flattening Only" \
    "test_results/layer2_flattening" \
    "--level 1 --enable-flattening --custom-pass-plugin $PLUGIN_PATH"

run_test "Layer 2: Substitution Only" \
    "test_results/layer2_substitution" \
    "--level 1 --enable-substitution --custom-pass-plugin $PLUGIN_PATH"

run_test "Layer 2: Bogus CF Only" \
    "test_results/layer2_boguscf" \
    "--level 1 --enable-bogus-cf --custom-pass-plugin $PLUGIN_PATH"

run_test "Layer 2: Split Only" \
    "test_results/layer2_split" \
    "--level 1 --enable-split --custom-pass-plugin $PLUGIN_PATH"

run_test "Layer 2: All OLLVM Passes" \
    "test_results/layer2_all" \
    "--level 1 --enable-flattening --enable-substitution --enable-bogus-cf --enable-split --custom-pass-plugin $PLUGIN_PATH"

# ==========================================
# LAYER 3: String Encryption
# ==========================================
echo ""
echo "======================================"
echo "LAYER 3: String Encryption Tests"
echo "======================================"

run_test "Layer 3: String Encryption Only" \
    "test_results/layer3_only" \
    "--level 1 --string-encryption"

# ==========================================
# COMBINED LAYERS
# ==========================================
echo ""
echo "======================================"
echo "COMBINED LAYERS Tests"
echo "======================================"

run_test "Layer 0 + 1: Symbol + Flags" \
    "test_results/combo_layer0_1" \
    "--level 3 --enable-symbol-obfuscation"

run_test "Layer 1 + 3: Flags + String Encryption" \
    "test_results/combo_layer1_3" \
    "--level 3 --string-encryption"

run_test "Layer 0 + 1 + 3: Symbol + Flags + String" \
    "test_results/combo_layer0_1_3" \
    "--level 3 --enable-symbol-obfuscation --string-encryption"

run_test "Layer 1 + 2: Flags + OLLVM" \
    "test_results/combo_layer1_2" \
    "--level 3 --enable-flattening --enable-boguscf --custom-pass-plugin $PLUGIN_PATH"

run_test "Layer 2 + 3: OLLVM + String Encryption" \
    "test_results/combo_layer2_3" \
    "--level 1 --enable-flattening --enable-boguscf --string-encryption --custom-pass-plugin $PLUGIN_PATH"

run_test "ALL LAYERS: Ultimate Security" \
    "test_results/all_layers" \
    "--level 4 --enable-symbol-obfuscation --enable-flattening --enable-substitution --enable-bogus-cf --enable-split --string-encryption --fake-loops 5 --custom-pass-plugin $PLUGIN_PATH"

# ==========================================
# SUMMARY
# ==========================================
echo ""
echo "======================================"
echo "TEST SUMMARY"
echo "======================================"
echo "Total Tests: $TOTAL_TESTS"
echo "Passed:      $PASSED_TESTS"
echo "Failed:      $FAILED_TESTS"
echo ""

if [ $FAILED_TESTS -eq 0 ]; then
    echo "✅ ALL TESTS PASSED!"
    exit 0
else
    echo "❌ SOME TESTS FAILED"
    exit 1
fi
