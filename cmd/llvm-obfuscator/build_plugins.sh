#!/bin/bash

# Build OLLVM Plugins for All Platforms
# This script builds the LLVMObfuscationPlugin for multiple platforms
# Date: 2025-10-11

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLVM_SOURCE_DIR="/Users/akashsingh/Desktop/llvm-project"
PLUGINS_DIR="$SCRIPT_DIR/plugins"

echo "======================================"
echo "OLLVM Plugin Build Script"
echo "======================================"
echo ""
echo "Source:  $LLVM_SOURCE_DIR"
echo "Plugins: $PLUGINS_DIR"
echo ""

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check if LLVM source exists
if [ ! -d "$LLVM_SOURCE_DIR" ]; then
    echo -e "${RED}Error: LLVM source not found at $LLVM_SOURCE_DIR${NC}"
    exit 1
fi

# Create plugins directories
mkdir -p "$PLUGINS_DIR/darwin-arm64"
mkdir -p "$PLUGINS_DIR/darwin-x86_64"
mkdir -p "$PLUGINS_DIR/linux-x86_64"
mkdir -p "$PLUGINS_DIR/windows-x86_64"

# ==========================================
# Function: Build Plugin
# ==========================================
build_plugin() {
    local platform=$1
    local arch=$2
    local build_dir=$3
    local cmake_args=$4

    echo ""
    echo "======================================"
    echo "Building for: $platform-$arch"
    echo "======================================"

    # Create build directory
    mkdir -p "$build_dir"
    cd "$build_dir"

    echo "Running CMake..."
    cmake -G Ninja "$LLVM_SOURCE_DIR/llvm" \
        -DLLVM_ENABLE_PROJECTS="clang" \
        -DCMAKE_BUILD_TYPE=Release \
        -DLLVM_TARGETS_TO_BUILD="X86;AArch64" \
        -DLLVM_ENABLE_ASSERTIONS=OFF \
        -DCMAKE_INSTALL_PREFIX="$build_dir/install" \
        $cmake_args

    echo "Building plugin..."
    ninja LLVMObfuscationPlugin

    # Copy plugin to plugins directory
    if [ -f "lib/LLVMObfuscationPlugin.dylib" ]; then
        cp lib/LLVMObfuscationPlugin.dylib "$PLUGINS_DIR/$platform-$arch/"
        echo -e "${GREEN}✅ Plugin built: $platform-$arch${NC}"
    elif [ -f "lib/LLVMObfuscationPlugin.so" ]; then
        cp lib/LLVMObfuscationPlugin.so "$PLUGINS_DIR/$platform-$arch/"
        echo -e "${GREEN}✅ Plugin built: $platform-$arch${NC}"
    elif [ -f "lib/LLVMObfuscationPlugin.dll" ]; then
        cp lib/LLVMObfuscationPlugin.dll "$PLUGINS_DIR/$platform-$arch/"
        echo -e "${GREEN}✅ Plugin built: $platform-$arch${NC}"
    else
        echo -e "${RED}❌ Plugin not found after build${NC}"
        return 1
    fi
}

# ==========================================
# Build for Current Platform
# ==========================================
CURRENT_OS=$(uname -s)
CURRENT_ARCH=$(uname -m)

echo "Detected: $CURRENT_OS $CURRENT_ARCH"

if [ "$CURRENT_OS" = "Darwin" ]; then
    if [ "$CURRENT_ARCH" = "arm64" ]; then
        echo ""
        echo "======================================"
        echo "Option 1: Build for Current Platform (macOS arm64)"
        echo "======================================"
        echo ""
        echo "This will use the existing build."
        echo ""

        if [ -f "/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib" ]; then
            echo "Copying existing plugin..."
            cp /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
               "$PLUGINS_DIR/darwin-arm64/"
            echo -e "${GREEN}✅ macOS arm64 plugin copied${NC}"
        else
            echo -e "${YELLOW}⚠️  Existing plugin not found, building from scratch...${NC}"
            build_plugin "darwin" "arm64" \
                "/Users/akashsingh/Desktop/llvm-project/build-arm64" \
                "-DCMAKE_OSX_ARCHITECTURES=arm64"
        fi

        # Offer to build for Intel Mac
        echo ""
        echo "======================================"
        echo "Option 2: Cross-compile for macOS x86_64"
        echo "======================================"
        echo ""
        read -p "Build for Intel Mac? (y/n) " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            build_plugin "darwin" "x86_64" \
                "/Users/akashsingh/Desktop/llvm-project/build-x86_64" \
                "-DCMAKE_OSX_ARCHITECTURES=x86_64"
        else
            echo -e "${YELLOW}⏭️  Skipping macOS x86_64${NC}"
        fi
    fi
