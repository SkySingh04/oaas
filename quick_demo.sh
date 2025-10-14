#!/bin/bash
# Quick CLI Demo for Video Recording
# Usage: ./quick_demo.sh

clear
echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║        LLVM Obfuscator CLI - Quick Demo                           ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
echo ""

cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator

# Show the source code first
echo "📄 Original C source code (demo_auth_200.c):"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
head -30 ../../src/demo_auth_200.c
echo "... (truncated)"
echo ""
echo "Press Enter to start obfuscation..."
read

# Run obfuscation
echo ""
echo "🔒 Running obfuscation with ALL 4 layers..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./quick_demo_output \
  --platform macos \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
  --report-formats json,html \
  2>&1 | grep -E "INFO|✓|symbols renamed|strings encrypted|Step|complete"

echo ""
echo "✅ Obfuscation complete!"
echo ""
echo "Press Enter to test the binary..."
read

# Test the binary
echo ""
echo "🧪 Testing obfuscated binary:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
./quick_demo_output/demo_auth_200 admin "Admin@SecurePass2024!"
echo ""

echo "Press Enter to check obfuscation results..."
read

# Show obfuscation results
echo ""
echo "📊 Obfuscation Results:"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "1️⃣  Checking for hardcoded secrets:"
echo "   $ strings quick_demo_output/demo_auth_200 | grep -i 'password\|admin\|secret'"
strings quick_demo_output/demo_auth_200 | grep -iE 'password|Admin@|secret|sk_live' || echo "   ✓ No secrets found! (encrypted)"
echo ""

echo "2️⃣  Checking function names:"
echo "   $ nm quick_demo_output/demo_auth_200 | grep ' T '"
nm quick_demo_output/demo_auth_200 2>/dev/null | grep ' T ' | head -5
echo "   ... (all obfuscated)"
echo ""

echo "3️⃣  Binary size comparison:"
echo "   Original:    $(stat -f%z /Users/akashsingh/Desktop/llvm/bin/demos/demo_auth_200_macos 2>/dev/null || echo 'N/A') bytes"
echo "   Obfuscated:  $(stat -f%z quick_demo_output/demo_auth_200) bytes"
echo ""

echo "4️⃣  Symbol count:"
echo "   Original:    $(nm -g /Users/akashsingh/Desktop/llvm/bin/demos/demo_auth_200_macos 2>/dev/null | grep -v ' U ' | wc -l | tr -d ' ') symbols"
echo "   Obfuscated:  $(nm -g quick_demo_output/demo_auth_200 2>/dev/null | grep -v ' U ' | wc -l | tr -d ' ') symbols"
echo ""

echo "📈 Open HTML report:"
echo "   open quick_demo_output/demo_auth_200.html"
echo ""

echo "╔════════════════════════════════════════════════════════════════════╗"
echo "║                    Demo Complete! ✨                               ║"
echo "╚════════════════════════════════════════════════════════════════════╝"
