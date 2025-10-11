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

# Locate tooling for stripping and verification
LLVM_BINDIR := $(shell $(LLVM_CONFIG) --bindir 2>/dev/null)
LLVM_OBJCOPY := $(LLVM_BINDIR)/llvm-objcopy
LLVM_STRIP := $(LLVM_BINDIR)/llvm-strip
LLVM_READOBJ := $(LLVM_BINDIR)/llvm-readobj

STRIP_CMD := $(shell \
    if [ -x "$(LLVM_OBJCOPY)" ]; then \
        echo "$(LLVM_OBJCOPY) --strip-debug"; \
    elif [ -x "$(LLVM_STRIP)" ]; then \
        echo "$(LLVM_STRIP) --strip-debug"; \
    elif command -v strip >/dev/null 2>&1; then \
        if [ "$(UNAME_S)" = "Darwin" ]; then \
            echo "strip -S"; \
        else \
            echo "strip --strip-debug"; \
        fi; \
    fi)

READOBJ_CMD := $(shell \
    if [ -x "$(LLVM_READOBJ)" ]; then \
        echo "$(LLVM_READOBJ)"; \
    elif command -v llvm-readelf >/dev/null 2>&1; then \
        echo "`command -v llvm-readelf`"; \
    elif command -v readelf >/dev/null 2>&1; then \
        echo "`command -v readelf`"; \
    fi)

all: $(TARGET)

$(TARGET): SimpleObfuscator.cpp
	$(CXX) $(SHARED_FLAG) $(CXXFLAGS) $< -o $@ $(LDFLAGS)
	@if [ -n "$(STRIP_CMD)" ]; then \
		echo "Stripping debug symbols from $@"; \
		$(STRIP_CMD) $@; \
	else \
		echo "Warning: no strip tool available; $@ may contain debug symbols"; \
	fi
	@if [ -n "$(READOBJ_CMD)" ]; then \
		if $(READOBJ_CMD) --sections $@ | grep -q '\.debug'; then \
			echo "Error: debug sections detected in $@"; \
			exit 1; \
		fi; \
	else \
		echo "Warning: unable to verify debug sections for $@"; \
	fi

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
