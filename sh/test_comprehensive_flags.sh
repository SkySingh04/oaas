#!/bin/bash
# Comprehensive flag testing on all .c files
# Tests additional flags on top of our optimal 8-flag baseline

echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║    COMPREHENSIVE FLAG TESTING - ALL .C FILES + ADDITIONAL FLAGS       ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""

# Our proven optimal 9-flag baseline (includes -Wl,-s)
BASELINE="-flto -fvisibility=hidden -O3 -fno-builtin -flto=thin -fomit-frame-pointer -mspeculative-load-hardening -O1 -Wl,-s"

# Additional individual flags from external comprehensive list
ADDITIONAL_FLAGS=(
    # Metadata removal
    "-fno-ident"
    "-g0"
    "-fmerge-constants"
    "-fmerge-all-constants"

    # Unwind table removal
    "-fno-unwind-tables"
    "-fno-asynchronous-unwind-tables"
    "-fno-unwind-tables -fno-asynchronous-unwind-tables"

    # Stack protector removal (avoids __stack_chk_fail symbols)
    "-fno-stack-protector"

    # Common symbol control
    "-fno-common"

    # Function/data sections
    "-ffunction-sections"
    "-fdata-sections"
    "-ffunction-sections -fdata-sections"
    "-ffunction-sections -fdata-sections -Wl,--gc-sections"

    # Linker flags
    "-Wl,--build-id=none"
    "-Wl,--no-export-dynamic"
    "-Wl,--icf=all"
    "-Wl,--as-needed"
    "-Wl,--gc-sections"

    # Optimization variants
    "-Ofast"

    # Visibility
    "-fvisibility-inlines-hidden"

    # Exception/RTTI removal
    "-fno-exceptions"
    "-fno-rtti"
    "-fno-exceptions -fno-rtti"
)

# Ready-made combinations to test as complete replacements
READY_COMBINATIONS=(
    # Minimal hardening
    "-O3 -flto -fvisibility=hidden -fno-ident -g0 -Wl,-s -Wl,--build-id=none"

    # Baseline (recommended)
    "-O3 -flto -fvisibility=hidden -fno-builtin -fmerge-constants -fno-ident -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -Wl,-s -Wl,--build-id=none -Wl,--as-needed"

    # Aggressive
    "-O3 -flto -fvisibility=hidden -fno-builtin -fmerge-all-constants -fno-ident -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector -fno-common -ffunction-sections -fdata-sections -Wl,-s -Wl,--gc-sections -Wl,--build-id=none -Wl,--as-needed -Wl,--icf=all"

    # Paranoid (with LLVM obfuscator plugin flags)
    "-O3 -flto -fvisibility=hidden -fno-builtin -fmerge-all-constants -fno-ident -g0 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-stack-protector -fno-common -ffunction-sections -fdata-sections -Wl,-s -Wl,--gc-sections -Wl,--build-id=none -Wl,--as-needed -Wl,--icf=all -mllvm -fla -mllvm -sub -mllvm -bcf"
)

# Test files
C_FILES=(
    "src/factorial_recursive.c"
    "src/factorial_iterative.c"
    "src/factorial_lookup.c"
)

mkdir -p bin/comprehensive_test
mkdir -p logs

echo "Baseline: $BASELINE"
echo ""
echo "Testing ${#ADDITIONAL_FLAGS[@]} additional flag combinations"
echo "Plus ${#READY_COMBINATIONS[@]} ready-made combinations"
echo "Across ${#C_FILES[@]} C files"
echo ""

TOTAL_IMPROVEMENTS=0
BEST_FLAGS=""
BEST_SCORE=0

