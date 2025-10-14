# LLVM Obfuscator CLI - Demo Commands

## Setup

```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
```

## Quick Demo (For Video Recording)

### Option 1: Automated Demo Script
```bash
./quick_demo.sh
```

### Option 2: Manual Commands

#### 1. Show CLI Help
```bash
python3 -m cli.obfuscate --help
python3 -m cli.obfuscate compile --help
```

#### 2. Basic Obfuscation (String + Symbol only)
```bash
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_basic \
  --platform macos \
  --level 3 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats json,html
```

#### 3. Maximum Obfuscation (All 4 Layers)
```bash
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_max \
  --platform macos \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
  --report-formats json,html
```

#### 4. Test the Binary
```bash
# Test with correct credentials
./demo_max/demo_auth_200 admin "Admin@SecurePass2024!"

# Test with wrong credentials
./demo_max/demo_auth_200 admin "WrongPassword"
```

#### 5. Verify Obfuscation

**Check for secrets:**
```bash
strings demo_max/demo_auth_200 | grep -iE "password|admin|secret|sk_live"
# Should return nothing (secrets are encrypted)
```

**Check symbols:**
```bash
nm demo_max/demo_auth_200 | grep ' T '
# Should show obfuscated names like f_a1b2c3d4e5f6
```

**Compare sizes:**
```bash
ls -lh /Users/akashsingh/Desktop/llvm/bin/demos/demo_auth_200_macos
ls -lh demo_max/demo_auth_200
```

**Count symbols:**
```bash
# Original
nm -g /Users/akashsingh/Desktop/llvm/bin/demos/demo_auth_200_macos 2>/dev/null | grep -v ' U ' | wc -l

# Obfuscated
nm -g demo_max/demo_auth_200 2>/dev/null | grep -v ' U ' | wc -l
```

#### 6. View Reports
```bash
# Open HTML report
open demo_max/demo_auth_200.html

# View JSON report
cat demo_max/demo_auth_200.json | jq .
```

#### 7. Analyze Binary
```bash
python3 -m cli.obfuscate analyze demo_max/demo_auth_200
```

#### 8. Compare Binaries
```bash
python3 -m cli.obfuscate compare \
  /Users/akashsingh/Desktop/llvm/bin/demos/demo_auth_200_macos \
  demo_max/demo_auth_200 \
  --output comparison.html
```

## Other Examples

### C++ Example (License Checker)
```bash
python3 -m cli.obfuscate compile \
  ../../src/license_checker.cpp \
  --output ./demo_cpp \
  --platform macos \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats json,html
```

### Simple Factorial Example
```bash
python3 -m cli.obfuscate compile \
  ../../src/factorial_recursive.c \
  --output ./demo_factorial \
  --platform macos \
  --level 3 \
  --string-encryption \
  --enable-symbol-obfuscation

# Test it
./demo_factorial/factorial_recursive 5
```

## Linux Cross-Compilation

**Note:** OLLVM passes are skipped for cross-compilation (macOS → Linux)

```bash
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_linux \
  --platform linux \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats json
```

## Batch Processing

Create `batch.yaml`:
```yaml
jobs:
  - source: "../../src/demo_auth_200.c"
    output: "./batch_output/auth"
    config:
      level: 5
      string_encryption: true
      enable_symbol_obfuscation: true
      platform: macos

  - source: "../../src/factorial_recursive.c"
    output: "./batch_output/factorial"
    config:
      level: 3
      string_encryption: true
      platform: macos
```

Run batch:
```bash
python3 -m cli.obfuscate batch batch.yaml
```

## Key Points for Demo

### What to Show in Video:

1. **Start with source code** - Show the hardcoded secrets
   ```bash
   cat ../../src/demo_auth_200.c | grep -A2 "ADMIN_PASSWORD\|API_KEY"
   ```

2. **Run obfuscation command** - Show the CLI in action
   ```bash
   python3 -m cli.obfuscate compile ../../src/demo_auth_200.c --level 5 --string-encryption --enable-symbol-obfuscation ...
   ```

3. **Test the binary works** - Prove functionality is preserved
   ```bash
   ./demo_max/demo_auth_200 admin "Admin@SecurePass2024!"
   ```

4. **Verify secrets are hidden** - Show strings command returns nothing
   ```bash
   strings demo_max/demo_auth_200 | grep -i "password"
   ```

5. **Show the report** - Open HTML report in browser
   ```bash
   open demo_max/demo_auth_200.html
   ```

## Common Issues

### If OLLVM plugin not found:
```bash
# Check plugin exists
ls -la /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib

# Rebuild if needed
cd /Users/akashsingh/Desktop/llvm-project/build
ninja
```

### If symbol obfuscator not found:
```bash
cd /Users/akashsingh/Desktop/llvm/symbol-obfuscator
mkdir -p build && cd build
cmake .. && make
```

## Clean Up

```bash
# Remove demo outputs
rm -rf demo_* quick_demo_output batch_output
```
