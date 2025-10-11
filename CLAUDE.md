# Claude Code - LLVM Obfuscator Instructions

**Purpose:** Strict guidelines for using the LLVM Obfuscator CLI
**Audience:** AI assistants (Claude Code) working on this project
**Last Updated:** 2025-10-11

---

## 🚨 MANDATORY: Use CLI Wrapper Only

**YOU MUST NEVER:**
- ❌ Compile binaries directly with `clang` command
- ❌ Manually apply obfuscation flags
- ❌ Create custom build scripts
- ❌ Use outdated shell scripts in `sh/` directory

**YOU MUST ALWAYS:**
- ✅ Use the Python CLI wrapper: `python -m cli.obfuscate`
- ✅ Use documented presets (Standard, Maximum, Ultimate)
- ✅ Generate comprehensive reports
- ✅ Verify output binaries

---

## Primary Interface: Python CLI

**Location:** `cmd/llvm-obfuscator/cli/obfuscate.py`

**Basic Syntax:**
```bash
python -m cli.obfuscate compile <source_file> [OPTIONS]
```

**Key Principles:**
1. CLI handles ALL obfuscation layers automatically
2. CLI generates comprehensive reports
3. CLI ensures proper layer ordering
4. CLI validates configuration

---

## Standard Workflows

### Workflow 1: Quick Obfuscation (Standard Preset)

**Use Case:** Production binaries, moderate security requirements

**Command:**
```bash
cd /Users/akashsingh/Desktop/llvm/cmd/llvm-obfuscator

python -m cli.obfuscate compile ../../src/simple_auth.c \
  --output ./obfuscated \
  --level 3 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --custom-flags "-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1" \
  --report-formats "json,html"
```

**What This Does:**
- ✅ Applies Layer 1 (9 optimal compiler flags)
- ✅ Applies Layer 3 (string encryption)
- ✅ Applies Layer 0 (symbol obfuscation)
- ✅ Generates JSON + HTML reports
- ✅ ~10% overhead, 10-15x harder to reverse engineer

---

### Workflow 2: Maximum Security (Maximum Preset)

**Use Case:** High-value targets, IP protection, license validation

**Command:**
```bash
python -m cli.obfuscate compile ../../src/license_checker.cpp \
  --output ./obfuscated \
  --level 4 \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --string-encryption \
  --enable-symbol-obfuscation \
  --custom-flags "-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1" \
  --report-formats "json,markdown" \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib
```

**What This Does:**
- ✅ All layers from Standard preset
- ✅ Adds Layer 2 (all 4 OLLVM passes)
- ✅ Requires LLVM pass plugin
- ✅ ~15-20% overhead, 20-30x harder to reverse engineer

---

### Workflow 3: Ultra-Critical (Ultimate Preset)

**Use Case:** Master key decryption, proprietary algorithms

**Command:**
```bash
python -m cli.obfuscate compile ../../src/authentication_system.cpp \
  --output ./obfuscated \
  --level 5 \
  --enable-flattening \
  --enable-substitution \
  --enable-bogus-cf \
  --enable-split \
  --cycles 2 \
  --string-encryption \
  --fake-loops 10 \
  --enable-symbol-obfuscation \
  --symbol-algorithm sha256 \
  --symbol-hash-length 12 \
  --symbol-prefix typed \
  --custom-flags "-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1" \
  --report-formats "json,html,markdown" \
  --custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib
```

**What This Does:**
- ✅ All layers from Maximum preset
- ✅ 2 obfuscation cycles (double-pass)
- ✅ 10 fake loops inserted
- ✅ Full symbol obfuscation config
- ✅ ~25-30% overhead, 50x+ harder to reverse engineer

---

## Using Configuration Files (Recommended for Complex Projects)

**Create:** `config.yaml`

```yaml
obfuscation:
  level: 4
  platform: linux

  passes:
    flattening: true
    substitution: true
    bogus_control_flow: true
    split: true

  advanced:
    cycles: 1
    string_encryption: true
    fake_loops: 5
    symbol_obfuscation:
      enabled: true
      algorithm: sha256
      hash_length: 12
      prefix_style: typed
      salt: "my_secret_salt_2024"

  compiler_flags:
    - "-flto"
    - "-fvisibility=hidden"
    - "-O3"
    - "-fno-builtin"
    - "-flto=thin"
    - "-fomit-frame-pointer"
    - "-mspeculative-load-hardening"
    - "-O1"

  output:
    directory: "./obfuscated"
    report_formats:
      - json
      - html
      - markdown

  custom_pass_plugin: "/Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib"
```

