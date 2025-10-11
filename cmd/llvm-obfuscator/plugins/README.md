# LLVM Obfuscator Binaries

This directory contains platform-specific LLVM 22 toolchain binaries.

## ⚠️ Binaries Not Included in Git

The actual binary files are **NOT stored in git** due to GitHub's file size limits.

**Binary files that belong here:**
- `opt` (57-60 MB) - LLVM optimizer with OLLVM passes
- `clang` (117-123 MB) - LLVM 22 compiler
- `LLVMObfuscationPlugin.{so,dylib,dll}` (116-150 KB) - Obfuscation plugin

These files are:
- ❌ **NOT in git repository** (too large for GitHub)
- ✅ **Built during development** (using build scripts)
- ✅ **Bundled in distribution packages** (wheels, pip packages)

## Directory Structure

```
plugins/
├── README.md                    (this file)
├── darwin-arm64/               (macOS Apple Silicon)
│   ├── opt                     (built, not in git)
│   ├── clang                   (built, not in git)
│   └── LLVMObfuscationPlugin.dylib (built, not in git)
├── darwin-x86_64/              (macOS Intel)
│   ├── opt                     (not built yet)
│   ├── clang                   (not built yet)
│   └── LLVMObfuscationPlugin.dylib (not built yet)
├── linux-x86_64/               (Linux x86_64)
│   ├── opt                     (built, not in git)
│   ├── clang                   (built, not in git)
│   └── LLVMObfuscationPlugin.so (built, not in git)
├── linux-aarch64/              (Linux ARM)
│   ├── opt                     (alias to linux-x86_64)
│   ├── clang                   (alias to linux-x86_64)
│   └── LLVMObfuscationPlugin.so (alias to linux-x86_64)
└── windows-x86_64/             (Windows)
    ├── opt.exe                 (not built yet)
    ├── clang.exe               (not built yet)
    └── LLVMObfuscationPlugin.dll (not built yet)
```

## Building Binaries

### macOS ARM64

```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
./build_complete_toolchain.sh
```

### Linux (via Docker)

```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
./build_linux_toolchain.sh
```

For x86_64, modify the Dockerfile to use:
```dockerfile
FROM --platform=linux/amd64 ubuntu:22.04
```

### Windows

Build on Windows machine with Visual Studio 2022:
```cmd
cd C:\path\to\llvm-project\build
cmake -G "Visual Studio 17 2022" -A x64 ..\llvm -DLLVM_ENABLE_PROJECTS=clang
cmake --build . --config Release --target opt clang LLVMObfuscationPlugin
```

## For Package Maintainers

When creating distribution packages (wheels, PyPI):

1. **Build binaries** for your target platform
2. **Place in correct directory** (e.g., `plugins/linux-x86_64/`)
3. **Run packaging command**:
   ```bash
   python3 setup.py bdist_wheel --plat-name manylinux_2_17_x86_64
   ```
4. **Verify binaries are included** in the wheel:
   ```bash
   unzip -l dist/*.whl | grep plugins
   ```

The binaries WILL be included in the distribution package via `MANIFEST.in`.

## For Developers

If you're developing locally:

1. **Build binaries** using the build scripts above
2. **Binaries stay in your working directory**
3. **Git ignores them** (via `.gitignore`)
4. **CLI auto-detects them** when you run obfuscation commands

Example workflow:
```bash
# Build once
./build_linux_toolchain.sh

# Use forever
python -m cli.obfuscate compile test.c --enable-flattening
# ✅ Uses your locally built binaries
```

## For End Users

When you install via pip:

```bash
pip install llvm-obfuscator
```

The binaries are **automatically included** in the package. No manual building required!

## Why Not in Git?

GitHub has file size limits:
- ⚠️ Warning at 50 MB
- ❌ Error at 100 MB

Our binaries:
- `clang`: 117-123 MB ← Exceeds limit
- `opt`: 57-60 MB ← Exceeds warning
- `plugin`: 116-150 KB ← OK

**Solution:** Build locally, distribute via pip packages.

## File Size Summary

| Platform | opt | clang | plugin | Total |
|----------|-----|-------|--------|-------|
| macOS ARM64 | 57 MB | 117 MB | 132 KB | ~174 MB |
| macOS Intel | 57 MB | 117 MB | 132 KB | ~174 MB |
| Linux x86_64 | 60 MB | 123 MB | 116 KB | ~183 MB |
| Linux ARM64 | 60 MB | 123 MB | 116 KB | ~183 MB |
| Windows x64 | 65 MB | 130 MB | 150 KB | ~195 MB |

**Total (all platforms):** ~909 MB

## Documentation

- **Build Guide:** `../build_complete_toolchain.sh`
- **Linux Build:** `../build_linux_toolchain.sh`
- **Linux Docs:** `../LINUX_BUILD_COMPLETE.md`
- **Deployment:** `../../FINAL_DEPLOYMENT_SOLUTION.md`
- **Main Docs:** `../../OBFUSCATION_COMPLETE.md`

## License

These binaries are built from LLVM, which is licensed under Apache 2.0 with LLVM Exceptions.

See: https://llvm.org/docs/DeveloperPolicy.html#license
