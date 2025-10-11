# Linux Deployment - Critical Information

**Date:** 2025-10-11
**Status:** ⚠️ **REQUIRES LINUX BUILD**

---

## TL;DR - Will It Work on Linux VMs?

**Current status:** ❌ **NO - Need to build Linux binaries first**

**After building:** ✅ **YES - Will work on fresh Linux VMs**

---

## The Issue

### Current State:
```
plugins/
├── darwin-arm64/        ✅ Complete (macOS arm64 only)
│   ├── opt              Mach-O executable
│   └── LLVMObfuscationPlugin.dylib
├── linux-x86_64/        ❌ EMPTY (needs build)
```

### Why macOS binaries don't work on Linux:

**Binary formats are incompatible:**
- macOS: Mach-O format
- Linux: ELF format
- Windows: PE format

**You cannot run macOS binaries on Linux!**

```bash
# On Linux:
./plugins/darwin-arm64/opt
# bash: ./plugins/darwin-arm64/opt: cannot execute binary file: Exec format error
```

---

## Solution: Build for Each Platform

### 1. Build Linux Toolchain

**Using Docker (from macOS):**
```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
./build_linux_toolchain.sh
```

**What it does:**
1. Creates Ubuntu 22.04 Docker container
2. Installs build tools (cmake, ninja, clang)
3. Builds LLVM with obfuscation passes
4. Copies `opt` + `LLVMObfuscationPlugin.so` to `plugins/linux-x86_64/`
5. Takes 15-30 minutes

**Result:**
```
plugins/linux-x86_64/
├── opt                          # ~60 MB - ELF executable
└── LLVMObfuscationPlugin.so     # ~140 KB - Linux shared library
```

### 2. Build macOS Intel (Optional)

**On macOS with Xcode:**
```bash
cd /Users/akashsingh/Desktop/llvm-project
mkdir build-x86_64
cd build-x86_64

cmake -G Ninja ../llvm \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_OSX_ARCHITECTURES=x86_64 \
    -DLLVM_TARGETS_TO_BUILD="X86;AArch64"

ninja opt LLVMObfuscationPlugin

# Copy to plugins
cp bin/opt /path/to/plugins/darwin-x86_64/
cp lib/LLVMObfuscationPlugin.dylib /path/to/plugins/darwin-x86_64/
```

### 3. Build Windows (Advanced)

**On Windows with Visual Studio 2022:**
```cmd
cd C:\llvm-project
mkdir build
cd build

cmake -G "Visual Studio 17 2022" -A x64 ..\llvm ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DLLVM_TARGETS_TO_BUILD="X86"

cmake --build . --config Release --target opt --target LLVMObfuscationPlugin

REM Copy to plugins
copy bin\Release\opt.exe \path\to\plugins\windows-x86_64\
copy lib\Release\LLVMObfuscationPlugin.dll \path\to\plugins\windows-x86_64\
```

---

## Package Strategy

### Option A: Platform-Specific Wheels (Recommended) ✅

**Create separate wheels for each platform:**

```bash
# On macOS
python3 setup.py bdist_wheel --plat-name macosx_11_0_arm64
# Result: llvm_obfuscator-1.0.0-py3-none-macosx_11_0_arm64.whl (57 MB)

# On Linux (or via Docker)
python3 setup.py bdist_wheel --plat-name manylinux2014_x86_64
# Result: llvm_obfuscator-1.0.0-py3-none-manylinux2014_x86_64.whl (60 MB)

# On Windows
python setup.py bdist_wheel --plat-name win_amd64
# Result: llvm_obfuscator-1.0.0-py3-none-win_amd64.whl (65 MB)
```

**Advantages:**
- ✅ pip auto-selects correct wheel for platform
- ✅ Each package only contains binaries for that platform
- ✅ Smaller downloads (60 MB vs 180 MB)

**Installation:**
```bash
# On Linux
pip install llvm-obfuscator
# Downloads manylinux2014_x86_64 wheel automatically

# On macOS
pip install llvm-obfuscator
# Downloads macosx_11_0_arm64 wheel automatically
```

---

### Option B: Universal Wheel with All Platforms ⚠️

**Single wheel with all platforms:**

```
llvm_obfuscator-1.0.0-py3-none-any.whl (180 MB)
├── plugins/darwin-arm64/        57 MB
├── plugins/darwin-x86_64/       57 MB
├── plugins/linux-x86_64/        60 MB
└── plugins/windows-x86_64/      65 MB
```

**Advantages:**
- ✅ One package for all platforms
- ✅ Simpler distribution

**Disadvantages:**
- ❌ 180 MB download even if you only need one platform
- ❌ 4x disk space usage
- ❌ Slower installation

---

## Recommended Approach

### Use Platform-Specific Wheels

