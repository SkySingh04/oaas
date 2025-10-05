# Claude Instructions - LLVM Obfuscation Research

## 📋 CRITICAL RULE: DOCUMENTATION POLICY

**UPDATE DESIGNATED RESEARCH DOCS ONLY - DO NOT CREATE NEW DOCS!**

### Documentation Structure

This project has **3 markdown files:**

1. **`README.md`** - Quick start guide (brief, points to main docs)
2. **`OBFUSCATION_RESEARCH.md`** - Modern LLVM flags research (COMPLETE - 82.5 score)
3. **`OLLVM_RESEARCH.md`** - OLLVM obfuscation passes research (**ACTIVE - UPDATE THIS**)

### When Making Changes

✅ **DO:**
- Update `OLLVM_RESEARCH.md` with OLLVM findings (currently active)
- Update `OBFUSCATION_RESEARCH.md` if modern LLVM flags change
- Keep documents current with latest results
- Update metrics and tables in place
- Append to progress log sections

❌ **DO NOT:**
- Create new .md files (BREAKTHROUGH_DISCOVERY.md, FINAL_SUMMARY.md, OLLVM_FINAL.md, etc.)
- Write separate analysis documents
- Make quick reference cards
- Create phase-specific reports
- Generate comparison documents

### Current Research Focus

**ACTIVE:** `OLLVM_RESEARCH.md` - Testing OLLVM obfuscation passes
- Goal: Exceed 82.5 baseline score
- Phases: Standalone → Combined → Extracted → Radare2 testing

### Current Optimal Configuration

```bash
clang -flto -fvisibility=hidden -O3 -fno-builtin \
      -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 \
      -Wl,-s \
      source.c -o binary
```

**Score:** 82.5 / 100 (EXCELLENT) 🔥
**Status:** Validated across 150,000+ combinations + comprehensive linker/compiler test

### How to Update OLLVM_RESEARCH.md (ACTIVE)

When new findings emerge:

1. **Read** the current `OLLVM_RESEARCH.md`
2. **Check off** completed todos in Phase sections
3. **Fill in** results tables with scores/metrics
4. **Update** "Last Updated" date at top
5. **Append** to "Progress Log" section

Key sections to update:
- `## 📋 RESEARCH PLAN & TODOS` - Check off completed items
- `## 📊 RESULTS TRACKING` - Fill in measurement tables
- `## 🔧 BUILD STATUS` - Document build progress/issues
- `## 📝 PROGRESS LOG` - Add dated entries for each session
- `## 🎯 SUCCESS CRITERIA` - Track completion status

### How to Update OBFUSCATION_RESEARCH.md (if needed)

Only update if OLLVM research discovers better modern LLVM flags:

- `## 🏆 OPTIMAL CONFIGURATION` - If flags change
- `## 📊 RESULTS ACHIEVED` - If metrics improve
- `## 🚀 RESEARCH JOURNEY` - Add Phase 9: OLLVM Integration

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
