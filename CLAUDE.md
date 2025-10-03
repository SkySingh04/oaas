# Claude Instructions - LLVM Obfuscation Research

## 📋 CRITICAL RULE: DOCUMENTATION POLICY

**ONLY UPDATE `OBFUSCATION_RESEARCH.md` - DO NOT CREATE NEW DOCS!**

### Documentation Structure

This project has **ONLY 2 markdown files:**

1. **`README.md`** - Quick start guide (brief, points to main doc)
2. **`OBFUSCATION_RESEARCH.md`** - **THE MASTER DOCUMENT** (comprehensive, always updated)

### When Making Changes

✅ **DO:**
- Update `OBFUSCATION_RESEARCH.md` with new findings
- Keep the document current with latest results
- Add new sections to existing categories
- Update metrics in place
- Append to research journey section

❌ **DO NOT:**
- Create new .md files (BREAKTHROUGH_DISCOVERY.md, FINAL_SUMMARY.md, etc.)
- Write separate analysis documents
- Make quick reference cards
- Create phase-specific reports
- Generate comparison documents

### Exception

The ONLY acceptable new .md file is updating `README.md` if the quick start needs changes.

### Current Optimal Configuration

```bash
clang -flto -fvisibility=hidden -O3 -fno-builtin \
      -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 \
      -Wl,-s \
      source.c -o binary
```

**Score:** 82.5 / 100 (EXCELLENT) 🔥
**Status:** Validated across 150,000+ combinations + comprehensive linker/compiler test

### How to Update OBFUSCATION_RESEARCH.md

When new findings emerge:

1. **Read** the current `OBFUSCATION_RESEARCH.md`
2. **Edit** the relevant section (don't append, update in place)
3. **Update** the "Last Updated" date at top
4. **Update** metrics if they changed
5. **Add** to research journey if new phase completed

Example sections to update:
- `## 🏆 OPTIMAL CONFIGURATION` - If flags change
- `## 📊 RESULTS ACHIEVED` - If metrics improve
- `## 🎯 FLAG BREAKDOWN` - If new flags added
- `## 🚀 RESEARCH JOURNEY` - Add new phases
- `## 📈 SCORE PROGRESSION` - Update timeline

### Version Control

**Last Updated:** 2025-10-04
**Current Score:** 82.5 / 100 (EXCELLENT)
**Current Flags:** 9 flags (flto, fvisibility=hidden, O3, fno-builtin, flto=thin, fomit-frame-pointer, mspeculative-load-hardening, O1, Wl,-s)
**Status:** Optimal configuration found and validated - EXCELLENT level achieved!

### Research Phases Completed

1. ✅ Exhaustive search (150,203 combinations)
2. ✅ O3-focused investigation
3. ✅ Single flag test
4. ✅ Progressive round 1 (3 flags locked)
5. ✅ Progressive round 2 (1 flag locked)
6. ✅ External flags validation (0 improvements)
7. ✅ Comprehensive linker+compiler test (1 flag locked - BREAKTHROUGH!)

### If Score Improves

Update these sections in `OBFUSCATION_RESEARCH.md`:
- Top-level optimal command
- Results table
- Score progression table
- Flag breakdown (add new flag)
- Research journey (add new phase)
- README.md TL;DR section

### Remember

**One source of truth = OBFUSCATION_RESEARCH.md**

No exceptions. No temporary docs. No quick summaries. Just update the master document.

---

## 🔧 RULE 2: SHELL SCRIPT POLICY

**ALL .sh FILES MUST BE IN `sh/` DIRECTORY!**

### Active Scripts

- **`sh/measure_all_obfuscation_metrics.sh`** - Measure all 8 obfuscation metrics for baseline and obfuscated binaries
- **`sh/test_comprehensive_flags.sh`** - Test additional comprehensive flag combinations across all .c files in the repo

### Script Management Guidelines

✅ **DO:**
- Create all new .sh scripts in `sh/` directory
- Update existing scripts instead of creating duplicates
- Keep script names descriptive and clear
- Test scripts before committing
- Document what each script does

❌ **DO NOT:**
- Create .sh files in root directory
- Create multiple similar scripts with different names
- Keep old/unused scripts around
- Duplicate functionality across scripts

### When to Update vs Create

**UPDATE existing script if:**
- Adding new flag to test
- Improving measurement logic
- Fixing bugs in existing script
- Adding new metric to existing measurement

**CREATE new script if:**
- Completely different purpose (e.g., new optimization approach)
- Different workflow (e.g., batch testing vs single test)

### Script Organization

```
llvm/
├── sh/                                      # All shell scripts here
│   ├── measure_all_obfuscation_metrics.sh  # Metrics measurement
│   └── test_comprehensive_flags.sh         # Flag testing
├── scripts/                                 # Python tools
├── src/                                     # Source files
└── bin/                                     # Compiled binaries
```
