# LLVM Obfuscator Research

A comprehensive research project for building an LLVM-based code obfuscator for C/C++ programs.

## Overview

This project explores various code obfuscation techniques using LLVM's compiler infrastructure. The goal is to make compiled binaries extremely difficult to reverse engineer while maintaining functional equivalence and acceptable performance.

## Project Structure

```
llvm-obfuscator-research/
├── src/                    # Test C programs
│   ├── factorial_recursive.c
│   ├── factorial_iterative.c
│   ├── factorial_lookup.c
│   └── passes/            # Custom LLVM passes
│       ├── SimpleObfuscator.cpp
│       ├── Makefile
│       └── README.md
├── scripts/               # Automation and analysis scripts
│   ├── test_llvm_flags.py         # Test compilation flags
│   ├── analyze_ir.py              # LLVM IR analysis
│   ├── decompilation_test.py      # Reverse engineering assessment
│   ├── string_obfuscator.py       # String encryption experiment
│   ├── visualize_results.py       # Generate charts
│   └── test_pipeline.sh           # Complete test automation
├── ir/                    # LLVM IR files
├── asm/                   # Assembly outputs
├── bin/                   # Compiled binaries
├── analysis/              # Test results and reports
│   └── charts/           # Generated visualizations
├── benchmarks/            # Performance measurements
└── docs/                  # Documentation
    ├── initial_research.md      # Research findings
    └── implementation_plan.md   # Development roadmap
```

## Features

### Completed

- ✅ **Test Programs**: Multiple factorial implementations for testing
- ✅ **Flag Testing**: Comprehensive testing of 15+ LLVM flag combinations
- ✅ **Adaptive Flag Selection**: Exhaustive search for effective obfuscation flag bundles
- ✅ **IR Analysis**: Deep dive into LLVM IR transformations
- ✅ **Decompilation Analysis**: Reverse engineering difficulty assessment
- ✅ **String Obfuscation**: Prototype for string encryption
- ✅ **Custom LLVM Pass**: SimpleObfuscator skeleton
- ✅ **Automation Pipeline**: Complete testing and analysis workflow
- ✅ **Visualization**: Charts and graphs for results
- ✅ **Documentation**: Comprehensive research report and implementation plan

### Planned

See [implementation_plan.md](docs/implementation_plan.md) for detailed roadmap.

## Quick Start

### Prerequisites

```bash
# Install LLVM/Clang
brew install llvm          # macOS
# or
apt install llvm clang     # Linux

# Python dependencies
pip3 install matplotlib numpy
```

### Automatic Flag Selection

```bash
python3 scripts/auto_obfuscate.py --source src/arithmetic.cpp --compiler clang++ --emit-json
```

This workflow:
- Compiles the target with every compatible mix of obfuscation flags (use `--max-combination-size` to limit search)
- Leverages `radare2` for scoring when available (falls back to objdump heuristics)
- Emits binaries under `bin/auto/` and JSON reports under `analysis/auto_obfuscator/`
- Works with any C/C++ source; adjust `--source` and `--compiler` as needed
- Always produces a non-obfuscated baseline binary and can sanity-check functionality with `--verify-args "<arg list>"`

### Running Tests

#### 1. Test LLVM Compilation Flags

```bash
python3 scripts/test_llvm_flags.py
```

This will:
- Compile test programs with 15 different flag combinations
- Measure binary size, string visibility, symbol count, etc.
- Calculate obfuscation scores
- Generate CSV and JSON results

#### 2. Analyze LLVM IR

```bash
python3 scripts/analyze_ir.py
```

This will:
- Generate LLVM IR at different optimization levels
- Count and categorize IR instructions
- Measure complexity metrics
- Compare optimization effects

#### 3. Decompilation Analysis

```bash
python3 scripts/decompilation_test.py
```

This will:
- Disassemble all binaries
- Count instructions and analyze complexity
- Assess reverse engineering difficulty
- Generate readability scores

#### 4. String Obfuscation Experiment

```bash
python3 scripts/string_obfuscator.py
```

