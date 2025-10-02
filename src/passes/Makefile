# Simple Makefile for building LLVM passes

CXX = clang++
LLVM_CONFIG = llvm-config

# Get LLVM compilation flags
CXXFLAGS = -fPIC $(shell $(LLVM_CONFIG) --cxxflags)
LDFLAGS = $(shell $(LLVM_CONFIG) --ldflags --system-libs --libs core)

# Platform detection
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
    # macOS
    SHARED_FLAG = -dynamiclib
    SO_EXT = dylib
else
    # Linux
    SHARED_FLAG = -shared
    SO_EXT = so
endif

TARGET = SimpleObfuscator.$(SO_EXT)

all: $(TARGET)

$(TARGET): SimpleObfuscator.cpp
	$(CXX) $(SHARED_FLAG) $(CXXFLAGS) $< -o $@ $(LDFLAGS)

clean:
	rm -f $(TARGET) SimpleObfuscator.so SimpleObfuscator.dylib

test: $(TARGET)
	@echo "Building test IR..."
	clang -S -emit-llvm ../../src/factorial_recursive.c -o test.ll
	@echo "Applying obfuscation pass..."
	opt -load ./$(TARGET) -simple-obfuscator -S test.ll -o test_obf.ll
	@echo "Compiling obfuscated IR..."
	clang test_obf.ll -o test_obf
	@echo "Testing binary..."
	./test_obf 5

.PHONY: all clean test
