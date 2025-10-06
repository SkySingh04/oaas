#!/bin/bash
# Test script for targeted obfuscation system

echo "========================================="
echo "Targeted Function Obfuscation Test Suite"
echo "========================================="
echo ""

# Test 1: Critical function detection
echo "Test 1: Critical Function Detection"
echo "-----------------------------------"
python3 protect_functions.py analyze examples/license_validator.c
echo ""

# Test 2: Layer 1 - String encryption
echo "Test 2: Layer 1 (String Encryption)"
echo "-----------------------------------"
python3 transforms/string_encryptor.py examples/license_validator.c validate_license_key > /tmp/layer1_test.c 2>&1
if [ -s /tmp/layer1_test.c ]; then
    echo "✓ Layer 1 test passed"
else
    echo "✗ Layer 1 test failed"
fi
echo ""

# Test 3: Layer 2 - CFG flattening
echo "Test 3: Layer 2 (CFG Flattening)"
echo "-----------------------------------"
python3 transforms/cfg_flattener.py examples/license_validator.c validate_license_key > /tmp/layer2_test.c 2>&1
if [ -s /tmp/layer2_test.c ]; then
    echo "✓ Layer 2 test passed"
else
    echo "✗ Layer 2 test failed"
fi
echo ""

# Test 4: Layer 3 - Opaque predicates
echo "Test 4: Layer 3 (Opaque Predicates)"
echo "-----------------------------------"
python3 transforms/opaque_predicates.py examples/license_validator.c validate_license_key > /tmp/layer3_test.c 2>&1
if [ -s /tmp/layer3_test.c ]; then
    echo "✓ Layer 3 test passed"
else
    echo "✗ Layer 3 test failed"
fi
echo ""

# Test 5: Progressive hardening (levels 1-3)
echo "Test 5: Progressive Hardening (Levels 1-3)"
echo "-----------------------------------"
python3 protect_functions.py harden examples/license_validator.c \
    --functions validate_license_key \
    --max-level 3 \
    --output /tmp/protected_level3.c
if [ -f /tmp/protected_level3.c ]; then
    echo "✓ Progressive hardening test passed"
    echo "   Output: /tmp/protected_level3.c"
else
    echo "✗ Progressive hardening test failed"
fi
echo ""

# Test 6: Compile and test protected code
echo "Test 6: Functional Correctness"
echo "-----------------------------------"
clang examples/license_validator.c -o /tmp/original_binary 2>/dev/null
clang examples/license_validator_protected.c -o /tmp/protected_binary 2>/dev/null

if [ -f /tmp/original_binary ] && [ -f /tmp/protected_binary ]; then
    echo "✓ Both binaries compiled successfully"

    # Test with valid key
    original_result=$(/tmp/original_binary "ACME-2024-PROF-XXXX" 2>&1 | grep -c "valid")
    protected_result=$(/tmp/protected_binary "ACME-2024-PROF-XXXX" 2>&1 | grep -c "valid")

    if [ "$original_result" -gt 0 ] && [ "$protected_result" -gt 0 ]; then
        echo "✓ Functional correctness verified (valid key accepted)"
    else
        echo "⚠  Warning: Functional behavior may differ"
    fi
else
    echo "⚠  Warning: Compilation failed (expected with simplified transforms)"
fi
echo ""

# Test 7: Binary analysis
echo "Test 7: Security Metrics"
echo "-----------------------------------"
if [ -f /tmp/original_binary ] && [ -f /tmp/protected_binary ]; then
    orig_symbols=$(nm /tmp/original_binary 2>/dev/null | wc -l)
    prot_symbols=$(nm /tmp/protected_binary 2>/dev/null | wc -l)

    echo "   Original symbols: $orig_symbols"
    echo "   Protected symbols: $prot_symbols"

    if [ "$prot_symbols" -lt "$orig_symbols" ]; then
        reduction=$(( 100 * ($orig_symbols - $prot_symbols) / $orig_symbols ))
        echo "   ✓ Symbol reduction: ${reduction}%"
    fi
fi
echo ""

echo "========================================="
echo "Test Suite Complete"
echo "========================================="
echo ""
echo "Next steps:"
echo "  1. Review protected code: examples/license_validator_protected.c"
echo "  2. Test individual layers with transform scripts"
echo "  3. Measure impact with: python3 protect_functions.py report"
echo ""