This will:
- Demonstrate string encryption in LLVM IR
- Create encrypted versions of test programs
- Measure string visibility reduction

#### 5. Complete Pipeline

```bash
./scripts/test_pipeline.sh
```

This will:
- Run all tests in sequence
- Verify functional equivalence
- Generate comprehensive report
- Save all results

#### 6. Visualize Results

```bash
python3 scripts/visualize_results.py
```

This will:
- Generate charts comparing binary sizes
- Plot obfuscation vs performance
- Create metric heatmaps
- Save visualizations to `analysis/charts/`

## Agno Agent Setup

Interact with the project through an [Agno](https://github.com/agnorun/agno) agent tailored to this repository.

Install radare2 (`apt install radare2` / `brew install radare2`) before running the
automation workflow—the agent enforces radare2-based scoring and will abort if the
tool is missing.

1. Create/activate the virtual environment (run once):
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   pip install -r requirements-agno.txt
   ```
2. Copy the environment template and provide your model credentials:
   ```bash
   cp .env.example .env
   # edit .env to add OPENAI_API_KEY / GROQ_API_KEY / OLLAMA_HOST etc.
   ```
3. Confirm the configuration:
   ```bash
   python scripts/llvm_agent.py show-config
   ```
4. Send prompts or start a chat session:
   ```bash
   python scripts/llvm_agent.py ask "Summarize the current LLVM passes roadmap"
   python scripts/llvm_agent.py chat
   ```

By default the helper expects OpenAI (`gpt-4o-mini`). Override provider/model with CLI flags
(`--provider groq --model llama-3.3-70b-versatile`) or via the `.env` file. Install additional
provider SDKs inside the virtualenv if prompted.

### Automated Flag Optimizer

The AI workflow can now run end-to-end experimentation on the LLVM flag corpus. The
`scripts/obfuscation_agent.py` entrypoint coordinates compilation, radare2 scoring,
and flag selection via the Agno agent interface.

```bash
python scripts/obfuscation_agent.py src/factorial_recursive.c \
  --category optimization_level --priority high --limit 10 --threshold 0.5
```

This will (in order):
- Compile a baseline binary.
- Iterate over the requested flag subset, adding a flag only when the radare2-derived
  obfuscation score improves beyond the specified threshold.
- Delete intermediate artefacts so only the baseline and the most obfuscated binaries
  remain in `bin/agent_runs/`.
- Summarise accepted flags, radare2 metrics, scores, and output paths directly in the
  agent response.

Key options:
- `--base-flag/-b`: seed flags applied to every build (e.g. `-O3`).
- `--flag`: provide an explicit ordered list to evaluate.
- `--threshold`: require a minimum score delta before keeping a candidate.
- `--sensitive-string`: flag strings that should disappear from binaries when scoring.
- `--log-radare2/--no-log-radare2`: toggle live radare2 command output (enabled by default).

### Building Custom LLVM Pass

```bash
cd src/passes

# Build the SimpleObfuscator pass
make

# Test it
make test

# Or manually:
clang -S -emit-llvm ../../src/factorial_recursive.c -o test.ll
opt -load ./SimpleObfuscator.dylib -simple-obfuscator -S test.ll -o test_obf.ll
clang test_obf.ll -o test_obf
./test_obf 5
```

## Research Findings

### Key Discoveries

1. **Standard LLVM optimizations provide 40-60% obfuscation** through:
   - Function inlining
   - Symbol removal
   - Code optimization

2. **String encryption is highly effective**:
   - 90%+ reduction in visible strings
   - <1% performance overhead
   - Simple to implement

3. **Custom passes are essential** for:
   - Control flow obfuscation
   - Advanced instruction transformations
   - Maximum reverse engineering resistance

4. **Performance trade-offs are manageable**:
   - Light obfuscation: <5% overhead
   - Medium obfuscation: <15% overhead
   - Heavy obfuscation: <30% overhead

### Obfuscation Techniques Ranking

| Technique | Difficulty | Effectiveness | Performance Impact | ROI |
|-----------|-----------|---------------|-------------------|-----|
| Symbol Stripping | Very Low | Medium | None | ⭐⭐⭐⭐⭐ |
| String Encryption | Low | High | Very Low | ⭐⭐⭐⭐⭐ |
| Function Inlining | Very Low | Medium | Positive | ⭐⭐⭐⭐⭐ |
| Control Flow Flatten | High | Very High | Medium | ⭐⭐⭐ |
| Bogus Control Flow | Medium | High | Low | ⭐⭐⭐⭐ |
| Instruction Subst | Medium | Medium | Medium | ⭐⭐⭐ |

See [initial_research.md](docs/initial_research.md) for complete findings.

## Example Results

### Best Obfuscation Configuration

```bash
clang -O3 -flto -fvisibility=hidden -fno-asynchronous-unwind-tables \
      -fno-ident -fomit-frame-pointer -funroll-loops \
      -finline-functions program.c -o program

strip --strip-all program
```

**Results:**
- 85-90% symbol reduction
- 70-90% string visibility reduction
- 50-60% function count reduction
- Minimal performance impact

### Obfuscation Score

Our scoring system (higher = better obfuscation):
- **Baseline (O0):** 0
- **O3 + Strip:** +20 to +40
- **O3 + Strip + String Encryption:** +50 to +70
- **Full Obfuscation (planned):** +80 to +100

## Documentation

- **[Initial Research Report](docs/initial_research.md)** - Complete findings and analysis
- **[Implementation Plan](docs/implementation_plan.md)** - Detailed development roadmap
- **[Custom Pass README](src/passes/README.md)** - LLVM pass development guide

## Next Steps

1. **Phase 1: Foundation** (Weeks 1-3)
   - Project infrastructure
   - Build system
   - Utilities

2. **Phase 2: Basic Passes** (Weeks 4-7)
   - String encryption (production version)
   - Symbol renaming (complete)
   - Constant obfuscation

3. **Phase 3: Advanced Control Flow** (Weeks 8-12)
   - Control flow flattening
   - Bogus control flow
   - Opaque predicates

4. **Phase 4: Instruction Level** (Weeks 13-15)
   - Instruction substitution
   - MBA transformations

5. **Phase 5: CLI Tool** (Weeks 16-18)
   - Command-line interface
   - Build system integration
   - Documentation

6. **Phase 6: Testing** (Weeks 19-21)
   - Unit tests
   - Integration tests
   - Security validation

7. **Phase 7: Release** (Weeks 22-24)
   - Optimization
   - Bug fixes
   - v1.0 release

See [implementation_plan.md](docs/implementation_plan.md) for complete timeline.

## Contributing

This is a research project. Contributions, ideas, and feedback are welcome!

### Areas for Contribution

- Additional test programs
- New obfuscation techniques
- Performance optimization
- Platform support (Windows, ARM, etc.)
- Documentation improvements

## Testing

All test programs include:
- Functional equivalence verification
- Performance benchmarking
- Binary size analysis
- Reverse engineering difficulty assessment

Run the complete test suite:
```bash
./scripts/test_pipeline.sh
```

## Performance

### Compilation Time

| Configuration | Compile Time | vs Baseline |
|--------------|--------------|-------------|
| O0 | 1.0s | 0% |
| O3 | 1.5s | +50% |
| O3 + Obfuscation | 2.0s | +100% |

### Runtime Performance

| Configuration | Runtime | vs O0 |
|--------------|---------|-------|
| O0 | 1000ms | 0% |
| O3 | 250ms | -75% |
| O3 + Obfuscation | 260ms | -74% |

String encryption adds <1% overhead.

## License

[To be determined - suggest Apache 2.0 or MIT]

## Acknowledgments

- LLVM Project - https://llvm.org/
- Obfuscator-LLVM - https://github.com/obfuscator-llvm/obfuscator
- Tigress - https://tigress.wtf/
- Academic research on code obfuscation

## Contact

For questions or collaboration opportunities, please open an issue.

---

**Project Status:** Research Phase Complete, Implementation Starting
**Last Updated:** October 2, 2025
