# OLLVM Plugin Packaging Plan

**Date:** 2025-10-11
**Status:** 📋 PLANNED - Ready to Implement

---

## Current Situation

### Plugin Location
**Current:** `/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib`

**Details:**
- File size: 132 KB
- Architecture: arm64 (Apple Silicon)
- Format: Mach-O 64-bit bundle
- Location: External LLVM fork build directory

### Problem
❌ **NOT packaged with CLI tool**
❌ Users must build LLVM fork separately
❌ Requires manual path specification
❌ Platform-specific (need separate builds)

---

## Packaging Strategy

### Option 1: Bundle Plugin with CLI (Recommended)

**Pros:**
- ✅ Zero external dependencies
- ✅ Works out of the box
- ✅ Simple user experience
- ✅ Easy distribution

**Cons:**
- ⚠️ Increases package size (~130 KB per platform)
- ⚠️ Need separate plugins for each platform
- ⚠️ License considerations (LLVM Apache 2.0)

**Implementation:**
```
cmd/llvm-obfuscator/
├── cli/
├── core/
├── plugins/
│   ├── darwin-arm64/
│   │   └── LLVMObfuscationPlugin.dylib
│   ├── darwin-x86_64/
│   │   └── LLVMObfuscationPlugin.dylib
│   ├── linux-x86_64/
│   │   └── LLVMObfuscationPlugin.so
│   └── windows-x86_64/
│       └── LLVMObfuscationPlugin.dll
└── requirements.txt
```

---

### Option 2: Download on First Use

**Pros:**
- ✅ Smaller initial package
- ✅ Can update plugin independently
- ✅ User controls what they download

**Cons:**
- ⚠️ Requires network connection
- ⚠️ Setup step required
- ⚠️ Hosting infrastructure needed

**Implementation:**
```bash
# First run triggers download
python3 -m cli.obfuscate compile --enable-flattening src/file.c

# Downloads plugin to:
~/.llvm-obfuscator/plugins/darwin-arm64/LLVMObfuscationPlugin.dylib
```

---

### Option 3: Separate Plugin Package (Current State)

**Pros:**
- ✅ Lightweight CLI
- ✅ Advanced users can build custom plugins

**Cons:**
- ❌ Poor user experience
- ❌ Complex setup
- ❌ Documentation overhead

**Status:** This is the current approach (not ideal)

---

## Recommended Approach: Hybrid

### Phase 1: Bundle Common Platforms (Immediate)
Package pre-built plugins for:
- macOS arm64 (Apple Silicon)
- macOS x86_64 (Intel)
- Linux x86_64

**Auto-detection logic:**
```python
import platform
import sys
from pathlib import Path

def get_plugin_path() -> Path:
    """Auto-detect and return bundled plugin path."""

    # Determine platform
    system = platform.system().lower()  # darwin, linux, windows
    machine = platform.machine().lower()  # arm64, x86_64, amd64

    # Normalize architecture names
    if machine in ['x86_64', 'amd64']:
        arch = 'x86_64'
    elif machine in ['arm64', 'aarch64']:
        arch = 'arm64'
    else:
        raise ValueError(f"Unsupported architecture: {machine}")

    # Build plugin path
    plugin_dir = Path(__file__).parent / "plugins" / f"{system}-{arch}"

    if system == "darwin":
        plugin_file = plugin_dir / "LLVMObfuscationPlugin.dylib"
    elif system == "linux":
        plugin_file = plugin_dir / "LLVMObfuscationPlugin.so"
    elif system == "windows":
        plugin_file = plugin_dir / "LLVMObfuscationPlugin.dll"
    else:
        raise ValueError(f"Unsupported platform: {system}")

    if not plugin_file.exists():
        raise FileNotFoundError(
            f"OLLVM plugin not found for {system}-{arch}. "
            f"Expected: {plugin_file}"
        )

    return plugin_file
```

### Phase 2: Fallback to Custom Path
If bundled plugin not available, check:
1. User-specified path via `--custom-pass-plugin`
2. Environment variable: `LLVM_OBFUSCATION_PLUGIN`
3. System paths: `/usr/local/lib`, `/opt/llvm/lib`

### Phase 3: Download on Demand (Future)
If no plugin found, offer to download:
```bash
Plugin not found for your platform (linux-x86_64).
Would you like to download it? (y/n): y

Downloading from: https://github.com/yourorg/llvm-obfuscator-plugins
Saved to: ~/.llvm-obfuscator/plugins/linux-x86_64/LLVMObfuscationPlugin.so
```

---

## Implementation Steps

### Step 1: Create Plugin Directory Structure
```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
mkdir -p plugins/darwin-arm64
mkdir -p plugins/darwin-x86_64
mkdir -p plugins/linux-x86_64
mkdir -p plugins/windows-x86_64
```

