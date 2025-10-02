# LLVM Obfuscator - Implementation Plan

**Project:** LLVM-based Code Obfuscator
**Document Version:** 1.0
**Date:** October 2, 2025
**Status:** Planning Phase Complete, Ready for Implementation

---

## Table of Contents

1. [Vision & Goals](#vision--goals)
2. [Architecture](#architecture)
3. [Implementation Phases](#implementation-phases)
4. [Detailed Component Specifications](#detailed-component-specifications)
5. [Timeline & Milestones](#timeline--milestones)
6. [Testing Strategy](#testing-strategy)
7. [Risk Assessment](#risk-assessment)
8. [Success Criteria](#success-criteria)

---

## Vision & Goals

### Project Vision

Build a modern, modular LLVM-based code obfuscator that makes compiled C/C++ binaries significantly harder to reverse engineer while maintaining:
- Functional equivalence (100% correctness)
- Acceptable performance overhead (<30% slowdown at maximum obfuscation)
- Configurable obfuscation levels
- Easy integration with existing build systems

### Primary Goals

1. **Effectiveness:** Increase reverse engineering effort by 5-10x compared to standard optimizations
2. **Usability:** Simple CLI interface, integration with clang toolchain
3. **Modularity:** Pluggable obfuscation passes, easy to extend
4. **Performance:** Minimal overhead for light/medium obfuscation levels
5. **Compatibility:** Support modern LLVM versions (14+), C and C++ code

### Non-Goals (v1.0)

- Perfect unbreakability (impossible goal)
- Support for all edge cases and exotic C/C++ features
- GUI interface
- Cross-language support (Java, Rust, etc.)
- Binary-level obfuscation (focus on LLVM IR)

---

## Architecture

### High-Level Design

```
┌─────────────────┐
│  Source Code    │
│   (C/C++)       │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Clang Frontend │
│  (AST → IR)     │
└────────┬────────┘
         │
         ▼
┌─────────────────────────────────────────┐
│        LLVM IR (Unobfuscated)           │
└────────┬────────────────────────────────┘
         │
         ▼
┌─────────────────────────────────────────┐
│    Obfuscation Pipeline (opt)           │
│  ┌───────────────────────────────────┐  │
│  │ Pass 1: String Encryption         │  │
│  └───────────────┬───────────────────┘  │
│                  ▼                       │
│  ┌───────────────────────────────────┐  │
│  │ Pass 2: Symbol Renaming           │  │
│  └───────────────┬───────────────────┘  │
│                  ▼                       │
│  ┌───────────────────────────────────┐  │
│  │ Pass 3: Control Flow Flattening   │  │
│  └───────────────┬───────────────────┘  │
│                  ▼                       │
│  ┌───────────────────────────────────┐  │
│  │ Pass 4: Bogus Control Flow        │  │
│  └───────────────┬───────────────────┘  │
│                  ▼                       │
│  ┌───────────────────────────────────┐  │
│  │ Pass 5: Instruction Substitution  │  │
│  └───────────────┬───────────────────┘  │
│                  ▼                       │
│  ┌───────────────────────────────────┐  │
│  │ Pass 6: Constant Obfuscation      │  │
│  └───────────────┬───────────────────┘  │
└──────────────────┼─────────────────────┘
                   │
                   ▼
┌─────────────────────────────────────────┐
│        LLVM IR (Obfuscated)             │
└────────┬────────────────────────────────┘
         │
         ▼
┌─────────────────┐
│  LLVM Backend   │
│  (IR → Machine) │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Binary Output  │
│  (Obfuscated)   │
└─────────────────┘
```

### Component Architecture

```
llvm-obfuscator/
├── lib/
│   ├── Passes/
│   │   ├── StringEncryption.cpp
│   │   ├── SymbolRenaming.cpp
│   │   ├── ControlFlowFlattening.cpp
│   │   ├── BogusControlFlow.cpp
│   │   ├── InstructionSubstitution.cpp
│   │   └── ConstantObfuscation.cpp
│   ├── Utils/
│   │   ├── RandomEngine.cpp
│   │   ├── IRAnalysis.cpp
│   │   └── PatternMatching.cpp
│   └── Runtime/
│       ├── StringDecryptor.c
│       └── AntiDebug.c
├── tools/
│   ├── obfuscator/
│   │   └── main.cpp
│   └── analyzer/
│       └── analyze.cpp
├── include/
│   └── llvm-obfuscator/
│       ├── Passes/
│       ├── Utils/
│       └── Config.h
├── test/
│   ├── unit/
│   ├── integration/
│   └── benchmarks/
└── scripts/
    ├── build.sh
    ├── test.sh
    └── install.sh
```

### Technology Stack

- **Language:** C++ 14/17
- **LLVM Version:** 14, 15, 16 support (target latest stable)
- **Build System:** CMake 3.13+
- **Testing:** LLVM LIT, Google Test
- **Documentation:** Markdown, Doxygen
- **Version Control:** Git

---

## Implementation Phases

### Phase 1: Foundation (Weeks 1-3)

**Goal:** Establish project infrastructure and core utilities

**Deliverables:**
- [x] Project structure created
- [x] Build system configured (CMake)
- [x] Initial test programs created
- [ ] CI/CD pipeline setup
- [ ] Basic documentation structure
- [ ] Random number generator utility
- [ ] IR analysis utilities
- [ ] Configuration system

**Estimated Effort:** 40 hours

### Phase 2: Basic Obfuscation Passes (Weeks 4-7)

**Goal:** Implement foundational obfuscation techniques

#### 2.1 String Encryption Pass (Week 4)

**Status:** Prototype exists
**Work Required:**
- Port prototype to production pass
- Add multiple encryption algorithms (XOR, AES-like)
- Handle format strings safely
- Add global constructor generation
- Write unit tests

**Complexity:** Low-Medium
**Estimated Effort:** 15 hours

#### 2.2 Symbol Renaming Pass (Week 5)

**Status:** Skeleton exists
**Work Required:**
- Complete SimpleObfuscator implementation
- Add configurable naming schemes
- Preserve external symbols
- Handle C++ name mangling
- Write unit tests

**Complexity:** Low
**Estimated Effort:** 10 hours

#### 2.3 Constant Obfuscation Pass (Week 6)

**Work Required:**
- Identify constant values in IR
- Generate mathematical expressions
- Replace constants with computed values
- Add random variation
- Write unit tests

**Example:**
```c
// Before: x = 42;
// After:  x = (0x2A ^ 0x00) + (1 << 0);
```

**Complexity:** Medium
**Estimated Effort:** 20 hours

#### 2.4 Integration & Testing (Week 7)

**Work Required:**
- Integrate all basic passes
- Create pass pipeline manager
- Test on factorial programs
- Measure effectiveness
- Document usage

**Estimated Effort:** 15 hours

**Phase 2 Total:** 60 hours

### Phase 3: Advanced Control Flow Obfuscation (Weeks 8-12)

#### 3.1 Control Flow Flattening (Weeks 8-10)

**Goal:** Transform structured control flow into dispatcher-based flow

**Algorithm:**
1. Identify basic blocks in function
2. Create dispatcher block with switch statement
3. Assign each block a state number
4. Replace branches with state updates
5. Add dispatcher loop

**Before:**
```c
if (x > 0) {
    y = x + 1;
} else {
    y = x - 1;
}
return y;
```

**After (conceptual):**
```c
int state = 0;
while (1) {
    switch(state) {
        case 0: if (x > 0) state = 1; else state = 2; break;
        case 1: y = x + 1; state = 3; break;
        case 2: y = x - 1; state = 3; break;
        case 3: return y;
    }
}
```

**Challenges:**
- Preserving function semantics
- Handling loops and nested conditions
- Performance impact (high priority)

**Complexity:** High
**Estimated Effort:** 40 hours

#### 3.2 Bogus Control Flow (Weeks 11-12)

**Goal:** Add fake branches that are never taken

**Techniques:**
- Opaque predicates (always true/false conditions)
- Dead code insertion
- Fake function calls
- Complex conditional expressions

**Example Opaque Predicate:**
```c
// Always true: (x * (x + 1)) % 2 == 0
if ((x * (x + 1)) % 2 == 0) {
    // Real code
} else {
    // Fake code (never executed)
}
```

**Complexity:** Medium-High
**Estimated Effort:** 30 hours

**Phase 3 Total:** 70 hours

### Phase 4: Instruction-Level Obfuscation (Weeks 13-15)

#### 4.1 Instruction Substitution (Weeks 13-14)

**Goal:** Replace simple instructions with equivalent complex ones

**Substitution Patterns:**

| Original | Substitution |
|----------|--------------|
| `a + b` | `(a ^ b) + 2 * (a & b)` |
| `a - b` | `a + (~b + 1)` |
| `a * 2` | `a << 1` |
| `a ^ b` | `(a \| b) & ~(a & b)` |

**Implementation:**
- Pattern matching on IR instructions
- Template-based substitution
- Random selection of equivalent forms
- Preserve type safety

**Complexity:** Medium
**Estimated Effort:** 25 hours

#### 4.2 MBA (Mixed Boolean-Arithmetic) (Week 15)

**Goal:** Encode expressions using MBA identities

**Example:**
- `x + y` → `(x ^ y) + 2 * (x & y)`
- `x - y` → `(x + ~y) + 1`
- `x * 3` → `(x << 1) + x`

**Complexity:** High (requires mathematical knowledge)
**Estimated Effort:** 20 hours

**Phase 4 Total:** 45 hours

### Phase 5: CLI Tool & Integration (Weeks 16-18)

#### 5.1 Command-Line Interface (Week 16)

**Features:**
- Simple usage: `llvm-obfuscator input.c -o output`
- Obfuscation level presets: `--level=low|medium|high|extreme`
- Individual pass control: `--enable-cff --disable-strings`
- Configuration file support: `--config=obf.yaml`
- Verbose output: `--verbose`
- Dry run: `--dry-run`

**Estimated Effort:** 15 hours

#### 5.2 Build System Integration (Week 17)

**CMake Integration:**
```cmake
find_package(LLVMObfuscator REQUIRED)
add_executable(myapp main.c)
obfuscate_target(myapp LEVEL high)
```

**Makefile Integration:**
```make
CC = llvm-obfuscator -level=medium
```

**Estimated Effort:** 15 hours

#### 5.3 Documentation & Examples (Week 18)

**Documentation:**
- README.md with quick start
- User guide
- API documentation (Doxygen)
- Tutorial with examples
- FAQ

**Examples:**
- Basic usage
- Custom configuration
- Integration with build systems
- Performance tuning

**Estimated Effort:** 20 hours

**Phase 5 Total:** 50 hours

### Phase 6: Testing & Validation (Weeks 19-21)

#### 6.1 Unit Testing (Week 19)

**Test Coverage:**
- Each pass individually
- Utility functions
- Edge cases
- Error handling

**Target:** 80%+ code coverage

**Estimated Effort:** 25 hours

#### 6.2 Integration Testing (Week 20)

**Test Suites:**
- LLVM test-suite programs
- Real-world open source projects
- Edge cases (recursion, templates, etc.)
- Performance benchmarks

**Estimated Effort:** 20 hours

#### 6.3 Security Testing (Week 21)

**Validation:**
- Manual reverse engineering tests
- Automated decompilation comparison
- Symbol/string visibility checks
- Control flow complexity measurement

**Estimated Effort:** 20 hours

**Phase 6 Total:** 65 hours

### Phase 7: Optimization & Polish (Weeks 22-24)

#### 7.1 Performance Optimization (Week 22)

**Focus Areas:**
- Reduce compilation time overhead
- Minimize runtime performance impact
- Optimize pass ordering
- Add caching where possible

**Estimated Effort:** 20 hours

#### 7.2 Bug Fixes & Refinement (Week 23)

**Activities:**
- Address issues from testing
- Improve error messages
- Add warnings for problematic code
- Enhance logging

**Estimated Effort:** 20 hours

#### 7.3 Release Preparation (Week 24)

**Tasks:**
- Final documentation review
- Release notes
- Package for distribution
- Create installers
- Prepare examples

**Estimated Effort:** 15 hours

**Phase 7 Total:** 55 hours

---

## Detailed Component Specifications

### Component 1: String Encryption Pass

**Inputs:** LLVM IR module
**Outputs:** LLVM IR module with encrypted strings

**Algorithm:**
1. Scan IR for string constants
2. For each string:
   - Generate encryption key
   - Encrypt string bytes
   - Replace constant with encrypted version
   - Record string for decryption setup
3. Generate decryption function
4. Create global constructor to call decryption
5. Insert constructor into module

**Configuration Options:**
- Encryption algorithm (XOR, RC4-like, AES-like)
- Key generation method (random, derived)
- Decryption timing (startup, lazy, just-in-time)

**Edge Cases:**
- Format strings (printf, scanf)
- String literals passed to external functions
- Wide character strings
- Embedded null bytes

**Testing:**
- Verify decryption correctness
- Test various string types
- Measure runtime overhead
- Check for crashes with edge cases

### Component 2: Control Flow Flattening Pass

**Inputs:** LLVM IR function
**Outputs:** Flattened LLVM IR function

**Algorithm:**
1. Analyze function CFG
2. Identify basic blocks
3. Create dispatcher block
4. Assign state IDs to blocks
5. Create switch statement
6. Replace control flow with state updates
7. Wrap in dispatcher loop

**Configuration Options:**
- Flattening intensity (partial vs complete)
- State variable obfuscation
- Dispatcher complexity

**Challenges:**
- Preserving loop behavior
- Handling function calls
- Managing PHI nodes
- Performance optimization

**Testing:**
- Functional equivalence testing
- Loop correctness
- Exception handling (C++)
- Performance benchmarks

### Component 3: Configuration System

**Format:** YAML/JSON configuration file

**Example:**
```yaml
obfuscation:
  level: high  # low, medium, high, extreme

  passes:
    string_encryption:
      enabled: true
      algorithm: aes
      key_size: 128

    control_flow_flattening:
      enabled: true
      intensity: 0.8  # 0.0 - 1.0

    bogus_control_flow:
      enabled: true
      fake_branch_ratio: 0.3

    instruction_substitution:
      enabled: true
      substitution_rate: 0.5

    constant_obfuscation:
      enabled: true
      complexity: 3  # expression depth

  performance:
    max_overhead: 0.3  # 30% slowdown limit
    optimize_after: true

  exclusions:
    functions: [main, init, cleanup]
    files: [debug.c, test.c]
```

**Implementation:**
- Use existing YAML parser (yaml-cpp)
- Validate configuration
- Provide defaults
- Override with CLI flags

---

## Timeline & Milestones

### Gantt Chart Overview

```
Week 1-3   : [████████] Foundation
Week 4-7   : [████████] Basic Passes
Week 8-12  : [████████████] Advanced Control Flow
Week 13-15 : [██████] Instruction-Level
Week 16-18 : [██████] CLI & Integration
Week 19-21 : [██████] Testing
Week 22-24 : [██████] Polish & Release
```

### Key Milestones

| Milestone | Week | Deliverable |
|-----------|------|-------------|
| M1: Foundation Complete | 3 | Build system, utilities ready |
| M2: Basic Obfuscation | 7 | String encryption, symbol renaming working |
| M3: Control Flow | 12 | Flattening and bogus flow implemented |
| M4: Instruction Level | 15 | Substitution and MBA complete |
| M5: Alpha Release | 18 | CLI tool functional, basic docs |
| M6: Testing Complete | 21 | All tests passing, validation done |
| M7: v1.0 Release | 24 | Production-ready release |

### Critical Path

1. Foundation → Basic Passes → Control Flow Flattening
2. Control Flow is gating factor for effectiveness
3. Testing cannot start until all passes complete
4. Documentation can proceed in parallel after Week 7

---

## Testing Strategy

### Testing Pyramid

```
         /\
        /  \  End-to-End (10%)
       /____\
      /      \ Integration (30%)
     /________\
    /          \ Unit Tests (60%)
   /____________\
```

### Test Categories

#### 1. Unit Tests (60% of tests)

**Coverage:**
- Each pass in isolation
- Utility functions
- Configuration parsing
- Error handling

**Framework:** Google Test + LLVM LIT

**Example:**
```cpp
TEST(StringEncryptionTest, BasicXOREncryption) {
    Module M = createTestModule();
    StringEncryptionPass SEP;
    SEP.runOnModule(M);
    ASSERT_TRUE(verifyModule(M));
    ASSERT_EQ(countVisibleStrings(M), 0);
}
```

#### 2. Integration Tests (30% of tests)

**Coverage:**
- Multiple passes together
- Pass interaction
- Pipeline correctness
- Real-world code samples

**Test Programs:**
- Factorial examples (completed)
- Sorting algorithms
- String manipulation
- Data structures
- Math libraries

#### 3. End-to-End Tests (10% of tests)

**Coverage:**
- Complete compilation pipeline
- Command-line interface
- Build system integration
- Large programs

**Test Projects:**
- Small open source projects
- LLVM test-suite
- Custom benchmarks

### Validation Testing

#### Functional Equivalence

**Method:** Differential testing
- Compile with and without obfuscation
- Run identical inputs
- Compare outputs
- Use tools: Valgrind, AddressSanitizer

**Acceptance:** 100% functional equivalence

#### Security Testing

**Method:** Reverse engineering assessment
- Manual decompilation (Ghidra, IDA Pro)
- String analysis
- Symbol analysis
- Control flow analysis

**Metrics:**
- Time to understand functionality
- Accuracy of recovered source
- Readability score

**Target:** 5-10x increase in reverse engineering effort

#### Performance Testing

**Benchmarks:**
- SPEC CPU (if available)
- Custom microbenchmarks
- Real-world applications

**Metrics:**
- Execution time
- Memory usage
- Binary size
- Compilation time

**Acceptance Criteria:**
- Low level: <5% overhead
- Medium level: <15% overhead
- High level: <30% overhead
- Extreme level: <50% overhead

---

## Risk Assessment

### Technical Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| LLVM API changes | Medium | High | Target stable LLVM versions, maintain compat layer |
| Performance overhead too high | Medium | High | Early benchmarking, optimization focus |
| Functional correctness issues | Medium | Critical | Extensive testing, validation suite |
| C++ template handling | High | Medium | Start with C, add C++ incrementally |
| Platform compatibility | Low | Medium | CI testing on multiple platforms |

### Project Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Scope creep | Medium | High | Strict phase boundaries, v1.0 feature freeze |
| Timeline slippage | Medium | Medium | Buffer time, prioritize critical features |
| Resource availability | Low | High | Modular design allows distributed work |
| Competing tools | Low | Low | Focus on modern LLVM, ease of use |

### Security Risks

| Risk | Probability | Impact | Mitigation |
|------|-------------|--------|------------|
| Obfuscation breakable | High | Medium | Manage expectations, layer defenses |
| Side-channel leaks | Medium | Low | Document limitations |
| Backdoor concerns | Low | High | Open source, code review |

---

## Success Criteria

### Must Have (v1.0)

- ✓ Compiles C programs without errors
- ✓ 100% functional equivalence
- ✓ String encryption working
- ✓ Symbol obfuscation working
- ✓ Control flow flattening working
- ✓ <30% performance overhead (high level)
- ✓ Command-line tool functional
- ✓ Basic documentation complete
- ✓ Test suite passing

### Should Have (v1.0)

- ✓ C++ support (basic)
- ✓ Bogus control flow
- ✓ Instruction substitution
- ✓ Configuration file support
- ✓ CMake integration
- ✓ Multiple LLVM version support

### Nice to Have (v1.1+)

- Code virtualization
- Anti-debugging techniques
- Call indirection
- Advanced MBA transformations
- GUI configuration tool
- IDE integration

### Success Metrics

**Effectiveness:**
- 5-10x increase in reverse engineering time
- 80-90% reduction in visible strings
- 60-80% reduction in recognizable functions
- Control flow graph complexity increase 3-5x

**Performance:**
- Compilation time: <2x slowdown
- Runtime (high level): <30% overhead
- Binary size: <2x increase

**Usability:**
- Single command compilation
- Integration with existing build systems
- Clear documentation
- Active community support (future)

---

## Appendix A: Development Environment Setup

### Required Tools

```bash
# LLVM/Clang
brew install llvm  # macOS
apt install llvm-14 clang-14  # Ubuntu

# Build tools
brew install cmake ninja
pip3 install lit

# Testing tools
brew install valgrind  # if available
pip3 install pytest

# Documentation
brew install doxygen graphviz
```

### Build Instructions

```bash
# Clone repository
git clone https://github.com/yourorg/llvm-obfuscator.git
cd llvm-obfuscator

# Create build directory
mkdir build && cd build

# Configure
cmake -G Ninja -DCMAKE_BUILD_TYPE=Release ..

# Build
ninja

# Test
ninja check-obfuscator

# Install
sudo ninja install
```

---

## Appendix B: API Examples

### Using Passes Programmatically

```cpp
#include "llvm/IR/Module.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm-obfuscator/Passes/StringEncryption.h"
#include "llvm-obfuscator/Passes/ControlFlowFlattening.h"

using namespace llvm;

void obfuscateModule(Module &M) {
    legacy::PassManager PM;

    // Add obfuscation passes
    PM.add(new StringEncryptionPass());
    PM.add(new ControlFlowFlatteningPass());

    // Run passes
    PM.run(M);
}
```

### CLI Usage Examples

```bash
# Basic usage
llvm-obfuscator input.c -o output

# Set obfuscation level
llvm-obfuscator --level=high input.c -o output

# Custom configuration
llvm-obfuscator --config=obf.yaml input.c -o output

# Enable specific passes
llvm-obfuscator --enable-cff --enable-strings input.c -o output

# Verbose output
llvm-obfuscator -v input.c -o output

# Dry run (show what would be done)
llvm-obfuscator --dry-run input.c
```

---

**Document Status:** Ready for Implementation
**Next Action:** Begin Phase 1 - Foundation
**Approval Required:** Project stakeholders
**Last Updated:** October 2, 2025
