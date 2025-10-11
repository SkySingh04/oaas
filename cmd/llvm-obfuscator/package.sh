#!/bin/bash

# Package LLVM Obfuscator for Distribution
# Creates both wheel and source distributions
# Date: 2025-10-11

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Colors
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo "======================================"
echo "LLVM Obfuscator - Package Builder"
echo "======================================"
echo ""

# Check Python
if ! command -v python3 &> /dev/null; then
    echo -e "${RED}Error: python3 not found${NC}"
    exit 1
fi

# Check if plugins exist
echo "Checking for plugins..."
PLUGIN_COUNT=0

check_plugin() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✅${NC} $1"
        PLUGIN_COUNT=$((PLUGIN_COUNT + 1))
        return 0
    else
        echo -e "${YELLOW}⚠️ ${NC} $1 (optional)"
        return 1
    fi
}

check_plugin "plugins/darwin-arm64/LLVMObfuscationPlugin.dylib"
check_plugin "plugins/darwin-x86_64/LLVMObfuscationPlugin.dylib"
check_plugin "plugins/linux-x86_64/LLVMObfuscationPlugin.so"
check_plugin "plugins/windows-x86_64/LLVMObfuscationPlugin.dll"

echo ""
if [ $PLUGIN_COUNT -eq 0 ]; then
    echo -e "${RED}Error: No plugins found!${NC}"
    echo "Run ./build_plugins.sh first to build plugins."
    exit 1
elif [ $PLUGIN_COUNT -lt 3 ]; then
    echo -e "${YELLOW}Warning: Only $PLUGIN_COUNT plugins found.${NC}"
    read -p "Continue packaging? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo -e "${GREEN}Found $PLUGIN_COUNT plugins!${NC}"
fi

# Install/upgrade packaging tools
echo ""
echo "Installing packaging tools..."
python3 -m pip install --upgrade pip setuptools wheel build twine

# Clean previous builds
echo ""
echo "Cleaning previous builds..."
rm -rf build/ dist/ *.egg-info

# Build distributions
echo ""
echo "Building distributions..."
python3 -m build

# Check built distributions
echo ""
echo "======================================"
echo "Build Results"
echo "======================================"
echo ""

if [ -d "dist" ]; then
    ls -lh dist/
    echo ""

    # Calculate sizes
    WHEEL_SIZE=$(du -sh dist/*.whl 2>/dev/null | cut -f1 || echo "N/A")
    TAR_SIZE=$(du -sh dist/*.tar.gz 2>/dev/null | cut -f1 || echo "N/A")

    echo "Wheel package: $WHEEL_SIZE"
    echo "Source package: $TAR_SIZE"
    echo ""

    # Verify package contents
    echo "Verifying package contents..."
    python3 << 'PYEOF'
import zipfile
import sys
from pathlib import Path

wheel_files = list(Path("dist").glob("*.whl"))
if not wheel_files:
    print("❌ No wheel file found")
    sys.exit(1)

wheel_file = wheel_files[0]
print(f"Inspecting: {wheel_file.name}")

with zipfile.ZipFile(wheel_file, 'r') as zf:
    files = zf.namelist()

    # Check for plugins
    plugin_files = [f for f in files if 'plugins/' in f and (f.endswith('.dylib') or f.endswith('.so') or f.endswith('.dll'))]

    print(f"\n✅ Total files: {len(files)}")
    print(f"✅ Plugin files: {len(plugin_files)}")

    if plugin_files:
        print("\nIncluded plugins:")
        for pf in plugin_files:
            info = zf.getinfo(pf)
            size_kb = info.file_size / 1024
            print(f"  - {pf} ({size_kb:.1f} KB)")
    else:
        print("\n⚠️  Warning: No plugins found in wheel!")

    # Check for core modules
    core_modules = [f for f in files if f.startswith('cli/') or f.startswith('core/')]
    print(f"\n✅ Core modules: {len(core_modules)}")

PYEOF

    echo ""
    echo -e "${GREEN}✅ Package built successfully!${NC}"
    echo ""
    echo "Next steps:"
    echo "  1. Test locally: pip install dist/*.whl"
    echo "  2. Upload to TestPyPI: twine upload --repository testpypi dist/*"
    echo "  3. Upload to PyPI: twine upload dist/*"
    echo ""
    echo "Test installation:"
    echo "  pip install dist/*.whl"
    echo "  llvm-obfuscate --help"
else
    echo -e "${RED}Error: Build failed!${NC}"
    exit 1
fi
