#!/bin/bash
# Comprehensive obfuscation measurement script
# Compares original vs obfuscated binary across ALL metrics

ORIGINAL="demo_original"
OBFUSCATED="test_ultimate"

echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║         COMPREHENSIVE OBFUSCATION METRICS MEASUREMENT                  ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"
echo ""

# Compile if needed
if [ ! -f "$ORIGINAL" ]; then
    echo "Compiling original..."
    clang src/factorial_recursive.c -o "$ORIGINAL"
fi

if [ ! -f "$OBFUSCATED" ]; then
    echo "Compiling obfuscated..."
    clang -flto -fvisibility=hidden -O3 -fno-builtin src/factorial_recursive.c -o "$OBFUSCATED"
fi

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 1: BINARY SIZE"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ORIG_SIZE=$(stat -f%z "$ORIGINAL" 2>/dev/null || stat -c%s "$ORIGINAL" 2>/dev/null)
OBFS_SIZE=$(stat -f%z "$OBFUSCATED" 2>/dev/null || stat -c%s "$OBFUSCATED" 2>/dev/null)
SIZE_DIFF=$((OBFS_SIZE - ORIG_SIZE))
SIZE_PERCENT=$(echo "scale=2; ($SIZE_DIFF * 100.0) / $ORIG_SIZE" | bc)

echo "Original:    $(printf '%8s' $ORIG_SIZE) bytes"
echo "Obfuscated:  $(printf '%8s' $OBFS_SIZE) bytes"
echo "Difference:  $(printf '%+8s' $SIZE_DIFF) bytes ($SIZE_PERCENT%)"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 2: SYMBOL COUNT"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ORIG_SYMS=$(nm "$ORIGINAL" | wc -l | tr -d ' ')
OBFS_SYMS=$(nm "$OBFUSCATED" | wc -l | tr -d ' ')
SYM_DIFF=$((OBFS_SYMS - ORIG_SYMS))
SYM_PERCENT=$(echo "scale=2; ($SYM_DIFF * 100.0) / $ORIG_SYMS" | bc)

echo "Original:    $(printf '%3s' $ORIG_SYMS) symbols"
echo "Obfuscated:  $(printf '%3s' $OBFS_SYMS) symbols"
echo "Reduction:   $(printf '%3s' ${SYM_DIFF#-}) symbols ($SYM_PERCENT%)"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 3: FUNCTION SYMBOLS (T type)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ORIG_FUNCS=$(nm "$ORIGINAL" | grep " T " | wc -l | tr -d ' ')
OBFS_FUNCS=$(nm "$OBFUSCATED" | grep " T " | wc -l | tr -d ' ')
FUNC_DIFF=$((OBFS_FUNCS - ORIG_FUNCS))
FUNC_PERCENT=$(echo "scale=2; ($FUNC_DIFF * 100.0) / $ORIG_FUNCS" | bc)

echo "Original:    $(printf '%3s' $ORIG_FUNCS) visible functions"
echo "Obfuscated:  $(printf '%3s' $OBFS_FUNCS) visible functions"
echo "Reduction:   $(printf '%3s' ${FUNC_DIFF#-}) functions ($FUNC_PERCENT%)"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 4: READABLE STRINGS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ORIG_STRS=$(strings "$ORIGINAL" | wc -l | tr -d ' ')
OBFS_STRS=$(strings "$OBFUSCATED" | wc -l | tr -d ' ')
STR_DIFF=$((OBFS_STRS - ORIG_STRS))
STR_PERCENT=$(echo "scale=2; ($STR_DIFF * 100.0) / $ORIG_STRS" | bc)

echo "Original:    $(printf '%3s' $ORIG_STRS) strings"
echo "Obfuscated:  $(printf '%3s' $OBFS_STRS) strings"
echo "Change:      $(printf '%+3s' $STR_DIFF) strings ($STR_PERCENT%)"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 5: INSTRUCTION COUNT (estimated)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ORIG_INST=$(objdump -d "$ORIGINAL" 2>/dev/null | grep -c "^\s*[0-9a-f]\+:" | tr -d ' ')
OBFS_INST=$(objdump -d "$OBFUSCATED" 2>/dev/null | grep -c "^\s*[0-9a-f]\+:" | tr -d ' ')
INST_DIFF=$((OBFS_INST - ORIG_INST))
INST_PERCENT=$(echo "scale=2; ($INST_DIFF * 100.0) / $ORIG_INST" | bc 2>/dev/null || echo "N/A")