**Setup.py configuration:**
```python
# setup.py
from setuptools import setup
import platform

# Detect platform
system = platform.system().lower()
machine = platform.machine().lower()

if system == 'darwin' and machine == 'arm64':
    platform_tag = 'macosx_11_0_arm64'
    plugin_dir = 'plugins/darwin-arm64'
elif system == 'darwin' and machine == 'x86_64':
    platform_tag = 'macosx_10_9_x86_64'
    plugin_dir = 'plugins/darwin-x86_64'
elif system == 'linux' and machine == 'x86_64':
    platform_tag = 'manylinux2014_x86_64'
    plugin_dir = 'plugins/linux-x86_64'
elif system == 'windows':
    platform_tag = 'win_amd64'
    plugin_dir = 'plugins/windows-x86_64'

setup(
    name='llvm-obfuscator',
    # ... other config ...
    package_data={
        '': [f'{plugin_dir}/*'],
    },
)
```

**Build script:**
```bash
#!/bin/bash
# build_all_wheels.sh

# Build macOS arm64
python3 setup.py bdist_wheel --plat-name macosx_11_0_arm64

# Build Linux (in Docker)
docker run --rm -v $(pwd):/src python:3.11-slim bash -c "
    cd /src
    pip install setuptools wheel
    python3 setup.py bdist_wheel --plat-name manylinux2014_x86_64
"

# Upload all wheels
twine upload dist/*.whl
```

---

## Testing Matrix

### Test Each Platform

**macOS arm64:**
```bash
pip install llvm_obfuscator-1.0.0-py3-none-macosx_11_0_arm64.whl
llvm-obfuscate compile test.c --enable-flattening
# ✅ Should work
```

**Linux x86_64:**
```bash
# In Ubuntu Docker container
docker run -it --rm ubuntu:22.04
apt-get update && apt-get install -y python3-pip
pip3 install llvm_obfuscator-1.0.0-py3-none-manylinux2014_x86_64.whl
llvm-obfuscate compile test.c --enable-flattening
# ✅ Should work
```

**Windows x64:**
```cmd
pip install llvm_obfuscator-1.0.0-py3-none-win_amd64.whl
llvm-obfuscate compile test.c --enable-flattening
REM ✅ Should work
```

---

## Quick Start for Linux Support

### 1. Build Linux Binaries (30 min)

```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
./build_linux_toolchain.sh
```

### 2. Verify Build

```bash
ls -lh plugins/linux-x86_64/
# Should see:
# opt                          (~60 MB)
# LLVMObfuscationPlugin.so     (~140 KB)
```

### 3. Test in Docker

```bash
# Create test wheel
python3 setup.py bdist_wheel --plat-name manylinux2014_x86_64

# Test in Ubuntu container
docker run -it --rm \
    -v $(pwd)/dist:/wheels \
    ubuntu:22.04 bash

# Inside container:
apt-get update && apt-get install -y python3-pip clang
pip3 install /wheels/*.whl
llvm-obfuscate compile test.c --enable-flattening
```

---

## Cross-Platform Build Summary

### Minimal (macOS only):
```bash
# Already done
✅ darwin-arm64 complete
```

### Basic (macOS + Linux):
```bash
# Build Linux
./build_linux_toolchain.sh  # 30 min

✅ darwin-arm64 complete
✅ linux-x86_64 complete
```

### Complete (All platforms):
```bash
# Build Linux
./build_linux_toolchain.sh  # 30 min

# Build macOS Intel (requires Intel Mac or cross-compile)
# ... see instructions above

# Build Windows (requires Windows or cross-compile)
# ... see instructions above

✅ darwin-arm64 complete
✅ darwin-x86_64 complete
✅ linux-x86_64 complete
✅ windows-x86_64 complete
```

---

## Current vs Target State

### Current:
```
✅ macOS arm64: Working
❌ macOS x86_64: Not built
❌ Linux x86_64: Not built
❌ Windows x64: Not built
```

### After Linux build:
```
✅ macOS arm64: Working
❌ macOS x86_64: Not built
✅ Linux x86_64: Working
❌ Windows x64: Not built
```

### Full production:
```
✅ macOS arm64: Working
✅ macOS x86_64: Working
✅ Linux x86_64: Working
✅ Windows x64: Working
```

---

## Recommendations

### For Development/Testing:
- ✅ Current state (macOS arm64 only) is fine

### For Production Release:
- ✅ **Must build Linux x86_64** (largest user base)
- ⚠️ **Should build macOS x86_64** (Intel Mac users)
- ⏳ **Optional: Windows x64** (smaller user base for CLI tools)

### Priority Order:
1. ✅ **macOS arm64** (done)
2. 🔥 **Linux x86_64** (CRITICAL - most servers)
3. ⚠️ **macOS x86_64** (IMPORTANT - Intel Mac users)
4. ⏳ **Windows x64** (OPTIONAL - nice to have)

---

## Conclusion

**Q: Will it work on Linux VMs?**

**A: Not yet, but:**
1. Run `./build_linux_toolchain.sh` (30 min)
2. Package will include Linux binaries
3. Then YES - will work on fresh Linux VMs! ✅

**Next action:** Build Linux toolchain if you need Linux support

---

**Maintained By:** LLVM Obfuscation Team
**Last Updated:** 2025-10-11
