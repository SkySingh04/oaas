# Claude Instructions - LLVM Obfuscation Research

## 📋 CRITICAL RULE: DOCUMENTATION POLICY

**SINGLE SOURCE OF TRUTH FOR CUSTOM OBFUSCATIONS**

### Documentation Structure

This project has **4 core markdown files:**

1. **`README.md`** - Quick start guide (points to other docs)
2. **`OBFUSCATION_RESEARCH.md`** - Modern LLVM flags research (82.5/100 score - COMPLETE)
3. **`OLLVM_RESEARCH.md`** - OLLVM passes research (4 passes ported - COMPLETE)
4. **`CUSTOM_OBFUSCATION.md`** - **ALL custom obfuscation research (MASTER DOC)** ⭐

### When Making Changes

✅ **DO:**
- **Update `CUSTOM_OBFUSCATION.md`** for ANY new custom obfuscation work
- Update `OBFUSCATION_RESEARCH.md` ONLY if modern LLVM flags change
- Update `OLLVM_RESEARCH.md` ONLY if OLLVM passes change
- Keep documents current with latest results
- Update metrics and tables in place
- Append to progress/research notes sections

❌ **DO NOT:**
- Create new .md files (BREAKTHROUGH_DISCOVERY.md, IMPLEMENTATION_SUMMARY.md, etc.)
- Write separate analysis documents in targeted-obfuscator/
- Make quick reference cards
- Create phase-specific reports
- Generate comparison documents
- Create documentation in subdirectories

### Custom Obfuscation Master Doc

**`CUSTOM_OBFUSCATION.md`** is the single source of truth for:
- Targeted function obfuscation (targeted-obfuscator/)
- Integration strategies (combining all layers)
- Proof of obfuscation (real binary analysis)
- Functional equivalence testing
- Security improvements
- Performance overhead analysis
- Usage examples and guides
- Research notes and learnings

### When to Update CUSTOM_OBFUSCATION.md

**ALWAYS update this file when:**
1. Adding new obfuscation techniques to targeted-obfuscator/
2. Improving existing transforms (string encryption, CFG flattening, etc.)
3. Creating new integration scripts
4. Proving obfuscation works (binary analysis)
5. Measuring security/performance impact
6. Discovering new insights about obfuscation
7. Creating new examples or test cases
8. Updating tool usage or CLI commands

**Key sections to update:**
- `## Obfuscation Layers` - Add new layers or improve existing
- `## Proven Results` - Add new proof or measurements
- `## Integration Guide` - Update integration methods
- `## Usage Examples` - Add new examples
- `## Tool Reference` - Update tool documentation
- `## Research Notes` - Append discoveries and learnings

---

## 🏗️ Current Project Status

### Layer 1: Modern LLVM Flags (COMPLETE)
**File:** `OBFUSCATION_RESEARCH.md`
**Score:** 82.5/100 (EXCELLENT)
**Configuration:**
```bash
clang -flto -fvisibility=hidden -O3 -fno-builtin \
      -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 \
      -Wl,-s \
      source.c -o binary
```
**Status:** Optimal configuration found (150,000+ combinations tested)

### Layer 2: OLLVM Passes (COMPLETE)
**File:** `OLLVM_RESEARCH.md`
**Status:** All 4 passes ported to modern LLVM 19
**Passes:** flattening, substitution, boguscf, split
**Plugin:** `llvm-project/build/lib/LLVMObfuscationPlugin.dylib`
**Conclusion:** Modern compiler optimizations supersede OLLVM

### Layer 3: Targeted Function Obfuscation (COMPLETE)
**File:** `CUSTOM_OBFUSCATION.md`
**Location:** `targeted-obfuscator/`
**Status:** All 4 sub-layers implemented and proven
**Sub-layers:**
1. String & constant encryption (~2% overhead)
2. Control flow flattening (~5% overhead)
3. Opaque predicates (~3% overhead)
4. VM virtualization (10-50x overhead)

**Proven Results:**
- ✅ Obfuscation works (not hallucinated) - Binary analysis proof
- ✅ Functional equivalence maintained - 100% test pass rate
- ✅ Integration works - All 3 layers combine successfully
- ✅ ULTIMATE binary tested - Source + OLLVM + Modern flags

---

## 🔧 RULE 2: SHELL SCRIPT POLICY

**ALL .sh FILES MUST BE IN `sh/` DIRECTORY!**

### Active Scripts

**Measurement:**
- `sh/measure_all_obfuscation_metrics.sh` - Measure all 8 obfuscation metrics

**Testing:**
- `sh/test_comprehensive_flags.sh` - Test flag combinations

**Integration:**
- `targeted-obfuscator/integrate_with_ollvm.sh` - Multi-layer obfuscation pipeline
- `targeted-obfuscator/test_system.sh` - Test targeted obfuscator

### Script Management Guidelines

✅ **DO:**
- Create all new .sh scripts in `sh/` directory (except tool-specific scripts in targeted-obfuscator/)
- Update existing scripts instead of creating duplicates
- Keep script names descriptive and clear
- Test scripts before committing
- Document what each script does

❌ **DO NOT:**
- Create .sh files in root directory (except README-related)
- Create multiple similar scripts with different names
- Keep old/unused scripts around
- Duplicate functionality across scripts

---

## 🎯 Research Workflow

### Starting New Custom Obfuscation Research

