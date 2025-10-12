#!/bin/bash
# Build LinearMBA as standalone plugin

set -e

LLVM_BUILD=/Users/akashsingh/Desktop/llvm-project/build
LLVM_SRC=/Users/akashsingh/Desktop/llvm-project/llvm
MBA_SRC=/Users/akashsingh/Desktop/llvm-project/llvm/lib/Transforms/Obfuscation/LinearMBA.cpp

echo "Building LinearMBA standalone plugin..."

# Use clang++ from the build
$LLVM_BUILD/bin/clang++ -shared -fPIC \
  -I$LLVM_BUILD/include \
  -I$LLVM_SRC/include \
  $MBA_SRC \
  -o LinearMBAPlugin.dylib \
  -std=c++17 \
  -O2

echo "✅ Plugin built successfully: LinearMBAPlugin.dylib"
ls -lh LinearMBAPlugin.dylib