fi

# ==========================================
# Linux Build (via Docker)
# ==========================================
echo ""
echo "======================================"
echo "Option 3: Build for Linux x86_64 (Docker)"
echo "======================================"
echo ""

if command -v docker &> /dev/null; then
    read -p "Build for Linux using Docker? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "Building Linux plugin in Docker..."

        # Create Dockerfile for build
        cat > /tmp/Dockerfile.llvm-plugin <<'EOF'
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    ninja-build \
    git \
    python3 \
    python3-pip \
    clang \
    lld \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build
EOF

        # Build Docker image
        docker build -t llvm-plugin-builder -f /tmp/Dockerfile.llvm-plugin /tmp

        # Build plugin in container
        docker run --rm \
            -v "$LLVM_SOURCE_DIR:/src:ro" \
            -v "$PLUGINS_DIR:/output" \
            llvm-plugin-builder \
            bash -c "
                mkdir -p /build/linux-x86_64
                cd /build/linux-x86_64
                cmake -G Ninja /src/llvm \
                    -DLLVM_ENABLE_PROJECTS='clang' \
                    -DCMAKE_BUILD_TYPE=Release \
                    -DLLVM_TARGETS_TO_BUILD='X86' \
                    -DLLVM_ENABLE_ASSERTIONS=OFF
                ninja LLVMObfuscationPlugin
                cp lib/LLVMObfuscationPlugin.so /output/linux-x86_64/
            "

        if [ -f "$PLUGINS_DIR/linux-x86_64/LLVMObfuscationPlugin.so" ]; then
            echo -e "${GREEN}✅ Linux x86_64 plugin built${NC}"
        else
            echo -e "${RED}❌ Linux build failed${NC}"
        fi
    else
        echo -e "${YELLOW}⏭️  Skipping Linux build${NC}"
    fi
else
    echo -e "${YELLOW}⚠️  Docker not found. Skipping Linux build.${NC}"
    echo "To build for Linux, install Docker or build on a Linux machine."
fi

# ==========================================
# Windows Build (Skip for now)
# ==========================================
echo ""
echo "======================================"
echo "Option 4: Windows x86_64"
echo "======================================"
echo ""
echo -e "${YELLOW}⏭️  Windows build requires Visual Studio on Windows or cross-compilation setup.${NC}"
echo "To build for Windows:"
echo "  1. On Windows with VS 2022:"
echo "     cmake -G \"Visual Studio 17 2022\" -A x64 llvm"
echo "     cmake --build . --config Release --target LLVMObfuscationPlugin"
echo "  2. Or use MinGW cross-compilation"
echo ""

# ==========================================
# Summary
# ==========================================
echo ""
echo "======================================"
echo "Build Summary"
echo "======================================"
echo ""

check_plugin() {
    local path=$1
    if [ -f "$path" ]; then
        local size=$(du -h "$path" | cut -f1)
        echo -e "${GREEN}✅${NC} $path ($size)"
        return 0
    else
        echo -e "${RED}❌${NC} $path (not found)"
        return 1
    fi
}

BUILT_COUNT=0
TOTAL=4

check_plugin "$PLUGINS_DIR/darwin-arm64/LLVMObfuscationPlugin.dylib" && BUILT_COUNT=$((BUILT_COUNT + 1))
check_plugin "$PLUGINS_DIR/darwin-x86_64/LLVMObfuscationPlugin.dylib" && BUILT_COUNT=$((BUILT_COUNT + 1))
check_plugin "$PLUGINS_DIR/linux-x86_64/LLVMObfuscationPlugin.so" && BUILT_COUNT=$((BUILT_COUNT + 1))
check_plugin "$PLUGINS_DIR/windows-x86_64/LLVMObfuscationPlugin.dll" && BUILT_COUNT=$((BUILT_COUNT + 1))

echo ""
echo "Plugins built: $BUILT_COUNT / $TOTAL"
echo ""

if [ $BUILT_COUNT -ge 2 ]; then
    echo -e "${GREEN}✅ Ready for multi-platform distribution!${NC}"
elif [ $BUILT_COUNT -eq 1 ]; then
    echo -e "${YELLOW}⚠️  Only one platform built. Consider building for more platforms.${NC}"
else
    echo -e "${RED}❌ No plugins built successfully.${NC}"
    exit 1
fi

echo ""
echo "Next steps:"
echo "  1. Review plugins in: $PLUGINS_DIR"
echo "  2. Run: ./package.sh to create distribution package"
echo "  3. Test with: python3 -m cli.obfuscate compile --enable-flattening test.c"
echo ""
