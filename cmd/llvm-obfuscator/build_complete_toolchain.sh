#!/bin/bash

# Build Complete OLLVM Toolchain (opt + plugin)
# This bundles BOTH the custom opt binary AND the plugin
# Date: 2025-10-11

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLVM_BUILD_DIR="/Users/akashsingh/Desktop/llvm-project/build"
PLUGINS_DIR="$SCRIPT_DIR/plugins"

echo "======================================"
echo "OLLVM Complete Toolchain Builder"
echo "======================================"
echo ""
echo "This script bundles BOTH:"
echo "  1. Custom 'opt' binary (with OLLVM passes)"
echo "  2. OLLVM plugin (.dylib/.so)"
echo ""
echo "Why both? Stock LLVM doesn't have our custom passes!"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

# Check LLVM build exists
if [ ! -d "$LLVM_BUILD_DIR" ]; then
    echo -e "${RED}Error: LLVM build not found at $LLVM_BUILD_DIR${NC}"
    echo "Build LLVM first: cd llvm-project && mkdir build && cd build && cmake -G Ninja ../llvm && ninja"
    exit 1
fi

# Create directories
mkdir -p "$PLUGINS_DIR/darwin-arm64"
mkdir -p "$PLUGINS_DIR/darwin-x86_64"
mkdir -p "$PLUGINS_DIR/linux-x86_64"

# ==========================================
# macOS arm64 (Current System)
# ==========================================
echo ""
echo "======================================"
echo "Building for: darwin-arm64"
echo "======================================"

if [ -f "$LLVM_BUILD_DIR/lib/LLVMObfuscationPlugin.dylib" ]; then
    echo "Copying plugin..."
    cp "$LLVM_BUILD_DIR/lib/LLVMObfuscationPlugin.dylib" \
       "$PLUGINS_DIR/darwin-arm64/"

    PLUGIN_SIZE=$(du -h "$PLUGINS_DIR/darwin-arm64/LLVMObfuscationPlugin.dylib" | cut -f1)
    echo -e "${GREEN}✅ Plugin: $PLUGIN_SIZE${NC}"
else
    echo -e "${RED}❌ Plugin not found${NC}"
    exit 1
fi

if [ -f "$LLVM_BUILD_DIR/bin/opt" ]; then
    echo "Copying opt binary..."
    cp "$LLVM_BUILD_DIR/bin/opt" \
       "$PLUGINS_DIR/darwin-arm64/"

    # Note: Don't strip - it breaks plugin loading!
    # strip "$PLUGINS_DIR/darwin-arm64/opt"

    OPT_SIZE=$(du -h "$PLUGINS_DIR/darwin-arm64/opt" | cut -f1)
    echo -e "${GREEN}✅ opt binary: $OPT_SIZE (includes debug symbols for plugin compatibility)${NC}"
else
    echo -e "${RED}❌ opt binary not found${NC}"
    exit 1
fi

# Test that plugin works with opt
echo "Testing compatibility..."
if "$PLUGINS_DIR/darwin-arm64/opt" \
   -load-pass-plugin="$PLUGINS_DIR/darwin-arm64/LLVMObfuscationPlugin.dylib" \
   --help 2>&1 | grep -q "flattening"; then
    echo -e "${GREEN}✅ Plugin loads successfully with bundled opt${NC}"
else
    echo -e "${RED}❌ Plugin doesn't work with bundled opt${NC}"
    exit 1
fi

# ==========================================
# Size Analysis
# ==========================================
echo ""
echo "======================================"
echo "Size Analysis"
echo "======================================"

TOTAL_SIZE=$(du -sh "$PLUGINS_DIR/darwin-arm64" | cut -f1)
echo "darwin-arm64 toolchain: $TOTAL_SIZE"
echo ""
echo "Breakdown:"
ls -lh "$PLUGINS_DIR/darwin-arm64/"

# ==========================================
# Usage Instructions
# ==========================================
echo ""
echo "======================================"
echo "Usage"
echo "======================================"
echo ""
echo "The obfuscator will now automatically use:"
echo "  1. Bundled opt binary"
echo "  2. Bundled plugin"
echo ""
echo "No system LLVM installation required!"
echo ""
echo "Package size impact:"
echo "  - Before: ~1 MB"
echo "  - After: ~$TOTAL_SIZE"
echo ""
echo "This ensures Layer 2 works out-of-the-box."
echo ""

# ==========================================
# Update Code to Use Bundled opt
# ==========================================
echo "Next step: Update obfuscator.py to use bundled opt"
echo ""
echo "Change needed in core/obfuscator.py:"
echo "  Instead of searching system paths,"
echo "  look in plugins/<platform>/ directory first"
echo ""
