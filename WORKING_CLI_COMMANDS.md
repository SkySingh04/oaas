# Working CLI Commands for Demo Video

## ⚠️ Important Note
On macOS, the bundled LLVM clang has issues with standard library headers.
For the demo, use **Linux cross-compilation** which uses system clang.

## Setup
```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
```

## ✅ WORKING COMMANDS

### 1. Show CLI Help
```bash
python3 -m cli.obfuscate --help
```

### 2. Basic Obfuscation (Linux target - RECOMMENDED)
```bash
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_linux \
  --platform linux \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --custom-flags "-O3 -flto" \
  --report-formats json,html
```

**Output:**
- Binary: `./demo_linux/demo_auth_200` (Linux ELF)
- Report: `./demo_linux/demo_auth_200.html`

**Note:** OLLVM passes are skipped for cross-compilation, but you still get:
- ✅ Layer 1: Symbol Obfuscation
- ✅ Layer 2: String Encryption
- ✅ Layer 4: Compiler Flags

### 3. View the Output
```bash
# Check it's a Linux binary
file ./demo_linux/demo_auth_200

# Check for secrets (should find none!)
strings ./demo_linux/demo_auth_200 | grep -iE "password|admin@|secret|sk_live"

# View report
open ./demo_linux/demo_auth_200.html
```

### 4. Analyze the Binary
```bash
python3 -m cli.obfuscate analyze ./demo_linux/demo_auth_200
```

### 5. Test on Linux (copy to server)
```bash
# Copy to production server
scp ./demo_linux/demo_auth_200 root@69.62.77.147:/tmp/

# Run on server
ssh root@69.62.77.147 "chmod +x /tmp/demo_auth_200 && /tmp/demo_auth_200 admin 'Admin@SecurePass2024!'"
```

## Alternative: Use Web UI for macOS Binaries

If you need macOS binaries with full OLLVM support, use the **Web UI** at:
**http://69.62.77.147:4666**

The web UI can compile for any platform from the Linux server.

## Quick Demo Script (Linux Target)

```bash
#!/bin/bash
clear
echo "LLVM Obfuscator CLI Demo"
echo "========================"
echo ""

cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator

echo "1. Obfuscating C code..."
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo \
  --platform linux \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats json,html

echo ""
echo "2. Checking for secrets..."
strings ./demo/demo_auth_200 | grep -iE "password|admin@|secret" || echo "✓ No secrets found!"

echo ""
echo "3. Checking symbols..."
nm ./demo/demo_auth_200 2>/dev/null | grep ' T ' | head -5

echo ""
echo "4. View report: open ./demo/demo_auth_200.html"
echo ""
echo "✅ Demo complete!"
```

## For Video Recording

### Show These Steps:

1. **Show source code** with secrets:
```bash
head -20 ../../src/demo_auth_200.c
```

2. **Run obfuscation**:
```bash
python3 -m cli.obfuscate compile ../../src/demo_auth_200.c \
  --output ./demo \
  --platform linux \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats json,html
```

3. **Verify secrets are hidden**:
```bash
strings ./demo/demo_auth_200 | grep -i "password"
# Output: (nothing - secrets encrypted!)
```

4. **Show obfuscated symbols**:
```bash
nm ./demo/demo_auth_200 | grep ' T '
# Output: obfuscated names like f_a1b2c3d4
```

5. **Open HTML report**:
```bash
open ./demo/demo_auth_200.html
```

6. **Test on production server**:
```bash
scp ./demo/demo_auth_200 root@69.62.77.147:/tmp/
ssh root@69.62.77.147 "/tmp/demo_auth_200 admin 'Admin@SecurePass2024!'"
```

## Clean Up
```bash
rm -rf demo demo_linux test_demo*
```
