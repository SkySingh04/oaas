#!/bin/bash
# LLVM Obfuscator CLI Demo Script
# Run from: /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator

set -e

echo "=========================================="
echo "LLVM Obfuscator CLI Demo"
echo "=========================================="
echo ""

# Change to CLI directory
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator

# Demo 1: Simple C obfuscation (macOS native, with OLLVM)
echo "Demo 1: Obfuscating C authentication demo (macOS native + All layers)"
echo "----------------------------------------------------------------------"
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_output/demo1 \
  --platform macos \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
  --report-formats json,html

echo ""
echo "✓ Binary created: ./demo_output/demo1/demo_auth_200"
echo "✓ Report: ./demo_output/demo1/demo_auth_200.html"
echo ""

# Demo 2: C++ obfuscation (without OLLVM due to exception handling)
echo "Demo 2: Obfuscating C++ license checker (String encryption + Symbol obfuscation)"
echo "---------------------------------------------------------------------------------"
python3 -m cli.obfuscate compile \
  ../../src/license_checker.cpp \
  --output ./demo_output/demo2 \
  --platform macos \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
  --report-formats json,html

echo ""
echo "✓ Binary created: ./demo_output/demo2/license_checker"
echo "✓ Report: ./demo_output/demo2/license_checker.html"
echo ""

# Demo 3: Simple obfuscation (no OLLVM)
echo "Demo 3: Quick obfuscation (String + Symbol only)"
echo "-------------------------------------------------"
python3 -m cli.obfuscate compile \
  ../../src/factorial_recursive.c \
  --output ./demo_output/demo3 \
  --platform macos \
  --level 3 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats json

echo ""
echo "✓ Binary created: ./demo_output/demo3/factorial_recursive"
echo ""

# Demo 4: Test the binaries
echo "Demo 4: Testing obfuscated binaries"
echo "------------------------------------"
echo ""
echo "Testing demo1 (authentication):"
./demo_output/demo1/demo_auth_200 admin "Admin@SecurePass2024!" || echo "[Expected: May fail due to different password]"
echo ""

echo "Testing demo3 (factorial):"
./demo_output/demo3/factorial_recursive 5
echo ""

# Demo 5: Analyze the binary
echo "Demo 5: Analyzing obfuscated binary"
echo "------------------------------------"
python3 -m cli.obfuscate analyze ./demo_output/demo1/demo_auth_200

echo ""
echo "Demo 6: Compare original vs obfuscated"
echo "---------------------------------------"
echo "Comparing symbol count..."
echo "Original:"
nm -g /Users/akashsingh/Desktop/llvm/bin/demos/demo_auth_200_macos 2>/dev/null | grep -v ' U ' | wc -l || echo "0"
echo "Obfuscated:"
nm -g ./demo_output/demo1/demo_auth_200 2>/dev/null | grep -v ' U ' | wc -l || echo "0"

echo ""
echo "=========================================="
echo "Demo Complete!"
echo "=========================================="
echo ""
echo "Output files:"
echo "  - ./demo_output/demo1/demo_auth_200"
echo "  - ./demo_output/demo1/demo_auth_200.html (open in browser)"
echo "  - ./demo_output/demo2/license_checker"
echo "  - ./demo_output/demo3/factorial_recursive"
echo ""
