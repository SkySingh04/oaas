#!/bin/bash

###############################################################################
# Radare2 Binary Analysis Script
#
# This script demonstrates what information can be extracted from binaries
# using radare2, showcasing the importance of obfuscation.
#
# Usage: ./sh/radare2_analysis.sh <binary_path>
###############################################################################

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
MAGENTA='\033[0;35m'
NC='\033[0m' # No Color

if [ -z "$1" ]; then
    echo -e "${RED}Usage: $0 <binary_path>${NC}"
    echo ""
    echo "Example: $0 bin/ultimate/authentication_system_baseline"
    exit 1
fi

BINARY="$1"

if [ ! -f "$BINARY" ]; then
    echo -e "${RED}Error: Binary not found: $BINARY${NC}"
    exit 1
fi

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║       Radare2 Binary Analysis - Security Assessment       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${CYAN}Target Binary:${NC} $BINARY"
echo -e "${CYAN}File Size:${NC} $(ls -lh "$BINARY" | awk '{print $5}')"
echo ""

echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[1] Extracting Sensitive Strings${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${MAGENTA}Searching for: passwords, keys, secrets, tokens, database, admin${NC}"
echo ""

r2 -q -c 'iz | grep -iE "(password|secret|key|token|database|admin|credential)"' "$BINARY" 2>/dev/null | head -30

if [ $? -ne 0 ] || [ -z "$(r2 -q -c 'iz | grep -iE "(password|secret|key|token|database|admin)"' "$BINARY" 2>/dev/null)" ]; then
    echo -e "${GREEN}✓ No sensitive strings found (good obfuscation!)${NC}"
else
    echo -e "${RED}✗ WARNING: Sensitive strings are exposed!${NC}"
fi

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[2] Function Names Analysis${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${MAGENTA}Extracting function names (excluding imports and standard library)${NC}"
echo ""

r2 -q -c 'aaa; afl | grep -v "sym.imp\|entry\|std\|GCC"' "$BINARY" 2>/dev/null | head -30

echo ""
echo -e "${CYAN}Analysis:${NC}"
FUNC_COUNT=$(r2 -q -c 'aaa; afl | grep -v "sym.imp\|entry\|std"' "$BINARY" 2>/dev/null | wc -l | tr -d ' ')
echo -e "  Total user functions found: ${FUNC_COUNT}"

if [ $FUNC_COUNT -gt 20 ]; then
    echo -e "  ${RED}✗ Many readable function names exposed${NC}"
elif [ $FUNC_COUNT -gt 5 ]; then
    echo -e "  ${YELLOW}⚠ Some function names exposed${NC}"
else
    echo -e "  ${GREEN}✓ Minimal function exposure${NC}"
fi

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[3] Symbol Table Analysis${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${MAGENTA}Using nm to extract all symbols${NC}"
echo ""

nm "$BINARY" 2>/dev/null | grep -v "U \|w \|b \|d " | head -30

echo ""
SYM_COUNT=$(nm "$BINARY" 2>/dev/null | grep -v "U " | wc -l | tr -d ' ')
echo -e "${CYAN}Total symbols found: ${SYM_COUNT}${NC}"

if [ $SYM_COUNT -gt 100 ]; then
    echo -e "  ${RED}✗ Rich symbol table (easy to reverse engineer)${NC}"
elif [ $SYM_COUNT -gt 20 ]; then
    echo -e "  ${YELLOW}⚠ Moderate symbol exposure${NC}"
else
    echo -e "  ${GREEN}✓ Minimal symbol table (good)${NC}"
fi

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[4] Static Strings Dump${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${MAGENTA}All strings from the binary (first 50):${NC}"
echo ""

r2 -q -c 'iz' "$BINARY" 2>/dev/null | head -50

echo ""
STRING_COUNT=$(r2 -q -c 'iz' "$BINARY" 2>/dev/null | wc -l | tr -d ' ')
echo -e "${CYAN}Total strings found: ${STRING_COUNT}${NC}"

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[5] Binary Information${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

r2 -q -c 'i' "$BINARY" 2>/dev/null | grep -E "(arch|bits|canary|nx|pic|stripped)"

echo ""
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}[6] Security Assessment Summary${NC}"
echo -e "${YELLOW}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""

# Check for stripped binary
if nm "$BINARY" 2>/dev/null | grep -q "T \|t "; then
    echo -e "  ${RED}✗ Binary is NOT stripped (symbols present)${NC}"
    STRIPPED=0
else
    echo -e "  ${GREEN}✓ Binary is stripped${NC}"
    STRIPPED=1
fi

# Check for sensitive strings
SENSITIVE=$(r2 -q -c 'iz' "$BINARY" 2>/dev/null | grep -ciE "(password|secret|key|token|admin)")
if [ $SENSITIVE -gt 0 ]; then
    echo -e "  ${RED}✗ Contains $SENSITIVE sensitive string(s)${NC}"
else
    echo -e "  ${GREEN}✓ No obvious sensitive strings${NC}"
fi

# Overall rating
echo ""
echo -e "${CYAN}Overall Security Rating:${NC}"
if [ $STRIPPED -eq 1 ] && [ $SENSITIVE -eq 0 ] && [ $SYM_COUNT -lt 20 ]; then
    echo -e "  ${GREEN}★★★★★ EXCELLENT${NC} - Well obfuscated"
elif [ $STRIPPED -eq 1 ] || [ $SENSITIVE -eq 0 ]; then
    echo -e "  ${YELLOW}★★★☆☆ MODERATE${NC} - Some protection"
else
    echo -e "  ${RED}★☆☆☆☆ POOR${NC} - Easily reverse engineered"
fi

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                    Analysis Complete                       ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
