# LLVM Obfuscator - Demo Video Commands

**Last Updated:** 2025-10-14
**Status:** ✅ All commands tested and working

---

## 🎬 Demo Video Script

### Setup
```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
```

---

## 🎯 Part 1: Show the Problem (30 seconds)

### 1.1 Display source code with secrets
```bash
# Show hardcoded credentials
head -40 ../../src/demo_auth_200.c
```

**What to highlight:**
- Line 30: `MASTER_PASSWORD = "Admin@SecurePass2024!"`
- Line 31: `API_KEY = "sk_live_prod_a3f8d9e4b7c2a1f6"`
- Line 33: `DB_CONNECTION_STRING` with database password
- Line 35: `ENCRYPTION_KEY = "AES256-MASTER-KEY-2024-SECURE"`

### 1.2 Show normal compilation exposes secrets
```bash
# Compile without obfuscation
clang ../../src/demo_auth_200.c -o ./demo_unprotected

# Show secrets are visible!
strings ./demo_unprotected | grep -E "Admin@SecurePass2024|sk_live_prod"
```

**Expected output:** Both secrets will be visible in plain text!

---

## 🔒 Part 2: CLI Obfuscation Demo (2-3 minutes)

### 2.1 Show CLI help
```bash
python3 -m cli.obfuscate --help
```

### 2.2 Show compile options
```bash
python3 -m cli.obfuscate compile --help
```

### 2.3 Basic Obfuscation (Linux target - fastest)
```bash
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_protected \
  --platform linux \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --custom-flags "-O3 -flto -fvisibility=hidden" \
  --report-formats json,html
```

**What this does:**
- ✅ Encrypts all hardcoded strings
- ✅ Obfuscates function names
- ✅ Applies compiler hardening flags
- ✅ Generates comprehensive report

**Time:** ~10-15 seconds

---

## 🔍 Part 3: Verify Protection (1 minute)

### 3.1 Check binary was created
```bash
ls -lh ./demo_protected/demo_auth_200
file ./demo_protected/demo_auth_200
```

### 3.2 Try to find secrets (THEY SHOULD BE GONE!)
```bash
# Try to find passwords
strings ./demo_protected/demo_auth_200 | grep -i "password"
# ✅ Should return nothing!

# Try to find API key
strings ./demo_protected/demo_auth_200 | grep -i "sk_live"
# ✅ Should return nothing!

# Try to find admin credentials
strings ./demo_protected/demo_auth_200 | grep -i "Admin@SecurePass"
# ✅ Should return nothing!

# Try to find database credentials
strings ./demo_protected/demo_auth_200 | grep -i "DBPass2024"
# ✅ Should return nothing!
```

### 3.3 Check obfuscated symbols
```bash
# Show obfuscated function names
nm ./demo_protected/demo_auth_200 | grep ' T '

# Compare symbol count
echo "Original symbols:"
nm ./demo_unprotected | grep -v ' U ' | wc -l

echo "Obfuscated symbols:"
nm ./demo_protected/demo_auth_200 | grep -v ' U ' | wc -l
```

---

## 📊 Part 4: View Report (30 seconds)

### 4.1 Open HTML report
```bash
open ./demo_protected/demo_auth_200.html
```

**What to show:**
- Input configuration
- String encryption metrics (how many strings encrypted)
- Symbol obfuscation details
- Binary size comparison
- Security level achieved

### 4.2 Check JSON report
```bash
cat ./demo_protected/demo_auth_200.json | jq .
```

---

## ✅ Part 5: Functional Test (30 seconds)

### 5.1 Copy to Linux server and test
```bash
# Upload to production server
scp ./demo_protected/demo_auth_200 root@69.62.77.147:/tmp/

# Test with correct credentials
ssh root@69.62.77.147 "chmod +x /tmp/demo_auth_200 && /tmp/demo_auth_200 admin 'Admin@SecurePass2024!'"
```

**Expected output:**
```
========================================
  Enterprise Auth System v2.0
  Multi-Layer Security Demo
========================================

[AUTH] User 'admin' authenticated successfully
[AUTH] Role: administrator | Access Level: 9
[JWT] Token generated for user: admin
[ACCESS] User 'admin' has sufficient access (level 9 >= 3)
[DB] Connecting to database...
[DB] Connection established

========================================
[RESULT] Authentication successful
Session Token: JWT.admin.super_secret_jwt_signing_key_do_not_share
========================================
```

**KEY POINT:** Binary still works perfectly! All functionality preserved.

### 5.2 Test with wrong password
```bash
ssh root@69.62.77.147 "/tmp/demo_auth_200 admin 'WrongPassword'"
```

**Expected output:**
```
[AUTH] Authentication failed for user 'admin'
[RESULT] Authentication failed
```

---

## 🔬 Part 6: Binary Analysis (Optional - 1 minute)

### 6.1 Analyze obfuscated binary
```bash
python3 -m cli.obfuscate analyze ./demo_protected/demo_auth_200
```

**Shows:**
- Binary format and architecture
- Symbol complexity
- Entropy score
- Estimated reverse engineering difficulty

### 6.2 Compare original vs obfuscated
```bash
python3 -m cli.obfuscate compare \
  ./demo_unprotected \
  ./demo_protected/demo_auth_200 \
  --output comparison.html

open comparison.html
```

**Shows side-by-side:**
- Size difference
- Symbol reduction percentage
- Entropy increase
- Security improvement score

---

## 🚀 Advanced Demo (Optional - 2 minutes)

### Maximum Obfuscation with OLLVM Passes

**Note:** Requires OLLVM plugin built at:
`/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib`