### Step 2: Copy Current Plugin
```bash
# Copy the macOS arm64 plugin we have
cp /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
   /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator/plugins/darwin-arm64/
```

### Step 3: Update obfuscator.py with Auto-Detection

Add to `core/obfuscator.py`:
```python
def _get_default_plugin_path(self) -> Optional[Path]:
    """Auto-detect bundled OLLVM plugin."""
    try:
        import platform
        system = platform.system().lower()
        machine = platform.machine().lower()

        # Normalize architecture
        if machine in ['x86_64', 'amd64']:
            arch = 'x86_64'
        elif machine in ['arm64', 'aarch64']:
            arch = 'arm64'
        else:
            return None

        # Determine plugin extension
        if system == "darwin":
            ext = "dylib"
        elif system == "linux":
            ext = "so"
        elif system == "windows":
            ext = "dll"
        else:
            return None

        # Build path to bundled plugin
        plugin_dir = Path(__file__).parent.parent / "plugins" / f"{system}-{arch}"
        plugin_file = plugin_dir / f"LLVMObfuscationPlugin.{ext}"

        if plugin_file.exists():
            self.logger.info(f"Using bundled plugin: {plugin_file}")
            return plugin_file

        return None
    except Exception as e:
        self.logger.debug(f"Could not auto-detect plugin: {e}")
        return None
```

### Step 4: Update Compilation Logic

Modify `_compile()` method:
```python
# In _compile() method, replace:
if config.custom_pass_plugin and enabled_passes:
    plugin_path = config.custom_pass_plugin

# With:
if enabled_passes:
    # Try to find plugin
    plugin_path = config.custom_pass_plugin

    if not plugin_path:
        # Try bundled plugin
        plugin_path = self._get_default_plugin_path()

    if not plugin_path:
        # Try environment variable
        env_plugin = os.getenv("LLVM_OBFUSCATION_PLUGIN")
        if env_plugin:
            plugin_path = Path(env_plugin)

    if not plugin_path or not plugin_path.exists():
        self.logger.error(
            "OLLVM passes requested but no plugin found. "
            "Options: "
            "1. Use --custom-pass-plugin /path/to/plugin "
            "2. Set LLVM_OBFUSCATION_PLUGIN env var "
            "3. Ensure bundled plugin exists for your platform"
        )
        raise ObfuscationError("OLLVM plugin not found")

    # Continue with 3-step workflow...
```

### Step 5: Update CLI to Make Plugin Optional

Modify `cli/obfuscate.py`:
```python
@app.command()
def compile(
    # ... other params ...
    custom_pass_plugin: Optional[Path] = typer.Option(
        None,  # Changed from required to optional
        help="Path to LLVM pass plugin (auto-detected if not specified)"
    ),
):
```

### Step 6: Build Cross-Platform Plugins

**For Linux x86_64:**
```bash
# On Linux machine or Docker
docker run -it --rm -v /Users/akashsingh/Desktop/llvm-project:/src ubuntu:22.04
apt-get update && apt-get install -y cmake ninja-build clang
cd /src/build
cmake -G Ninja ../llvm -DLLVM_ENABLE_PROJECTS="clang" \
  -DCMAKE_BUILD_TYPE=Release
ninja LLVMObfuscationPlugin

# Copy .so file
cp build/lib/LLVMObfuscationPlugin.so /path/to/plugins/linux-x86_64/
```

**For macOS x86_64:**
```bash
# On macOS Intel machine or via cross-compile
cmake -G Ninja ../llvm \
  -DCMAKE_OSX_ARCHITECTURES=x86_64 \
  -DCMAKE_BUILD_TYPE=Release
ninja LLVMObfuscationPlugin

# Copy .dylib file
cp build/lib/LLVMObfuscationPlugin.dylib /path/to/plugins/darwin-x86_64/
```

**For Windows x86_64:**
```bash
# On Windows with Visual Studio or via cross-compile
cmake -G "Visual Studio 17 2022" -A x64 ../llvm
cmake --build . --config Release --target LLVMObfuscationPlugin

# Copy .dll file
cp build/lib/Release/LLVMObfuscationPlugin.dll /path/to/plugins/windows-x86_64/
```

---

## Package Distribution

### PyPI Package Structure

```
llvm-obfuscator/
├── setup.py
├── README.md
├── LICENSE (Apache 2.0)
├── src/
│   └── llvm_obfuscator/
│       ├── __init__.py
│       ├── cli/
│       ├── core/
│       └── plugins/
│           ├── __init__.py
│           ├── darwin-arm64/
│           │   └── LLVMObfuscationPlugin.dylib
│           ├── darwin-x86_64/
│           │   └── LLVMObfuscationPlugin.dylib
│           ├── linux-x86_64/
│           │   └── LLVMObfuscationPlugin.so
│           └── README.md
```

