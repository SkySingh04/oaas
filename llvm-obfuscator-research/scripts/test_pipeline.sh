#!/bin/bash
#
# Automated Testing Pipeline
# Runs all obfuscation tests and generates comprehensive report
#

set -e  # Exit on error

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

echo "========================================"
echo "LLVM Obfuscation Testing Pipeline"
echo "========================================"
echo "Project root: $PROJECT_ROOT"
echo "Timestamp: $(date)"
echo ""

# Check dependencies
echo "Checking dependencies..."
command -v clang >/dev/null 2>&1 || { echo "Error: clang not found"; exit 1; }
command -v python3 >/dev/null 2>&1 || { echo "Error: python3 not found"; exit 1; }
command -v objdump >/dev/null 2>&1 || { echo "Error: objdump not found"; exit 1; }
command -v nm >/dev/null 2>&1 || { echo "Error: nm not found"; exit 1; }
echo "✓ All dependencies found"
echo ""

# Clean previous results (optional)
read -p "Clean previous results? (y/N) " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Cleaning previous results..."
    rm -rf bin/* ir/* asm/* analysis/*
    echo "✓ Cleaned"
    echo ""
fi

# Step 1: Test LLVM flags
echo "========================================"
echo "Step 1: Testing LLVM Compilation Flags"
echo "========================================"
python3 scripts/test_llvm_flags.py
echo ""

# Step 2: Analyze LLVM IR
echo "========================================"
echo "Step 2: Analyzing LLVM IR"
echo "========================================"
python3 scripts/analyze_ir.py
echo ""

# Step 3: Decompilation analysis
echo "========================================"
echo "Step 3: Decompilation Analysis"
echo "========================================"
python3 scripts/decompilation_test.py
echo ""

# Step 4: String obfuscation experiment
echo "========================================"
echo "Step 4: String Obfuscation Experiment"
echo "========================================"
python3 scripts/string_obfuscator.py
echo ""

# Step 5: Functional equivalence testing
echo "========================================"
echo "Step 5: Functional Equivalence Testing"
echo "========================================"
echo "Testing all binaries produce correct factorial values..."

# Create test results directory
mkdir -p analysis/functional_tests

FAILED_TESTS=0
PASSED_TESTS=0

# Test values
TEST_VALUES=(1 5 10 15)
EXPECTED_VALUES=(1 120 3628800 1307674368000)

# Find all binaries
for binary in bin/*; do
    if [ -f "$binary" ] && [ -x "$binary" ]; then
        binary_name=$(basename "$binary")
        echo -n "Testing $binary_name... "

        BINARY_FAILED=0

        for i in "${!TEST_VALUES[@]}"; do
            val=${TEST_VALUES[$i]}
            expected=${EXPECTED_VALUES[$i]}

            output=$("$binary" "$val" 2>&1 || echo "CRASHED")

            if [[ "$output" == *"$expected"* ]]; then
                : # Test passed
            else
                echo "FAILED (input=$val, expected=$expected)"
                echo "$binary_name failed on input $val" >> analysis/functional_tests/failures.txt
                BINARY_FAILED=1
                FAILED_TESTS=$((FAILED_TESTS + 1))
                break
            fi
        done

        if [ $BINARY_FAILED -eq 0 ]; then
            echo "✓ PASSED"
            PASSED_TESTS=$((PASSED_TESTS + 1))
        fi
    fi
done

echo ""
echo "Functional test results:"
echo "  Passed: $PASSED_TESTS"
echo "  Failed: $FAILED_TESTS"
echo ""

# Step 6: Generate summary report
echo "========================================"
echo "Step 6: Generating Summary Report"
echo "========================================"

REPORT_FILE="analysis/pipeline_report_$(date +%Y%m%d_%H%M%S).txt"

cat > "$REPORT_FILE" << EOF
LLVM Obfuscation Research - Pipeline Report
============================================
Generated: $(date)
Project: LLVM Obfuscator Research

SUMMARY
-------
Test Programs: 3 (factorial_recursive, factorial_iterative, factorial_lookup)
Flag Combinations Tested: 15
Functional Tests Passed: $PASSED_TESTS
Functional Tests Failed: $FAILED_TESTS

ARTIFACTS GENERATED
-------------------
EOF

echo "Source Files:" >> "$REPORT_FILE"
ls -lh src/*.c >> "$REPORT_FILE" 2>/dev/null || echo "  None" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Binaries Generated:" >> "$REPORT_FILE"
ls -1 bin/ | wc -l >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "IR Files Generated:" >> "$REPORT_FILE"
ls -1 ir/ | wc -l >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Assembly Files Generated:" >> "$REPORT_FILE"
ls -1 asm/ | wc -l >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "Analysis Files:" >> "$REPORT_FILE"
ls -lh analysis/*.{csv,json} 2>/dev/null | tail -10 >> "$REPORT_FILE" || echo "  None" >> "$REPORT_FILE"

echo "" >> "$REPORT_FILE"
echo "ANALYSIS RESULTS" >> "$REPORT_FILE"
echo "----------------" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

# Find latest CSV results
LATEST_FLAG_CSV=$(ls -t analysis/flag_test_results_*.csv 2>/dev/null | head -1)
if [ -n "$LATEST_FLAG_CSV" ]; then
    echo "Top 5 Obfuscation Configurations (by score):" >> "$REPORT_FILE"
    head -1 "$LATEST_FLAG_CSV" >> "$REPORT_FILE"
    tail -n +2 "$LATEST_FLAG_CSV" | sort -t',' -k15 -nr | head -5 >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
fi

LATEST_DECOMP_CSV=$(ls -t analysis/decompilation_summary_*.csv 2>/dev/null | head -1)
if [ -n "$LATEST_DECOMP_CSV" ]; then
    echo "Top 5 Hardest to Reverse (by readability score):" >> "$REPORT_FILE"
    head -1 "$LATEST_DECOMP_CSV" >> "$REPORT_FILE"
    tail -n +2 "$LATEST_DECOMP_CSV" | sort -t',' -k9 -nr | head -5 >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
fi

echo "RECOMMENDATIONS" >> "$REPORT_FILE"
echo "---------------" >> "$REPORT_FILE"
echo "1. Review flag_test_results CSV for best obfuscation/performance balance" >> "$REPORT_FILE"
echo "2. Examine IR analysis to understand optimization impact" >> "$REPORT_FILE"
echo "3. Check decompilation results for reverse engineering difficulty" >> "$REPORT_FILE"
echo "4. Test string obfuscation effectiveness" >> "$REPORT_FILE"
echo "5. Develop custom LLVM passes for advanced obfuscation" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "NEXT STEPS" >> "$REPORT_FILE"
echo "----------" >> "$REPORT_FILE"
echo "1. Implement control flow flattening pass" >> "$REPORT_FILE"
echo "2. Add bogus control flow injection" >> "$REPORT_FILE"
echo "3. Develop instruction substitution pass" >> "$REPORT_FILE"
echo "4. Create opaque predicate insertion" >> "$REPORT_FILE"
echo "5. Build integrated obfuscation tool" >> "$REPORT_FILE"

echo "✓ Report generated: $REPORT_FILE"
echo ""

# Display report
echo "========================================"
echo "PIPELINE SUMMARY"
echo "========================================"
cat "$REPORT_FILE"
echo ""

echo "========================================"
echo "Pipeline Complete!"
echo "========================================"
echo "All results saved to: $PROJECT_ROOT/analysis/"
echo "Summary report: $REPORT_FILE"
echo ""
echo "To visualize results, run:"
echo "  python3 scripts/visualize_results.py"
echo ""
