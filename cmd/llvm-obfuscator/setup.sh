#!/usr/bin/env bash
set -euo pipefail

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENV_DIR="$PROJECT_ROOT/.venv"
PLUGIN_SOURCE="/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
PLUGIN_DEST="$PROJECT_ROOT/core/plugins/LLVMObfuscationPlugin.dylib"

printf '\n==> Checking LLVM toolchain...\n'
if command -v llvm-config >/dev/null 2>&1; then
  LLVM_VERSION="$(llvm-config --version | cut -d. -f1)"
  if [[ "$LLVM_VERSION" -lt 22 ]]; then
    echo "[WARN] LLVM version 22 or newer required, found $(llvm-config --version)"
  else
    echo "[OK] LLVM $(llvm-config --version) detected"
  fi
else
  echo "[WARN] llvm-config not found. Ensure LLVM 22 is installed and on PATH."
fi

printf '\n==> Preparing OLLVM plugin...\n'
if [[ -f "$PLUGIN_SOURCE" ]]; then
  cp "$PLUGIN_SOURCE" "$PLUGIN_DEST"
  echo "[OK] Plugin copied to $PLUGIN_DEST"
else
  echo "[WARN] Plugin not found at $PLUGIN_SOURCE"
fi

printf '\n==> Setting up Python environment...\n'
python3 -m venv "$VENV_DIR"
# shellcheck disable=SC1090
source "$VENV_DIR/bin/activate"
python -m pip install --upgrade pip
python -m pip install -r "$PROJECT_ROOT/requirements.txt"

printf '\n==> Running initial test suite...\n'
pytest "$PROJECT_ROOT/tests" --maxfail=1 --disable-warnings

printf '\nSetup complete. Activate environment with:\n  source %s\n' "$VENV_DIR/bin/activate"
