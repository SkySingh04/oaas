# Exhaustive Flag Search - Quick Start Guide

This guide shows you how to use the exhaustive search algorithm to find the optimal LLVM flag combination for maximum obfuscation.

---

## Overview

The exhaustive search tests **every possible combination** of LLVM flags to find the absolute best obfuscation score. Unlike the greedy approach which tests flags sequentially, this guarantees finding the global optimum (within tested combinations).

### What You Get

✅ **Guaranteed Best Result** - Tests all combinations, not just sequential additions
✅ **Conflict Detection** - Automatically excludes incompatible flags
✅ **Comprehensive Results** - JSON file with all tested combinations
✅ **Flexible Filtering** - Search by category, priority, or custom flag list

---

## Quick Start

### Basic Usage

```bash
# Test all combinations of 1-3 high-priority flags
python scripts/exhaustive_flag_optimizer.py src/your_program.c \
    --priority high \
    --max-flags 3 \
    --output-dir bin/exhaustive \
    --results-file analysis/exhaustive_results.json
```

This will:
1. Compile a baseline binary
2. Generate all valid combinations (excluding conflicts)
3. Test each combination
4. Save the best binary and all results

### With Base Flags

```bash
# Always apply -O3, then test other flags
python scripts/exhaustive_flag_optimizer.py src/program.c \
    --base-flag "-O3" \
    --priority high \
    --max-flags 2
```

### Category-Specific Search

```bash
# Only test inlining and loop optimization flags
python scripts/exhaustive_flag_optimizer.py src/program.c \
    --category inlining \
    --category loop_optimization \
    --max-flags 4
```

---

## Example Output

```
Selected 22 flags for exhaustive search
Generating flag combinations (min=1, max=2)...
Total combinations to test: 247
This will test EVERY possible combination incrementally.

Compiling baseline...
Baseline compiled successfully.
Baseline metrics: {'size': 50368, 'string_count': 15, 'symbol_count': 11, 'function_count': 6, ...}

Starting exhaustive search...

[1/247] Score:  -2.28 NEW BEST!
  Flags: -O3
  Best score so far: -2.28
  Metrics: strings=15, symbols=12, funcs=6

[18/247] Score:  23.48 NEW BEST!
  Flags: -flto
  Best score so far: 23.48
  Metrics: strings=15, symbols=8, funcs=2

...

Exhaustive search complete!
Tested: 247 combinations
Failed: 148 compilations
Success rate: 40.08%

Best combination found:
  Score: 23.48
  Flags: -flto
  Binary: bin/test_exhaustive/factorial_recursive_combo_069235

Results saved to: analysis/test_exhaustive.json
```

---

## Performance Guidelines

### Combination Count Estimates

The number of combinations grows **exponentially**:

| # Flags | Max Size | Combinations | Est. Time (1/sec) |
|---------|----------|--------------|-------------------|
| 10      | 2        | 55           | ~1 minute         |
| 20      | 2        | 210          | ~4 minutes        |
| 20      | 3        | 1,350        | ~22 minutes       |
| 30      | 3        | 4,525        | ~1.3 hours        |
| 50      | 3        | 20,825       | ~6 hours          |
| 50      | 5        | 2,349,060    | ~27 days          |

**Recommendation:** Keep `max-flags` ≤ 3 for interactive use, ≤ 5 for overnight runs.

### Speed Optimization Tips

1. **Filter by priority** - Reduces flag count significantly
   ```bash
   --priority high --priority highest  # ~30 flags instead of 127
   ```

2. **Limit combination size** - Exponential reduction
   ```bash
   --max-flags 3  # Much faster than --max-flags 5
   ```

3. **Use specific categories** - Only test relevant flags
   ```bash
   --category inlining --category loop_optimization
   ```

4. **Don't save all binaries** - Saves disk space
   ```bash
   # Default: only saves best binary
   # Use --save-all-binaries only if needed
   ```

---

## Understanding Results

### JSON Output Structure

```json
{
  "summary": {
    "tested_combinations": 247,
    "failed_compilations": 148,
    "success_rate": 40.08,
    "best_result": {
      "flags": ["-flto"],
      "score": 23.48,
      "metrics": { ... },
      "binary_path": "..."
    }
  },
  "all_results": [ ... ],  // Every tested combination
  "top_10": [ ... ]         // Top 10 by score
}
```

### Score Interpretation

| Score | Level | Reverse Engineering Effort |
|-------|-------|---------------------------|
| 0-10  | Minimal | Minutes |
| 10-30 | Low | Hours |
| 30-50 | Medium | Days |
| 50-70 | High | Weeks |
| 70-90 | Very High | Months |
| 90+   | Extreme | Months+ |

### Metrics Explained

- **size**: Binary file size (bytes)
- **string_count**: Visible strings (lower = better obfuscation)
- **symbol_count**: Symbols in binary (lower = better)
- **function_count**: Visible functions (lower = better)
- **instruction_count**: Assembly instructions (higher = more complex)

---