1. **Read** `CUSTOM_OBFUSCATION.md` to understand existing work
2. **Design** new obfuscation technique or improvement
3. **Implement** in `targeted-obfuscator/` subdirectory
4. **Test** functionality and measure impact
5. **Prove** it works with real binary analysis
6. **Document** in `CUSTOM_OBFUSCATION.md` (append to relevant sections)
7. **Commit** with clear message

### Adding New Obfuscation Layer

**Example: Adding Layer 3.5 - Constant Folding Obfuscation**

1. Create implementation: `targeted-obfuscator/transforms/constant_folder.py`
2. Add CLI support in `targeted-obfuscator/protect_functions.py`
3. Test on examples: `targeted-obfuscator/examples/`
4. Measure impact with profiler
5. Update `CUSTOM_OBFUSCATION.md`:
   - Add to "## Obfuscation Layers" section
   - Add usage example to "## Usage Examples"
   - Document tool in "## Tool Reference"
   - Append discovery to "## Research Notes"

### Improving Existing Layer

**Example: Improving String Encryption**

1. Modify `targeted-obfuscator/transforms/string_encryptor.py`
2. Test improvements
3. Measure new performance/security metrics
4. Update `CUSTOM_OBFUSCATION.md`:
   - Update layer description in "## Obfuscation Layers"
   - Update metrics in "## Proven Results"
   - Add note in "## Research Notes"

---

## 📊 Measurement Policy

### Always Measure

When adding/modifying obfuscation:

1. **Binary Analysis:**
   - `strings` output (password/keys visible?)
   - `nm` symbol count
   - `hexdump` for encrypted data
   - Shannon entropy calculation

2. **Functional Equivalence:**
   - Test with correct inputs (should work)
   - Test with incorrect inputs (should fail)
   - Test edge cases (empty, NULL, etc.)
   - Compare exit codes with baseline

3. **Performance Impact:**
   - Execution time (ms)
   - Memory usage (KB)
   - Binary size (bytes)
   - CPU cycles (estimated)

4. **Security Improvement:**
   - Symbol reduction (%)
   - String hiding (count)
   - Entropy increase (%)
   - Estimated RE time multiplier

### Document Results

Add proof to `CUSTOM_OBFUSCATION.md` in "## Proven Results" section with:
- Before/after comparison table
- Test output (command + results)
- Verdict (✓ PASS / ✗ FAIL)

---

## 🚀 Integration Strategy

### Recommended Production Configuration

**For most applications:**
```bash
# 1. Source-level targeted obfuscation (2-5 critical functions)
python3 targeted-obfuscator/protect_functions.py harden source.c \
    --functions critical_func1,critical_func2 \
    --max-level 3 \
    --output protected.c

# 2. Compile with modern LLVM flags
clang -flto -fvisibility=hidden -O3 -fno-builtin \
      -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 \
      protected.c -o binary -Wl,-s

# 3. Strip symbols
strip binary
```

**For maximum security (if performance allows):**
```bash
# Use integrate_with_ollvm.sh (adds OLLVM passes)
./targeted-obfuscator/integrate_with_ollvm.sh source.c critical_func 3 ultimate_binary
```

This applies:
1. ✓ Source-level targeted obfuscation
2. ✓ OLLVM passes (flattening, substitution, boguscf, split)
3. ✓ Modern LLVM flags
4. ✓ Symbol stripping

---

## 📁 Project Structure Reference

```
llvm/
├── README.md                        # Quick start
├── OBFUSCATION_RESEARCH.md          # Layer 1: Modern flags (82.5/100)
├── OLLVM_RESEARCH.md                # Layer 2: OLLVM passes (4 passes)
├── CUSTOM_OBFUSCATION.md            # Layer 3: Targeted obfuscation (MASTER) ⭐
├── CLAUDE.md                        # This file (instructions)
│
├── sh/                              # Shell scripts
│   ├── measure_all_obfuscation_metrics.sh
│   └── test_comprehensive_flags.sh
│
├── scripts/                         # Python automation tools
│   ├── progressive_flag_optimizer.py
│   └── exhaustive_flag_optimizer.py
│
├── src/                             # Test source files
│   └── *.c
│
├── bin/                             # Compiled binaries
│   └── *_baseline, *_obfuscated
│
├── llvm-project/                    # LLVM source + OLLVM plugin
│   └── build/lib/LLVMObfuscationPlugin.dylib
│
└── targeted-obfuscator/             # Layer 3 implementation
    ├── protect_functions.py         # Main CLI
    ├── integrate_with_ollvm.sh      # Integration script
    ├── test_system.sh               # Test suite
    ├── analyzer/                    # Critical function detection
    ├── transforms/                  # 4 obfuscation transforms
    ├── vm/                          # VM virtualization
    ├── metrics/                     # Profiler
    ├── config/                      # YAML schemas
    └── examples/                    # Test cases
```

---

## ⚠️ Important Reminders

1. **ONE MASTER DOC:** `CUSTOM_OBFUSCATION.md` for all custom obfuscation work
2. **NO NEW DOCS:** Never create separate markdown files
3. **ALWAYS PROVE:** Show real binary analysis, not just claims
4. **TEST EQUIVALENCE:** Verify obfuscated binary works identically
5. **MEASURE IMPACT:** Quantify security gain and performance overhead
6. **SCRIPTS IN sh/:** All shell scripts in `sh/` directory
7. **UPDATE IN PLACE:** Modify existing docs, don't create new ones

---

**Last Updated:** 2025-10-07
**Project Status:** All 3 obfuscation layers complete and integrated
**Master Documentation:** `CUSTOM_OBFUSCATION.md`