### setup.py

```python
from setuptools import setup, find_packages

setup(
    name="llvm-obfuscator",
    version="1.0.0",
    description="Production-ready LLVM binary obfuscation tool",
    author="LLVM Obfuscation Team",
    license="Apache 2.0",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    include_package_data=True,
    package_data={
        "llvm_obfuscator": [
            "plugins/darwin-arm64/*.dylib",
            "plugins/darwin-x86_64/*.dylib",
            "plugins/linux-x86_64/*.so",
            "plugins/windows-x86_64/*.dll",
        ],
    },
    install_requires=[
        "typer>=0.12.0",
        "pyyaml>=6.0",
    ],
    entry_points={
        "console_scripts": [
            "llvm-obfuscate=llvm_obfuscator.cli.obfuscate:app",
        ],
    },
    python_requires=">=3.9",
)
```

### MANIFEST.in

```
include LICENSE
include README.md
recursive-include src/llvm_obfuscator/plugins *.dylib *.so *.dll
```

---

## Usage After Packaging

### Installation
```bash
pip install llvm-obfuscator
```

### Usage (Plugin Auto-Detected)
```bash
# No need to specify plugin path!
llvm-obfuscate compile src/file.c \
  --level 4 \
  --enable-flattening \
  --enable-boguscf
```

### Usage (Custom Plugin)
```bash
# Still works if user wants custom plugin
llvm-obfuscate compile src/file.c \
  --level 4 \
  --enable-flattening \
  --custom-pass-plugin /path/to/custom/plugin.dylib
```

---

## File Size Impact

### Current CLI Size
```bash
du -sh cmd/llvm-obfuscator/
# ~500 KB (without plugins)
```

### With Bundled Plugins
```
Plugins:
- darwin-arm64:   132 KB
- darwin-x86_64:  ~135 KB (estimated)
- linux-x86_64:   ~140 KB (estimated)
- windows-x86_64: ~150 KB (estimated)

Total: ~557 KB additional
Final package: ~1.1 MB
```

**Impact:** Minimal - still under 2 MB total

---

## License Compliance

### LLVM License
- Apache License 2.0 with LLVM Exceptions
- ✅ Commercial use allowed
- ✅ Modification allowed
- ✅ Distribution allowed
- ✅ Private use allowed

### Requirements
1. Include original LICENSE file
2. State changes made to LLVM code
3. Include copyright notice

**Action Items:**
- [ ] Copy LLVM LICENSE to `plugins/LICENSE`
- [ ] Create `plugins/NOTICE` documenting changes
- [ ] Update main README with attribution

---

## Testing Packaged Version

### Create Test Package
```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
python3 setup.py sdist bdist_wheel
```

### Install Locally
```bash
pip install dist/llvm-obfuscator-1.0.0.tar.gz
```

### Test Auto-Detection
```bash
# Should work without --custom-pass-plugin
llvm-obfuscate compile test.c --enable-flattening
```

---

## Deployment Checklist

- [ ] Create `plugins/` directory structure
- [ ] Copy current macOS arm64 plugin
- [ ] Build Linux x86_64 plugin
- [ ] Build macOS x86_64 plugin
- [ ] Build Windows x86_64 plugin (optional)
- [ ] Implement auto-detection in `obfuscator.py`
- [ ] Update CLI to make plugin optional
- [ ] Add LLVM license files
- [ ] Update README with attribution
- [ ] Create setup.py
- [ ] Test local installation
- [ ] Test on each supported platform
- [ ] Create release on GitHub
- [ ] Publish to PyPI

---

## Timeline

### Immediate (Today)
✅ Document current state
✅ Plan packaging strategy
⏳ Implement auto-detection logic
⏳ Copy current plugin to `plugins/`

### Short-term (This Week)
- [ ] Build Linux x86_64 plugin
- [ ] Build macOS x86_64 plugin
- [ ] Test on multiple platforms
- [ ] Update documentation

### Medium-term (Next Sprint)
- [ ] Build Windows plugin
- [ ] Create PyPI package
- [ ] Set up automated builds
- [ ] Add plugin download fallback

---

## Conclusion

**Current State:** Plugin is external dependency
**Target State:** Plugin bundled with CLI, auto-detected
**User Impact:** Zero - CLI "just works" for OLLVM passes

**Next Action:** Implement auto-detection and copy plugin to CLI directory

---

**Maintained By:** LLVM Obfuscation Team
**Last Updated:** 2025-10-11