echo "Original:    $(printf '%5s' $ORIG_INST) instructions"
echo "Obfuscated:  $(printf '%5s' $OBFS_INST) instructions"
echo "Change:      $(printf '%+5s' $INST_DIFF) instructions ($INST_PERCENT%)"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 6: SECTION ANALYSIS"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "Original sections:"
size "$ORIGINAL" 2>/dev/null | tail -1
echo ""
echo "Obfuscated sections:"
size "$OBFUSCATED" 2>/dev/null | tail -1
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 7: ENTROPY (randomness/complexity)"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
# Simple entropy calculation (higher = more random/complex)
ORIG_ENT=$(python3 << PYTHON
import math
from collections import Counter
with open("$ORIGINAL", "rb") as f:
    data = f.read()
    freq = Counter(data)
    entropy = -sum((count/len(data)) * math.log2(count/len(data)) for count in freq.values())
    print(f"{entropy:.4f}")
PYTHON
)

OBFS_ENT=$(python3 << PYTHON
import math
from collections import Counter
with open("$OBFUSCATED", "rb") as f:
    data = f.read()
    freq = Counter(data)
    entropy = -sum((count/len(data)) * math.log2(count/len(data)) for count in freq.values())
    print(f"{entropy:.4f}")
PYTHON
)

echo "Original entropy:    $ORIG_ENT bits/byte"
echo "Obfuscated entropy:  $OBFS_ENT bits/byte"
echo "(Higher entropy = more complex/random)"
echo ""

echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo "METRIC 8: CONTROL FLOW COMPLEXITY"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
ORIG_JUMPS=$(objdump -d "$ORIGINAL" 2>/dev/null | grep -c "j[a-z]" | tr -d ' ')
OBFS_JUMPS=$(objdump -d "$OBFUSCATED" 2>/dev/null | grep -c "j[a-z]" | tr -d ' ')
JUMP_DIFF=$((OBFS_JUMPS - ORIG_JUMPS))

echo "Original jump/branch instructions:    $(printf '%4s' $ORIG_JUMPS)"
echo "Obfuscated jump/branch instructions:  $(printf '%4s' $OBFS_JUMPS)"
echo "Change:                                $(printf '%+4s' $JUMP_DIFF)"
echo "(More jumps = more complex control flow)"
echo ""

echo "╔════════════════════════════════════════════════════════════════════════╗"
echo "║                        OVERALL OBFUSCATION SCORE                       ║"
echo "╚════════════════════════════════════════════════════════════════════════╝"

# Calculate weighted score
SCORE=$(python3 << PYTHON
# Weights for each metric (total = 100)
symbol_reduction = abs($SYM_PERCENT)
function_reduction = abs($FUNC_PERCENT)
size_reduction = abs($SIZE_PERCENT)

# Weighted score calculation
symbol_weight = 0.40  # 40% - most important
function_weight = 0.30  # 30% - very important  
size_weight = 0.20  # 20% - important
entropy_weight = 0.10  # 10% - bonus

# Normalize
symbol_score = min(symbol_reduction, 100) * symbol_weight
function_score = min(function_reduction, 100) * function_weight
size_score = min(size_reduction, 50) * size_weight * 2  # Cap at 50% reduction

# Entropy bonus (compare to baseline of 6.0)
entropy_bonus = (float("$OBFS_ENT") - 6.0) * 10 if float("$OBFS_ENT") > 6.0 else 0
entropy_score = min(entropy_bonus, 10) * entropy_weight

total_score = symbol_score + function_score + size_score + entropy_score

print(f"""
Symbol Reduction:     {symbol_reduction:.1f}% × 40% weight = {symbol_score:.1f} points
Function Reduction:   {function_reduction:.1f}% × 30% weight = {function_score:.1f} points
Size Reduction:       {size_reduction:.1f}% × 20% weight = {size_score:.1f} points
Entropy Bonus:        {float("$OBFS_ENT"):.2f} × 10% weight = {entropy_score:.1f} points

TOTAL OBFUSCATION SCORE: {total_score:.1f} / 100
""")

if total_score >= 80:
    level = "EXCELLENT"
elif total_score >= 60:
    level = "GOOD"
elif total_score >= 40:
    level = "MODERATE"
elif total_score >= 20:
    level = "LOW"
else:
    level = "MINIMAL"

print(f"Obfuscation Level: {level}")
PYTHON
)

echo "$SCORE"