**Command:**
```bash
python -m cli.obfuscate compile ../../src/auth.c --config-file config.yaml
```

---

## Batch Processing Multiple Files

**Create:** `batch.yaml`

```yaml
jobs:
  - source: "../../src/simple_auth.c"
    output: "./obfuscated/auth"
    config:
      level: 4
      string_encryption: true
      enable_symbol_obfuscation: true

  - source: "../../src/license_checker.cpp"
    output: "./obfuscated/license"
    config:
      level: 5
      all_ollvm_passes: true
      string_encryption: true
      fake_loops: 10
```

**Command:**
```bash
python -m cli.obfuscate batch batch.yaml
```

---

## Analyzing Existing Binaries

**Command:**
```bash
python -m cli.obfuscate analyze ./obfuscated/binary_name \
  --output analysis_report.json
```

**Output:**
- Binary format and architecture
- Symbol count and complexity
- Function count
- Entropy analysis
- Section information
- Estimated RE difficulty

---

## Comparing Original vs Obfuscated

**Command:**
```bash
python -m cli.obfuscate compare \
  ./baseline/simple_auth \
  ./obfuscated/simple_auth \
  --output comparison.html
```

**Output:**
- Side-by-side metrics
- Symbol reduction percentage
- Function hiding effectiveness
- Size comparison
- Entropy increase
- Security improvement score

---

## 🚨 Critical Rules

### Rule 1: String Encryption is MANDATORY

**Red Team Test Results:** 100% of binaries without string encryption were completely compromised.

```bash
# ❌ WRONG - No string encryption
python -m cli.obfuscate compile auth.c --level 3

# ✅ CORRECT - String encryption enabled
python -m cli.obfuscate compile auth.c --level 3 --string-encryption
```

**If binary contains ANY secrets:**
- Passwords
- API keys
- License keys
- Database credentials
- Encryption keys
- Internal URLs

**Then `--string-encryption` is MANDATORY!**

---

### Rule 2: Always Use Layer 1 Optimal Flags

**Test Results:** Layer 1 alone scores 70/100. Layer 2+4 without Layer 1 scores 35/100.

**Minimum flags required:**
```bash
--custom-flags "-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1"
```

**Never skip these flags!**

---

### Rule 3: Generate AND Review Reports

**Every compilation MUST generate a report:**
```bash
--report-formats "json,html"
```

**Report must include:**
- [ ] All input parameters logged
- [ ] Output file attributes (size, format, methods)
- [ ] Bogus code metrics (dead blocks, opaque predicates)
- [ ] Cycle information
- [ ] String obfuscation details
- [ ] Fake loop count

**Review checklist:**
```bash
# After compilation, verify:
cat obfuscated/report.json | jq '.string_obfuscation'
# Should show encrypted_strings > 0

strings obfuscated/binary | grep -iE "password|secret|key"
# Should return NO results
```

---

### Rule 4: Validate Binaries After Obfuscation

**Functional Test:**
```bash
# Run obfuscated binary with test inputs
./obfuscated/auth_binary "test_password"

# Verify exit codes match original
echo $?
```

**Security Test:**
```bash
# Check symbols
nm obfuscated/binary | grep -v ' U ' | wc -l
# Should be < 10

# Check secrets
strings obfuscated/binary | grep -iE "password|secret|key"
# Should be EMPTY

# Check functions (if radare2 available)
radare2 -q -c 'aaa; afl' obfuscated/binary | wc -l
# Should be reduced by 50%+
```

---

## Troubleshooting

### Issue: "LLVM pass plugin not found"

**Solution:**
```bash
# Build OLLVM plugin first
cd /Users/akashsingh/Desktop/llvm-project/build
ninja

# Verify plugin exists
ls -lh lib/LLVMObfuscationPlugin.dylib

# Use correct path in CLI
--custom-pass-plugin /Users/akashsingh/Desktop/llvm-project/build/lib/LLVMObfuscationPlugin.dylib
```

### Issue: "Symbol obfuscator failed"

**Solution:**
```bash
# Build symbol obfuscator
cd /Users/akashsingh/Desktop/llvm/symbol-obfuscator
mkdir -p build && cd build
cmake .. && make

# Verify binary exists
ls -lh /Users/akashsingh/Desktop/llvm/symbol-obfuscator/build/symbol-obfuscate

# CLI will auto-detect if in correct location
```

### Issue: "String encryption had no effect"

