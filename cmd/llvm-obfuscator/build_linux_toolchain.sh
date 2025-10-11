#!/bin/bash

# Build OLLVM Toolchain for Linux x86_64 (via Docker)
# Date: 2025-10-11

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LLVM_SOURCE="/Users/akashsingh/Desktop/llvm-project"
OUTPUT_DIR="$SCRIPT_DIR/plugins/linux-x86_64"

# Colors
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo "======================================"
echo "OLLVM Linux x86_64 Toolchain Builder"
echo "======================================"
echo ""

# Check Docker
if ! command -v docker &> /dev/null; then
    echo -e "${RED}Error: Docker not found${NC}"
    echo "Install Docker: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check LLVM source
if [ ! -d "$LLVM_SOURCE" ]; then
    echo -e "${RED}Error: LLVM source not found at $LLVM_SOURCE${NC}"
    exit 1
fi

echo "Building Linux x86_64 toolchain using Docker..."
echo "This will take 15-30 minutes (full LLVM build)"
echo ""

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Create Dockerfile
cat > /tmp/Dockerfile.llvm-builder <<'EOF'
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install build tools
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

echo "Building Docker image..."
docker build -t llvm-linux-builder -f /tmp/Dockerfile.llvm-builder /tmp

echo ""
echo "Building LLVM with obfuscation passes..."
echo "Source: $LLVM_SOURCE"
echo "Output: $OUTPUT_DIR"
echo ""

# Build in Docker
docker run --rm \
    -v "$LLVM_SOURCE:/src:ro" \
    -v "$OUTPUT_DIR:/output" \
    llvm-linux-builder \
    bash -c "
        set -e
        echo '=== Configuring LLVM ==='
        cd /build
        cmake -G Ninja /src/llvm \
            -DLLVM_ENABLE_PROJECTS='clang' \
            -DCMAKE_BUILD_TYPE=Release \
            -DLLVM_TARGETS_TO_BUILD='X86' \
            -DLLVM_ENABLE_ASSERTIONS=OFF \
            -DCMAKE_C_COMPILER=clang \
            -DCMAKE_CXX_COMPILER=clang++ \
            -DLLVM_USE_LINKER=lld

        echo ''
        echo '=== Building LLVM (this takes 15-30 minutes) ==='
        ninja opt clang LLVMObfuscationPlugin

        echo ''
        echo '=== Testing plugin compatibility ==='
        if ./bin/opt -load-pass-plugin=./lib/LLVMObfuscationPlugin.so --help 2>&1 | grep -q 'flattening'; then
            echo 'Plugin works with opt!'
        else
            echo 'ERROR: Plugin does not work with opt'
            exit 1
        fi

        echo ''
        echo '=== Copying binaries to output ==='
        cp bin/opt /output/
        cp bin/clang /output/
        cp lib/LLVMObfuscationPlugin.so /output/

        echo ''
        echo '=== Build complete ==='
        ls -lh /output/
    "

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}======================================"
    echo "Build Successful!"
    echo "======================================${NC}"
    echo ""

    # Show results
    if [ -f "$OUTPUT_DIR/opt" ] && [ -f "$OUTPUT_DIR/clang" ] && [ -f "$OUTPUT_DIR/LLVMObfuscationPlugin.so" ]; then
        OPT_SIZE=$(du -h "$OUTPUT_DIR/opt" | cut -f1)
        CLANG_SIZE=$(du -h "$OUTPUT_DIR/clang" | cut -f1)
        PLUGIN_SIZE=$(du -h "$OUTPUT_DIR/LLVMObfuscationPlugin.so" | cut -f1)

        echo "Built files:"
        echo "  ✅ opt: $OPT_SIZE"
        echo "  ✅ clang: $CLANG_SIZE"
        echo "  ✅ LLVMObfuscationPlugin.so: $PLUGIN_SIZE"
        echo ""
        echo "Location: $OUTPUT_DIR"
        echo ""
        echo "These files will be bundled in the Linux package."
    else
        echo -e "${RED}Error: Expected files not found${NC}"
        exit 1
    fi
else
    echo -e "${RED}Build failed${NC}"
    exit 1
fi