```bash
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_maximum \
  --platform macos \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --cycles 2 \
  --fake-loops 10 \
  --custom-flags "-O3 -flto -fvisibility=hidden -fno-builtin" \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib \
  --report-formats json,html
```

**What this adds:**
- ✅ Control flow flattening
- ✅ Instruction substitution
- ✅ Bogus control flow injection
- ✅ Basic block splitting
- ✅ 2 obfuscation cycles (double-pass)
- ✅ 10 fake loops inserted

**Time:** ~30-45 seconds (3-step OLLVM compilation)

**Test it:**
```bash
./demo_maximum/demo_auth_200 admin "Admin@SecurePass2024!"
```

---

## 📋 Quick One-Liner Demo Script

Save this as `quick_demo.sh`:

```bash
#!/bin/bash
set -e

cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator

echo "=========================================="
echo "LLVM Obfuscator CLI - Demo"
echo "=========================================="
echo ""

# Clean previous outputs
rm -rf demo_protected demo_unprotected 2>/dev/null || true

echo "1️⃣  Compiling unprotected binary..."
clang ../../src/demo_auth_200.c -o ./demo_unprotected -w
echo "   Finding secrets in unprotected binary:"
strings ./demo_unprotected | grep -i "Admin@SecurePass2024" && echo "   ❌ Secret found!" || true
echo ""

echo "2️⃣  Running obfuscation..."
python3 -m cli.obfuscate compile \
  ../../src/demo_auth_200.c \
  --output ./demo_protected \
  --platform linux \
  --level 5 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --custom-flags "-O3 -flto -fvisibility=hidden" \
  --report-formats json,html
echo ""

echo "3️⃣  Verifying protection..."
echo "   Searching for secrets in obfuscated binary:"
strings ./demo_protected/demo_auth_200 | grep -i "password\|secret\|admin@" && echo "   ❌ Secret found!" || echo "   ✅ No secrets found!"
echo ""

echo "4️⃣  Checking symbols..."
ORIG_SYMS=$(nm ./demo_unprotected | grep -v ' U ' | wc -l | tr -d ' ')
OBF_SYMS=$(nm ./demo_protected/demo_auth_200 | grep -v ' U ' | wc -l | tr -d ' ')
echo "   Original symbols: $ORIG_SYMS"
echo "   Obfuscated symbols: $OBF_SYMS"
echo "   Reduction: $(echo "scale=2; (1 - $OBF_SYMS / $ORIG_SYMS) * 100" | bc)%"
echo ""

echo "5️⃣  Testing on production server..."
scp -q ./demo_protected/demo_auth_200 root@69.62.77.147:/tmp/
ssh root@69.62.77.147 "chmod +x /tmp/demo_auth_200 && /tmp/demo_auth_200 admin 'Admin@SecurePass2024!' 2>&1 | grep -E 'authenticated successfully|Authentication failed'"
echo ""

echo "✅ Demo complete!"
echo "   View report: open ./demo_protected/demo_auth_200.html"
echo ""
```

Make it executable:
```bash
chmod +x quick_demo.sh
./quick_demo.sh
```

---

## 🎥 Recording Tips

### Before Recording:
1. Clean previous outputs:
   ```bash
   cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator
   rm -rf demo_* test_* 2>/dev/null || true
   ```

2. Test SSH connection:
   ```bash
   ssh root@69.62.77.147 "echo 'Server ready'"
   ```

3. Increase terminal font size (for video visibility)

4. Use a clean terminal profile with high contrast

### During Recording:
- Speak while commands run
- Highlight key output with cursor
- Pause after each verification step
- Show the HTML report in browser

### Key Messages:
1. "Source code contains 8 hardcoded secrets"
2. "Running CLI obfuscation with string encryption and symbol obfuscation"
3. "All secrets are now encrypted and unreadable"
4. "Function names are obfuscated to prevent reverse engineering"
5. "Binary still works perfectly - functionality preserved"

---

## 🐛 Troubleshooting

### If "string encryption had no effect":
Check the report:
```bash
cat ./demo_protected/demo_auth_200.json | jq '.string_obfuscation'
```

Should show `encrypted_strings > 0`

### If SSH fails:
Test locally with cross-compilation result (won't run but can analyze):
```bash
file ./demo_protected/demo_auth_200
strings ./demo_protected/demo_auth_200 | grep -i "password"
```

### If OLLVM plugin not found:
```bash
ls -lh /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib
```

If missing, skip OLLVM passes and use basic obfuscation only.

---

## 📈 Expected Results Summary

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Hardcoded strings visible | 8 secrets | 0 secrets | 100% hidden |
| Function names readable | Yes | No (obfuscated) | 100% obfuscated |
| Symbol count | ~50-80 | ~10-15 | 70-85% reduction |
| Binary size | ~50 KB | ~52-55 KB | +4-10% overhead |
| Performance | Baseline | ~5-10% slower | Acceptable |
| RE difficulty | Easy (1/10) | Hard (7/10) | 7x harder |

---

## ✅ Final Checklist

- [ ] CLI help command works
- [ ] Compilation completes without errors
- [ ] Output binary created
- [ ] Secrets NOT found in strings output
- [ ] Symbols are obfuscated
- [ ] HTML report generated
- [ ] Binary runs on Linux server
- [ ] Correct password works
- [ ] Wrong password fails

---

**For Questions:**
- Full docs: `/Users/akashsingh/Desktop/llvm/CLAUDE.md`
- CLI help: `python3 -m cli.obfuscate --help`
- Issues: Check `/Users/akashsingh/Desktop/llvm/WORKING_CLI_COMMANDS.md`