**Check:**
1. Does source file have string literals?
2. Are strings used in code (not just declared)?
3. Is `--string-encryption` flag actually set?

**Debug:**
```bash
# Check report
cat obfuscated/report.json | jq '.string_obfuscation'

# Should show:
# {
#   "total_strings": 10,
#   "encrypted_strings": 8,
#   "encryption_method": "xor",
#   "encryption_percentage": 80.0
# }
```

---

## Best Practices

### 1. Start Simple, Add Layers Progressively

```bash
# Stage 1: Test with minimal obfuscation
python -m cli.obfuscate compile test.c --level 1 --output stage1

# Stage 2: Add string encryption
python -m cli.obfuscate compile test.c --level 2 --string-encryption --output stage2

# Stage 3: Add symbol obfuscation
python -m cli.obfuscate compile test.c --level 3 --string-encryption --enable-symbol-obfuscation --output stage3

# Stage 4: Add OLLVM passes
python -m cli.obfuscate compile test.c --level 4 --enable-flattening --string-encryption --enable-symbol-obfuscation --output stage4
```

### 2. Use Presets for Consistency

**Define team standards:**
```bash
# Standard: For all production code
alias obf-standard='python -m cli.obfuscate compile --level 3 --string-encryption --enable-symbol-obfuscation --custom-flags "-flto -fvisibility=hidden -O3"'

# Maximum: For critical components
alias obf-maximum='python -m cli.obfuscate compile --level 4 --enable-all-passes --string-encryption --enable-symbol-obfuscation'
```

### 3. Keep Reports for Audit Trail

```bash
# Organize reports by date
mkdir -p reports/$(date +%Y-%m-%d)

python -m cli.obfuscate compile src/auth.c \
  --output obfuscated/ \
  --report-formats "json,html" \
  --output reports/$(date +%Y-%m-%d)/
```

### 4. CI/CD Integration

```bash
#!/bin/bash
# ci_obfuscate.sh

set -e

SOURCE=$1
OUTPUT=$2

# Obfuscate
python -m cli.obfuscate compile "$SOURCE" \
  --output "$OUTPUT" \
  --level 3 \
  --string-encryption \
  --enable-symbol-obfuscation \
  --report-formats "json"

# Validate
SECRETS=$(strings "$OUTPUT" | grep -iE "password|secret|key" | wc -l)
if [ "$SECRETS" -gt 0 ]; then
  echo "FAIL: Secrets found in binary"
  exit 1
fi

SYMBOLS=$(nm "$OUTPUT" | grep -v ' U ' | wc -l)
if [ "$SYMBOLS" -gt 10 ]; then
  echo "WARN: High symbol count ($SYMBOLS)"
fi

echo "SUCCESS: Binary obfuscated and validated"
```

---

## Quick Reference

### Command Structure
```
python -m cli.obfuscate <COMMAND> <SOURCE> [OPTIONS]
```

### Commands
- `compile` - Obfuscate a source file
- `analyze` - Analyze existing binary
- `compare` - Compare two binaries
- `batch` - Process multiple files

### Essential Options
```
--level <1-5>                 Obfuscation level
--string-encryption           Enable string encryption (MANDATORY for secrets!)
--enable-symbol-obfuscation   Enable symbol renaming
--enable-flattening           Enable control flow flattening (Layer 2)
--enable-substitution         Enable instruction substitution (Layer 2)
--enable-bogus-cf             Enable bogus control flow (Layer 2)
--enable-split                Enable basic block splitting (Layer 2)
--cycles <1-5>                Number of obfuscation passes
--fake-loops <0-50>           Number of fake loops to insert
--custom-flags "..."          Compiler flags (Layer 1 optimal required!)
--report-formats "json,html"  Generate reports (ALWAYS use this!)
--config-file <path>          Load configuration from file
```

---

## Summary

**Remember:**
1. ✅ **ALWAYS use CLI wrapper** - Never manual compilation
2. ✅ **ALWAYS enable string encryption** - If binary has secrets
3. ✅ **ALWAYS use Layer 1 optimal flags** - Minimum requirement
4. ✅ **ALWAYS generate reports** - For audit and validation
5. ✅ **ALWAYS validate output** - Functional + Security tests

**For any questions, refer to:**
- Full documentation: `/Users/akashsingh/Desktop/llvm/OBFUSCATION_COMPLETE.md`
- CLI help: `python -m cli.obfuscate --help`
- Examples: `cmd/llvm-obfuscator/examples/`

---

**Last Updated:** 2025-10-11
**Maintained By:** LLVM Obfuscation Team