for C_FILE in "${C_FILES[@]}"; do
    BASENAME=$(basename "$C_FILE" .c)
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Testing: $C_FILE"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    # Compile baseline for this file
    clang $BASELINE "$C_FILE" -o "bin/comprehensive_test/${BASENAME}_baseline" 2>/dev/null

    if [ ! -f "bin/comprehensive_test/${BASENAME}_baseline" ]; then
        echo "⚠️  Baseline compilation failed for $C_FILE, skipping"
        echo ""
        continue
    fi

    BASE_SYMBOLS=$(nm "bin/comprehensive_test/${BASENAME}_baseline" | wc -l | tr -d ' ')
    BASE_SIZE=$(stat -f%z "bin/comprehensive_test/${BASENAME}_baseline" 2>/dev/null || stat -c%s "bin/comprehensive_test/${BASENAME}_baseline" 2>/dev/null)
    BASE_ENTROPY=$(python3 << PYTHON
import math
from collections import Counter
with open('bin/comprehensive_test/${BASENAME}_baseline', 'rb') as f:
    data = f.read()
    freq = Counter(data)
    entropy = -sum((count/len(data)) * math.log2(count/len(data)) for count in freq.values())
    print(f"{entropy:.4f}")
PYTHON
)

    echo "Baseline for $BASENAME:"
    echo "  Symbols: $BASE_SYMBOLS"
    echo "  Size: $BASE_SIZE bytes"
    echo "  Entropy: $BASE_ENTROPY"
    echo ""

    FILE_IMPROVEMENTS=0
    FILE_BEST_FLAGS=""
    COMBO_IMPROVEMENTS=0

    # Test individual flags on top of baseline
    for i in "${!ADDITIONAL_FLAGS[@]}"; do
        FLAGS="${ADDITIONAL_FLAGS[$i]}"
        NUM=$((i + 1))

        echo "[$NUM/${#ADDITIONAL_FLAGS[@]}] Testing additional flag: $FLAGS"

        # Compile with baseline + additional flags
        clang $BASELINE $FLAGS "$C_FILE" -o "bin/comprehensive_test/${BASENAME}_test_${NUM}" 2>/dev/null

        if [ ! -f "bin/comprehensive_test/${BASENAME}_test_${NUM}" ]; then
            echo "  ⚠️  Compilation failed"
            echo ""
            continue
        fi

        # Get metrics
        TEST_SYMBOLS=$(nm "bin/comprehensive_test/${BASENAME}_test_${NUM}" | wc -l | tr -d ' ')
        TEST_SIZE=$(stat -f%z "bin/comprehensive_test/${BASENAME}_test_${NUM}" 2>/dev/null || stat -c%s "bin/comprehensive_test/${BASENAME}_test_${NUM}" 2>/dev/null)
        TEST_ENTROPY=$(python3 << PYTHON
import math
from collections import Counter
with open('bin/comprehensive_test/${BASENAME}_test_${NUM}', 'rb') as f:
    data = f.read()
    freq = Counter(data)
    entropy = -sum((count/len(data)) * math.log2(count/len(data)) for count in freq.values())
    print(f"{entropy:.4f}")
PYTHON
)

        # Calculate changes
        SYMBOL_CHANGE=$((TEST_SYMBOLS - BASE_SYMBOLS))
        SIZE_CHANGE=$((TEST_SIZE - BASE_SIZE))
        ENTROPY_CHANGE=$(python3 -c "print(f'{float('$TEST_ENTROPY') - float('$BASE_ENTROPY'):.4f}')")

        echo "  Symbols: $BASE_SYMBOLS → $TEST_SYMBOLS (Δ$SYMBOL_CHANGE)"
        echo "  Size: $BASE_SIZE → $TEST_SIZE (Δ$SIZE_CHANGE)"
        echo "  Entropy: $BASE_ENTROPY → $TEST_ENTROPY (Δ$ENTROPY_CHANGE)"

        # Check for improvements
        IMPROVED=0
        if [ $SYMBOL_CHANGE -lt 0 ]; then
            echo "  🔥 SYMBOL REDUCTION!"
            IMPROVED=1
        fi

        ENTROPY_IMPROVED=$(python3 -c "print('1' if float('$ENTROPY_CHANGE') > 0.01 else '0')")
        if [ "$ENTROPY_IMPROVED" = "1" ]; then
            echo "  🔥 ENTROPY INCREASE!"
            IMPROVED=1
        fi

        SIZE_IMPROVED=$(python3 -c "print('1' if $SIZE_CHANGE < -200 else '0')")
        if [ "$SIZE_IMPROVED" = "1" ]; then
            echo "  🔥 SIGNIFICANT SIZE REDUCTION!"
            IMPROVED=1
        fi

        if [ $IMPROVED -eq 1 ]; then
            echo "  ✅ IMPROVEMENT FOUND!"
            FILE_IMPROVEMENTS=$((FILE_IMPROVEMENTS + 1))
            TOTAL_IMPROVEMENTS=$((TOTAL_IMPROVEMENTS + 1))
            FILE_BEST_FLAGS="$FLAGS"

            # Save this improved binary
            cp "bin/comprehensive_test/${BASENAME}_test_${NUM}" "bin/comprehensive_test/${BASENAME}_improved_${FILE_IMPROVEMENTS}"
        fi

        echo ""
    done

    echo "Summary for $BASENAME: $FILE_IMPROVEMENTS improvement(s) found from individual flags"
    if [ $FILE_IMPROVEMENTS -gt 0 ]; then
        echo "  Best additional flags: $FILE_BEST_FLAGS"
    fi
    echo ""

    # Test ready-made combinations as complete replacements
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo "Testing ready-made combinations for $BASENAME"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""

    for j in "${!READY_COMBINATIONS[@]}"; do
        COMBO="${READY_COMBINATIONS[$j]}"
        COMBO_NUM=$((j + 1))

        COMBO_NAME="combo_${COMBO_NUM}"
        case $COMBO_NUM in
            1) COMBO_NAME="Minimal" ;;
            2) COMBO_NAME="Baseline" ;;
            3) COMBO_NAME="Aggressive" ;;
            4) COMBO_NAME="Paranoid" ;;
        esac

        echo "[$COMBO_NUM/${#READY_COMBINATIONS[@]}] Testing $COMBO_NAME combination"

        # Compile with ready-made combination
        clang $COMBO "$C_FILE" -o "bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}" 2>/dev/null

        if [ ! -f "bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}" ]; then
            echo "  ⚠️  Compilation failed"
            echo ""
            continue
        fi

        # Get metrics
        COMBO_SYMBOLS=$(nm "bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}" | wc -l | tr -d ' ')
        COMBO_SIZE=$(stat -f%z "bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}" 2>/dev/null || stat -c%s "bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}" 2>/dev/null)
        COMBO_ENTROPY=$(python3 << PYTHON
import math
from collections import Counter
with open('bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}', 'rb') as f:
    data = f.read()
    freq = Counter(data)
    entropy = -sum((count/len(data)) * math.log2(count/len(data)) for count in freq.values())
    print(f"{entropy:.4f}")
PYTHON
)

        # Calculate changes vs baseline
        COMBO_SYMBOL_CHANGE=$((COMBO_SYMBOLS - BASE_SYMBOLS))
        COMBO_SIZE_CHANGE=$((COMBO_SIZE - BASE_SIZE))
        COMBO_ENTROPY_CHANGE=$(python3 -c "print(f'{float('$COMBO_ENTROPY') - float('$BASE_ENTROPY'):.4f}')")

        echo "  Symbols: $BASE_SYMBOLS → $COMBO_SYMBOLS (Δ$COMBO_SYMBOL_CHANGE)"
        echo "  Size: $BASE_SIZE → $COMBO_SIZE (Δ$COMBO_SIZE_CHANGE)"
        echo "  Entropy: $BASE_ENTROPY → $COMBO_ENTROPY (Δ$COMBO_ENTROPY_CHANGE)"

        # Check for improvements
        COMBO_IMPROVED=0
        if [ $COMBO_SYMBOL_CHANGE -lt 0 ]; then
            echo "  🔥 SYMBOL REDUCTION!"
            COMBO_IMPROVED=1
        fi

        COMBO_ENTROPY_IMPROVED=$(python3 -c "print('1' if float('$COMBO_ENTROPY_CHANGE') > 0.01 else '0')")
        if [ "$COMBO_ENTROPY_IMPROVED" = "1" ]; then
            echo "  🔥 ENTROPY INCREASE!"
            COMBO_IMPROVED=1
        fi

        COMBO_SIZE_IMPROVED=$(python3 -c "print('1' if $COMBO_SIZE_CHANGE < -200 else '0')")
        if [ "$COMBO_SIZE_IMPROVED" = "1" ]; then
            echo "  🔥 SIGNIFICANT SIZE REDUCTION!"
            COMBO_IMPROVED=1
        fi

        if [ $COMBO_IMPROVED -eq 1 ]; then
            echo "  ✅ COMBINATION IMPROVEMENT FOUND!"
            COMBO_IMPROVEMENTS=$((COMBO_IMPROVEMENTS + 1))
            TOTAL_IMPROVEMENTS=$((TOTAL_IMPROVEMENTS + 1))

            # Save this improved binary
            cp "bin/comprehensive_test/${BASENAME}_combo_${COMBO_NUM}" "bin/comprehensive_test/${BASENAME}_combo_improved_${COMBO_IMPROVEMENTS}"
        fi

        echo ""
    done

    echo "Summary for $BASENAME combinations: $COMBO_IMPROVEMENTS improvement(s) found"
    echo ""
done

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "COMPREHENSIVE TEST COMPLETE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "Total improvements found: $TOTAL_IMPROVEMENTS"
echo ""

if [ $TOTAL_IMPROVEMENTS -gt 0 ]; then
    echo "🎉 Found $TOTAL_IMPROVEMENTS improvement(s)!"
    echo ""
    echo "Check bin/comprehensive_test/*_improved_* for improved binaries"
    echo ""
    echo "Review logs/comprehensive_test.log for details"
else
    echo "✅ No improvements found across all files"
    echo "Current 9-flag configuration remains optimal!"
fi

echo ""