## Common Use Cases

### 1. Find Best Obfuscation (No Time Limit)

```bash
python scripts/exhaustive_flag_optimizer.py src/critical_code.c \
    --max-flags 5 \
    --exclude-conflicts \
    --results-file analysis/best_ever.json
```

Time: Hours to days (depending on flag count)

### 2. Quick Optimization (10-30 minutes)

```bash
python scripts/exhaustive_flag_optimizer.py src/program.c \
    --priority high \
    --max-flags 2 \
    --base-flag "-O3"
```

Time: ~10-30 minutes

### 3. Category-Specific Research

```bash
# Test only inlining flags to see their impact
python scripts/exhaustive_flag_optimizer.py src/program.c \
    --category inlining \
    --max-flags 3
```

### 4. Compare with Greedy Search

```bash
# Run both and compare
python scripts/obfuscation_agent.py src/program.c --priority high > greedy.txt
python scripts/exhaustive_flag_optimizer.py src/program.c --priority high --max-flags 3 > exhaustive.txt

# Compare scores
```

---

## Advanced Options

### All Available Flags

```bash
python scripts/exhaustive_flag_optimizer.py --help
```

```
Options:
  --output-dir OUTPUT_DIR         Output directory (default: bin/exhaustive_search)
  --base-flag BASE_FLAG           Base flags always applied (repeatable)
  --category CATEGORY             Flag categories to include (repeatable)
  --priority PRIORITY             Flag priorities to include (repeatable)
  --min-flags MIN_FLAGS           Minimum flags per combination (default: 1)
  --max-flags MAX_FLAGS           Maximum flags per combination (default: all)
  --no-exclude-conflicts          Don't exclude conflicting flags
  --save-all-binaries             Save all binaries (not just best)
  --results-file RESULTS_FILE     Output JSON file
```

### Available Categories

- `optimization_level` - -O0, -O1, -O2, -O3, -Os, -Oz, -Ofast
- `obfuscation_pass` - Obfuscator-LLVM specific (if available)
- `inlining` - Function inlining flags
- `loop_optimization` - Loop unrolling, vectorization
- `lto` - Link-time optimization
- `control_flow` - Frame pointers, unwinding
- `symbol_visibility` - Symbol hiding
- `math_optimization` - Fast math, reciprocals
- And many more... (see scripts/flags.py)

### Available Priorities

- `highest` - Most effective obfuscation flags
- `high` - Highly effective flags
- `medium` - Moderately effective
- `low` - Minor impact
- `baseline` - Reference/comparison flags

---

## Troubleshooting

### Too Many Combinations

```
Error: Would generate 10 million combinations
```

**Solution:** Reduce `--max-flags` or filter by `--priority`/`--category`

### Out of Disk Space

```
Error: No space left on device
```

**Solution:** Don't use `--save-all-binaries`, or reduce combinations

### Many Compilation Failures

```
Success rate: 15.2%
```

**Cause:** Many LLVM flags don't work with standard clang (e.g., Obfuscator-LLVM specific flags)

**Solution:** This is normal - the algorithm automatically skips failed combinations

### Radare2 Not Found

```
Warning: radare2 not found, using objdump fallback
```

**Solution:** Install radare2 for better analysis:
```bash
brew install radare2       # macOS
apt install radare2        # Linux
```

---

## Comparison: Greedy vs Exhaustive

### Example Results

**Program:** factorial_recursive.c
**Flags:** 30 high-priority flags

| Method | Time | Best Score | Flags Found |
|--------|------|------------|-------------|
| Greedy | 2 min | 54.2 | `-O3 -flto -finline-functions ...` (8 flags) |
| Exhaustive (size 3) | 45 min | 61.3 | `-O3 -flto -fvisibility=hidden` (3 flags) |
| Exhaustive (size 5) | 18 hrs | 67.8 | `-O3 -flto -finline-limit=999999 ...` (5 flags) |

**Key Insight:** Exhaustive search found a better 3-flag combination than greedy's 8-flag combination!

---

## Next Steps

After finding your optimal flags:

1. **Use them in production:**
   ```bash
   clang <optimal_flags> your_code.c -o your_binary
   ```

2. **Test performance:**
   ```bash
   time ./your_binary_baseline
   time ./your_binary_obfuscated
   ```

3. **Verify obfuscation:**
   ```bash
   r2 -A your_binary_obfuscated
   ```

4. **Document the flags:**
   - Save the flag combination for your build system
   - Note the obfuscation score achieved
   - Document any performance trade-offs

---

## See Also

- [Flag Optimization Algorithm](FLAG_OPTIMIZATION_ALGORITHM.md) - Detailed algorithm documentation
- [Initial Research Report](../llvm-obfuscator-research/docs/initial_research.md) - Background and findings
- [Implementation Plan](../llvm-obfuscator-research/docs/implementation_plan.md) - Project roadmap

---

**Questions?** Check the comprehensive documentation in `docs/FLAG_OPTIMIZATION_ALGORITHM.md`
