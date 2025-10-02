import json

try:
    import pandas as pd
except ImportError:  # pragma: no cover - optional dependency
    pd = None

# Comprehensive flag database based on research

comprehensive_flags = [
# === OPTIMIZATION LEVELS ===
{"flag": "-O0", "category": "optimization_level", "obfuscation_score": 1, "description": "No optimization - baseline", "priority": "baseline"},
{"flag": "-O1", "category": "optimization_level", "obfuscation_score": 3, "description": "Basic optimization", "priority": "low"},
{"flag": "-O2", "category": "optimization_level", "obfuscation_score": 6, "description": "Standard optimization", "priority": "medium"},
{"flag": "-O3", "category": "optimization_level", "obfuscation_score": 8, "description": "Aggressive optimization", "priority": "high"},
{"flag": "-Os", "category": "optimization_level", "obfuscation_score": 5, "description": "Optimize for size", "priority": "medium"},
{"flag": "-Oz", "category": "optimization_level", "obfuscation_score": 6, "description": "Aggressive size optimization", "priority": "medium"},
{"flag": "-Ofast", "category": "optimization_level", "obfuscation_score": 9, "description": "Fast math optimization", "priority": "high"},
{"flag": "-Og", "category": "optimization_level", "obfuscation_score": 2, "description": "Debug-friendly optimization", "priority": "low"},

# === OBFUSCATOR-LLVM PASSES ===
{"flag": "-mllvm -fla", "category": "obfuscation_pass", "obfuscation_score": 9, "description": "Control flow flattening", "priority": "highest"},
{"flag": "-mllvm -bcf", "category": "obfuscation_pass", "obfuscation_score": 8, "description": "Bogus control flow", "priority": "highest"},
{"flag": "-mllvm -sub", "category": "obfuscation_pass", "obfuscation_score": 7, "description": "Instruction substitution", "priority": "high"},
{"flag": "-mllvm -split", "category": "obfuscation_pass", "obfuscation_score": 6, "description": "Basic block splitting", "priority": "high"},
{"flag": "-mllvm -bcf_loop", "category": "obfuscation_pass", "obfuscation_score": 7, "description": "Bogus control flow for loops", "priority": "high"},
{"flag": "-mllvm -bcf_prob", "category": "obfuscation_pass", "obfuscation_score": 6, "description": "Bogus control flow probability", "priority": "medium"},
{"flag": "-mllvm -sub_loop", "category": "obfuscation_pass", "obfuscation_score": 6, "description": "Instruction substitution in loops", "priority": "medium"},
{"flag": "-mllvm -split_num", "category": "obfuscation_pass", "obfuscation_score": 5, "description": "Number of basic block splits", "priority": "medium"},

# === INLINING FLAGS ===
{"flag": "-finline-functions", "category": "inlining", "obfuscation_score": 7, "description": "Inline functions aggressively", "priority": "high"},
{"flag": "-finline-functions-aggressive", "category": "inlining", "obfuscation_score": 8, "description": "Very aggressive function inlining", "priority": "high"},
{"flag": "-finline-hint-functions", "category": "inlining", "obfuscation_score": 6, "description": "Inline hint functions", "priority": "medium"},
{"flag": "-finline-small-functions", "category": "inlining", "obfuscation_score": 6, "description": "Inline small functions", "priority": "medium"},
{"flag": "-finline-limit=1000", "category": "inlining", "obfuscation_score": 7, "description": "Set inline limit to 1000", "priority": "high"},
{"flag": "-finline-limit=10000", "category": "inlining", "obfuscation_score": 8, "description": "Set inline limit to 10000", "priority": "high"},
{"flag": "-finline-limit=999999", "category": "inlining", "obfuscation_score": 9, "description": "Remove practical inline limits", "priority": "highest"},
{"flag": "-falways-inline", "category": "inlining", "obfuscation_score": 6, "description": "Force inline marked functions", "priority": "medium"},
{"flag": "-fno-inline", "category": "inlining", "obfuscation_score": 1, "description": "Disable all inlining - negative", "priority": "baseline"},
{"flag": "-fno-inline-functions", "category": "inlining", "obfuscation_score": 1, "description": "Disable function inlining", "priority": "baseline"},
{"flag": "-finline-functions-called-once", "category": "inlining", "obfuscation_score": 4, "description": "Inline single-use functions", "priority": "low"},

# === LOOP OPTIMIZATION FLAGS ===
{"flag": "-funroll-loops", "category": "loop_optimization", "obfuscation_score": 7, "description": "Unroll loops", "priority": "high"},
{"flag": "-funroll-all-loops", "category": "loop_optimization", "obfuscation_score": 8, "description": "Unroll all loops aggressively", "priority": "high"},
{"flag": "-floop-vectorize", "category": "loop_optimization", "obfuscation_score": 6, "description": "Vectorize loops", "priority": "medium"},
{"flag": "-fslp-vectorize", "category": "loop_optimization", "obfuscation_score": 5, "description": "SLP vectorization", "priority": "medium"},
{"flag": "-floop-interchange", "category": "loop_optimization", "obfuscation_score": 5, "description": "Interchange nested loops", "priority": "medium"},
{"flag": "-floop-unroll-and-jam", "category": "loop_optimization", "obfuscation_score": 7, "description": "Unroll and jam loops", "priority": "high"},
{"flag": "-floop-unroll-limit=8", "category": "loop_optimization", "obfuscation_score": 6, "description": "Set unroll limit to 8", "priority": "medium"},
{"flag": "-floop-unroll-limit=16", "category": "loop_optimization", "obfuscation_score": 7, "description": "Set unroll limit to 16", "priority": "high"},
{"flag": "-floop-unroll-limit=32", "category": "loop_optimization", "obfuscation_score": 7, "description": "Set unroll limit to 32", "priority": "high"},
{"flag": "-fno-unroll-loops", "category": "loop_optimization", "obfuscation_score": 1, "description": "Disable loop unrolling", "priority": "baseline"},
{"flag": "-floop-strip-mine", "category": "loop_optimization", "obfuscation_score": 4, "description": "Strip mine loops", "priority": "low"},
{"flag": "-floop-block", "category": "loop_optimization", "obfuscation_score": 4, "description": "Block loops", "priority": "low"},

# === MATH OPTIMIZATION FLAGS ===
{"flag": "-ffast-math", "category": "math_optimization", "obfuscation_score": 8, "description": "Fast math optimizations", "priority": "high"},
{"flag": "-fassociative-math", "category": "math_optimization", "obfuscation_score": 6, "description": "Allow associative math", "priority": "medium"},
{"flag": "-freciprocal-math", "category": "math_optimization", "obfuscation_score": 7, "description": "Use reciprocal multiplication", "priority": "high"},
{"flag": "-ffinite-math-only", "category": "math_optimization", "obfuscation_score": 5, "description": "Assume no infinities/NaNs", "priority": "medium"},
{"flag": "-funsafe-math-optimizations", "category": "math_optimization", "obfuscation_score": 7, "description": "Unsafe math transforms", "priority": "high"},
{"flag": "-fno-signed-zeros", "category": "math_optimization", "obfuscation_score": 4, "description": "Ignore signed zeros", "priority": "low"},
{"flag": "-fno-trapping-math", "category": "math_optimization", "obfuscation_score": 4, "description": "No trapping math", "priority": "low"},
{"flag": "-fno-math-errno", "category": "math_optimization", "obfuscation_score": 3, "description": "Math doesn't set errno", "priority": "low"},
{"flag": "-ffp-contract=fast", "category": "math_optimization", "obfuscation_score": 5, "description": "Fast FP contraction", "priority": "medium"},
{"flag": "-ffp-contract=off", "category": "math_optimization", "obfuscation_score": 2, "description": "Disable FP contraction", "priority": "baseline"},
{"flag": "-mllvm -enable-fp-mad", "category": "math_optimization", "obfuscation_score": 4, "description": "Enable FP multiply-add", "priority": "low"},

# === LTO FLAGS ===
{"flag": "-flto", "category": "lto", "obfuscation_score": 8, "description": "Link-time optimization", "priority": "high"},
{"flag": "-flto=thin", "category": "lto", "obfuscation_score": 7, "description": "Thin LTO", "priority": "high"},
{"flag": "-flto=full", "category": "lto", "obfuscation_score": 8, "description": "Full LTO", "priority": "high"},
{"flag": "-fwhole-program-vtables", "category": "lto", "obfuscation_score": 6, "description": "Whole-program vtable optimization", "priority": "medium"},
{"flag": "-ffat-lto-objects", "category": "lto", "obfuscation_score": 5, "description": "Fat LTO objects", "priority": "medium"},
{"flag": "-flto-jobs=1", "category": "lto", "obfuscation_score": 5, "description": "Single-threaded LTO", "priority": "medium"},
{"flag": "-flto-jobs=4", "category": "lto", "obfuscation_score": 5, "description": "Multi-threaded LTO", "priority": "medium"},
{"flag": "-fuse-ld=lld", "category": "lto", "obfuscation_score": 4, "description": "Use LLD linker with LTO", "priority": "low"},

# === CONTROL FLOW FLAGS ===
{"flag": "-fomit-frame-pointer", "category": "control_flow", "obfuscation_score": 4, "description": "Omit frame pointers", "priority": "medium"},
{"flag": "-fno-omit-frame-pointer", "category": "control_flow", "obfuscation_score": 1, "description": "Keep frame pointers", "priority": "baseline"},
{"flag": "-fno-unwind-tables", "category": "control_flow", "obfuscation_score": 5, "description": "Remove unwind tables", "priority": "medium"},
{"flag": "-fno-asynchronous-unwind-tables", "category": "control_flow", "obfuscation_score": 4, "description": "Remove async unwind tables", "priority": "medium"},
{"flag": "-ffunction-sections", "category": "control_flow", "obfuscation_score": 3, "description": "Separate function sections", "priority": "low"},
{"flag": "-fdata-sections", "category": "control_flow", "obfuscation_score": 3, "description": "Separate data sections", "priority": "low"},
{"flag": "-fno-jump-tables", "category": "control_flow", "obfuscation_score": 6, "description": "Disable jump tables", "priority": "medium"},
{"flag": "-fno-threadsafe-statics", "category": "control_flow", "obfuscation_score": 3, "description": "No thread-safe statics", "priority": "low"},
{"flag": "-fno-rtti", "category": "control_flow", "obfuscation_score": 4, "description": "Disable RTTI", "priority": "medium"},
{"flag": "-fno-exceptions", "category": "control_flow", "obfuscation_score": 4, "description": "Disable exceptions", "priority": "medium"},
{"flag": "-fcf-protection=none", "category": "control_flow", "obfuscation_score": 2, "description": "Disable control flow protection", "priority": "baseline"},
{"flag": "-fcf-protection=branch", "category": "control_flow", "obfuscation_score": 5, "description": "Branch control flow protection", "priority": "medium"},
{"flag": "-fcf-protection=return", "category": "control_flow", "obfuscation_score": 5, "description": "Return control flow protection", "priority": "medium"},
{"flag": "-fcf-protection=full", "category": "control_flow", "obfuscation_score": 6, "description": "Full control flow protection", "priority": "medium"},

# === DATA LAYOUT FLAGS ===
{"flag": "-fpack-struct", "category": "data_layout", "obfuscation_score": 4, "description": "Pack all structures", "priority": "medium"},
{"flag": "-fpack-struct=1", "category": "data_layout", "obfuscation_score": 5, "description": "Pack structures with 1-byte alignment", "priority": "medium"},
{"flag": "-fpack-struct=2", "category": "data_layout", "obfuscation_score": 4, "description": "Pack structures with 2-byte alignment", "priority": "medium"},
{"flag": "-fshort-enums", "category": "data_layout", "obfuscation_score": 3, "description": "Use smallest enum type", "priority": "low"},
{"flag": "-fmerge-constants", "category": "data_layout", "obfuscation_score": 5, "description": "Merge identical constants", "priority": "medium"},
{"flag": "-fmerge-all-constants", "category": "data_layout", "obfuscation_score": 6, "description": "Aggressively merge constants", "priority": "medium"},
{"flag": "-fno-merge-constants", "category": "data_layout", "obfuscation_score": 2, "description": "Don't merge constants", "priority": "baseline"},
{"flag": "-fstrict-aliasing", "category": "data_layout", "obfuscation_score": 4, "description": "Strict aliasing optimization", "priority": "low"},
{"flag": "-fno-strict-aliasing", "category": "data_layout", "obfuscation_score": 2, "description": "Disable strict aliasing", "priority": "baseline"},
{"flag": "-malign-data=cacheline", "category": "data_layout", "obfuscation_score": 3, "description": "Align data to cache line", "priority": "low"},
{"flag": "-malign-double", "category": "data_layout", "obfuscation_score": 3, "description": "Align doubles", "priority": "low"},

# === SYMBOL VISIBILITY FLAGS ===
{"flag": "-fvisibility=hidden", "category": "symbol_visibility", "obfuscation_score": 6, "description": "Hide symbols by default", "priority": "medium"},
{"flag": "-fvisibility=protected", "category": "symbol_visibility", "obfuscation_score": 4, "description": "Protected symbol visibility", "priority": "low"},
{"flag": "-fvisibility=internal", "category": "symbol_visibility", "obfuscation_score": 5, "description": "Internal symbol visibility", "priority": "medium"},
{"flag": "-fvisibility-inlines-hidden", "category": "symbol_visibility", "obfuscation_score": 4, "description": "Hide inline functions", "priority": "low"},
{"flag": "-fno-common", "category": "symbol_visibility", "obfuscation_score": 3, "description": "No common symbols", "priority": "low"},
{"flag": "-fno-ident", "category": "symbol_visibility", "obfuscation_score": 2, "description": "Remove compiler identification", "priority": "low"},
{"flag": "-fno-plt", "category": "symbol_visibility", "obfuscation_score": 4, "description": "Disable PLT", "priority": "low"},
{"flag": "-fno-semantic-interposition", "category": "symbol_visibility", "obfuscation_score": 5, "description": "Disable semantic interposition", "priority": "medium"},

# === SECURITY HARDENING FLAGS ===
{"flag": "-fPIE", "category": "security_hardening", "obfuscation_score": 4, "description": "Position independent executable", "priority": "medium"},
{"flag": "-fPIC", "category": "security_hardening", "obfuscation_score": 4, "description": "Position independent code", "priority": "medium"},
{"flag": "-fstack-protector", "category": "security_hardening", "obfuscation_score": 3, "description": "Basic stack protection", "priority": "low"},
{"flag": "-fstack-protector-all", "category": "security_hardening", "obfuscation_score": 4, "description": "Stack protection for all functions", "priority": "medium"},
{"flag": "-fstack-protector-strong", "category": "security_hardening", "obfuscation_score": 4, "description": "Strong stack protection", "priority": "medium"},
{"flag": "-fstack-clash-protection", "category": "security_hardening", "obfuscation_score": 3, "description": "Stack clash protection", "priority": "low"},
{"flag": "-fsanitize=safe-stack", "category": "security_hardening", "obfuscation_score": 7, "description": "Safe stack implementation", "priority": "high"},
{"flag": "-fsanitize=cfi", "category": "security_hardening", "obfuscation_score": 6, "description": "Control flow integrity", "priority": "medium"},
{"flag": "-fsanitize=cfi-icall", "category": "security_hardening", "obfuscation_score": 5, "description": "CFI indirect calls", "priority": "medium"},
{"flag": "-fsanitize=cfi-vcall", "category": "security_hardening", "obfuscation_score": 5, "description": "CFI virtual calls", "priority": "medium"},
{"flag": "-fsanitize=shadow-call-stack", "category": "security_hardening", "obfuscation_score": 6, "description": "Shadow call stack", "priority": "medium"},
{"flag": "-fbounds-safety", "category": "security_hardening", "obfuscation_score": 4, "description": "Bounds safety checks", "priority": "low"},

# === ARCHITECTURE-SPECIFIC FLAGS ===
{"flag": "-march=native", "category": "architecture_specific", "obfuscation_score": 4, "description": "Target native architecture", "priority": "low"},
{"flag": "-mtune=native", "category": "architecture_specific", "obfuscation_score": 3, "description": "Tune for native CPU", "priority": "low"},
{"flag": "-mcpu=native", "category": "architecture_specific", "obfuscation_score": 3, "description": "Target native CPU", "priority": "low"},
{"flag": "-mno-red-zone", "category": "architecture_specific", "obfuscation_score": 3, "description": "Disable red zone optimization", "priority": "low"},
{"flag": "-mcmodel=small", "category": "architecture_specific", "obfuscation_score": 2, "description": "Small code model", "priority": "baseline"},
{"flag": "-mcmodel=medium", "category": "architecture_specific", "obfuscation_score": 3, "description": "Medium code model", "priority": "low"},
{"flag": "-mcmodel=large", "category": "architecture_specific", "obfuscation_score": 4, "description": "Large code model", "priority": "medium"},
{"flag": "-mretpoline", "category": "architecture_specific", "obfuscation_score": 5, "description": "Retpoline for Spectre mitigation", "priority": "medium"},
{"flag": "-mspeculative-load-hardening", "category": "architecture_specific", "obfuscation_score": 6, "description": "Speculative load hardening", "priority": "medium"},
{"flag": "-mno-speculative-load-hardening", "category": "architecture_specific", "obfuscation_score": 1, "description": "Disable speculative load hardening", "priority": "baseline"},
{"flag": "-mindirect-branch=thunk", "category": "architecture_specific", "obfuscation_score": 5, "description": "Indirect branch thunk", "priority": "medium"},
{"flag": "-mfunction-return=thunk", "category": "architecture_specific", "obfuscation_score": 5, "description": "Function return thunk", "priority": "medium"},

# === VECTORIZATION FLAGS ===
{"flag": "-ftree-vectorize", "category": "vectorization", "obfuscation_score": 5, "description": "Tree vectorization", "priority": "medium"},
{"flag": "-fvectorize", "category": "vectorization", "obfuscation_score": 5, "description": "Enable vectorization", "priority": "medium"},
{"flag": "-fno-vectorize", "category": "vectorization", "obfuscation_score": 1, "description": "Disable vectorization", "priority": "baseline"},
{"flag": "-fslp-vectorize-aggressive", "category": "vectorization", "obfuscation_score": 6, "description": "Aggressive SLP vectorization", "priority": "medium"},
{"flag": "-fno-slp-vectorize", "category": "vectorization", "obfuscation_score": 1, "description": "Disable SLP vectorization", "priority": "baseline"},
{"flag": "-mllvm -force-vector-width=4", "category": "vectorization", "obfuscation_score": 4, "description": "Force vector width 4", "priority": "low"},
{"flag": "-mllvm -force-vector-width=8", "category": "vectorization", "obfuscation_score": 5, "description": "Force vector width 8", "priority": "medium"},
{"flag": "-mllvm -force-vector-width=16", "category": "vectorization", "obfuscation_score": 5, "description": "Force vector width 16", "priority": "medium"},
{"flag": "-mllvm -force-vector-width=32", "category": "vectorization", "obfuscation_score": 6, "description": "Force vector width 32", "priority": "medium"},

# === DEAD CODE ELIMINATION FLAGS ===
{"flag": "-Wl,--gc-sections", "category": "dead_code_elimination", "obfuscation_score": 4, "description": "Linker garbage collection", "priority": "medium"},
{"flag": "-Wl,--strip-debug", "category": "dead_code_elimination", "obfuscation_score": 3, "description": "Strip debug info", "priority": "low"},
{"flag": "-Wl,--strip-all", "category": "dead_code_elimination", "obfuscation_score": 4, "description": "Strip all symbols", "priority": "medium"},
{"flag": "-fno-eliminate-unused-debug-symbols", "category": "dead_code_elimination", "obfuscation_score": 2, "description": "Keep unused debug symbols", "priority": "baseline"},
{"flag": "-fkeep-inline-functions", "category": "dead_code_elimination", "obfuscation_score": 3, "description": "Keep inline functions", "priority": "low"},
{"flag": "-fkeep-static-functions", "category": "dead_code_elimination", "obfuscation_score": 3, "description": "Keep static functions", "priority": "low"},

# === MLLVM HIDDEN FLAGS ===
{"flag": "-mllvm -disable-lsr", "category": "experimental", "obfuscation_score": 4, "description": "Disable loop strength reduction", "priority": "low"},
{"flag": "-mllvm -enable-load-pre", "category": "experimental", "obfuscation_score": 3, "description": "Enable load PRE", "priority": "low"},
{"flag": "-mllvm -disable-cgp-branch-opts", "category": "experimental", "obfuscation_score": 3, "description": "Disable CGP branch optimizations", "priority": "low"},
{"flag": "-mllvm -disable-block-placement", "category": "experimental", "obfuscation_score": 4, "description": "Disable block placement", "priority": "low"},
{"flag": "-mllvm -disable-tail-duplicate", "category": "experimental", "obfuscation_score": 3, "description": "Disable tail duplication", "priority": "low"},
{"flag": "-mllvm -disable-machine-cse", "category": "experimental", "obfuscation_score": 4, "description": "Disable machine CSE", "priority": "low"},
{"flag": "-mllvm -disable-machine-licm", "category": "experimental", "obfuscation_score": 4, "description": "Disable machine LICM", "priority": "low"},
{"flag": "-mllvm -disable-machine-sink", "category": "experimental", "obfuscation_score": 3, "description": "Disable machine sinking", "priority": "low"},
{"flag": "-mllvm -disable-peephole", "category": "experimental", "obfuscation_score": 4, "description": "Disable peephole optimization", "priority": "low"},
{"flag": "-mllvm -disable-post-regalloc-scheduler", "category": "experimental", "obfuscation_score": 3, "description": "Disable post-RA scheduler", "priority": "low"},
{"flag": "-mllvm -disable-if-conversion", "category": "experimental", "obfuscation_score": 4, "description": "Disable if-conversion", "priority": "low"},
{"flag": "-mllvm -disable-branch-fold", "category": "experimental", "obfuscation_score": 4, "description": "Disable branch folding", "priority": "low"},
{"flag": "-mllvm -disable-copyprop", "category": "experimental", "obfuscation_score": 3, "description": "Disable copy propagation", "priority": "low"},
{"flag": "-mllvm -disable-machine-dce", "category": "experimental", "obfuscation_score": 3, "description": "Disable machine DCE", "priority": "low"},

# === REGISTER ALLOCATION FLAGS ===
{"flag": "-mllvm -regalloc=greedy", "category": "register_allocation", "obfuscation_score": 3, "description": "Greedy register allocator", "priority": "low"},
{"flag": "-mllvm -regalloc=basic", "category": "register_allocation", "obfuscation_score": 4, "description": "Basic register allocator", "priority": "low"},
{"flag": "-mllvm -regalloc=fast", "category": "register_allocation", "obfuscation_score": 4, "description": "Fast register allocator", "priority": "low"},
{"flag": "-mllvm -regalloc=pbqp", "category": "register_allocation", "obfuscation_score": 5, "description": "PBQP register allocator", "priority": "medium"},

# === INSTRUCTION SCHEDULING FLAGS ===
{"flag": "-mllvm -pre-RA-sched=source", "category": "instruction_scheduling", "obfuscation_score": 3, "description": "Source order scheduling", "priority": "low"},
{"flag": "-mllvm -pre-RA-sched=list-burr", "category": "instruction_scheduling", "obfuscation_score": 4, "description": "Burr list scheduling", "priority": "low"},
{"flag": "-mllvm -pre-RA-sched=list-tdrr", "category": "instruction_scheduling", "obfuscation_score": 4, "description": "TDRR list scheduling", "priority": "low"},
{"flag": "-mllvm -pre-RA-sched=list-td", "category": "instruction_scheduling", "obfuscation_score": 4, "description": "Top-down list scheduling", "priority": "low"},
{"flag": "-mllvm -misched=shuffle", "category": "instruction_scheduling", "obfuscation_score": 5, "description": "Shuffle machine instruction scheduling", "priority": "medium"},

# === BRANCH OPTIMIZATION FLAGS ===
{"flag": "-fno-tree-switch-conversion", "category": "branch_optimization", "obfuscation_score": 5, "description": "Disable switch conversion", "priority": "medium"},
{"flag": "-fno-if-conversion", "category": "branch_optimization", "obfuscation_score": 4, "description": "Disable if-conversion", "priority": "low"},
{"flag": "-fno-if-conversion2", "category": "branch_optimization", "obfuscation_score": 4, "description": "Disable if-conversion pass 2", "priority": "low"},
{"flag": "-fno-tree-loop-if-convert", "category": "branch_optimization", "obfuscation_score": 4, "description": "Disable loop if-conversion", "priority": "low"},
{"flag": "-fno-crossjumping", "category": "branch_optimization", "obfuscation_score": 4, "description": "Disable crossjumping", "priority": "low"},

# === GLOBAL OPTIMIZATION FLAGS ===
{"flag": "-fwhole-program", "category": "global_optimization", "obfuscation_score": 6, "description": "Whole program optimization", "priority": "medium"},
{"flag": "-fno-builtin", "category": "global_optimization", "obfuscation_score": 4, "description": "Disable builtin functions", "priority": "low"},
{"flag": "-fno-builtin-malloc", "category": "global_optimization", "obfuscation_score": 3, "description": "Disable builtin malloc", "priority": "low"},
{"flag": "-fno-builtin-free", "category": "global_optimization", "obfuscation_score": 3, "description": "Disable builtin free", "priority": "low"},
{"flag": "-fno-builtin-memcpy", "category": "global_optimization", "obfuscation_score": 4, "description": "Disable builtin memcpy", "priority": "low"},
{"flag": "-fno-builtin-memset", "category": "global_optimization", "obfuscation_score": 4, "description": "Disable builtin memset", "priority": "low"},

# === STRING AND CONSTANT FLAGS ===
{"flag": "-fmerge-debug-strings", "category": "string_optimization", "obfuscation_score": 3, "description": "Merge debug strings", "priority": "low"},
{"flag": "-fno-merge-debug-strings", "category": "string_optimization", "obfuscation_score": 2, "description": "Don't merge debug strings", "priority": "baseline"},
{"flag": "-fwritable-strings", "category": "string_optimization", "obfuscation_score": 3, "description": "Writable string literals", "priority": "low"},
{"flag": "-fconst-strings", "category": "string_optimization", "obfuscation_score": 2, "description": "Const string literals", "priority": "baseline"},

# === TAIL CALL OPTIMIZATION ===
{"flag": "-foptimize-sibling-calls", "category": "tail_call_optimization", "obfuscation_score": 4, "description": "Optimize sibling calls", "priority": "low"},
{"flag": "-fno-optimize-sibling-calls", "category": "tail_call_optimization", "obfuscation_score": 2, "description": "Disable sibling call optimization", "priority": "baseline"},

# === PROFILE-GUIDED OPTIMIZATION ===
{"flag": "-fprofile-generate", "category": "pgo", "obfuscation_score": 3, "description": "Generate profile data", "priority": "low"},
{"flag": "-fprofile-use", "category": "pgo", "obfuscation_score": 5, "description": "Use profile data", "priority": "medium"},
{"flag": "-fprofile-instr-generate", "category": "pgo", "obfuscation_score": 3, "description": "Generate instrumentation profile", "priority": "low"},
{"flag": "-fprofile-instr-use", "category": "pgo", "obfuscation_score": 5, "description": "Use instrumentation profile", "priority": "medium"},

# === ADVANCED MLLVM FLAGS ===
{"flag": "-mllvm -enable-tbaa", "category": "experimental", "obfuscation_score": 3, "description": "Enable TBAA", "priority": "low"},
{"flag": "-mllvm -disable-tbaa", "category": "experimental", "obfuscation_score": 3, "description": "Disable TBAA", "priority": "low"},
{"flag": "-mllvm -enable-aa-sched-mi", "category": "experimental", "obfuscation_score": 3, "description": "Enable AA in machine scheduling", "priority": "low"},
{"flag": "-mllvm -disable-spill-fusing", "category": "experimental", "obfuscation_score": 3, "description": "Disable spill fusing", "priority": "low"},
{"flag": "-mllvm -disable-fp-elim", "category": "experimental", "obfuscation_score": 4, "description": "Disable frame pointer elimination", "priority": "low"},
{"flag": "-mllvm -disable-tail-calls", "category": "experimental", "obfuscation_score": 4, "description": "Disable tail calls", "priority": "low"},
{"flag": "-mllvm -disable-simplify-libcalls", "category": "experimental", "obfuscation_score": 4, "description": "Disable libcall simplification", "priority": "low"},
{"flag": "-mllvm -disable-delete-null-pointer-checks", "category": "experimental", "obfuscation_score": 4, "description": "Disable null pointer check deletion", "priority": "low"},

# === ANALYSIS FLAGS (that affect codegen) ===
{"flag": "-mllvm -stats", "category": "analysis", "obfuscation_score": 1, "description": "Print statistics", "priority": "baseline"},
{"flag": "-mllvm -time-passes", "category": "analysis", "obfuscation_score": 1, "description": "Time passes", "priority": "baseline"},
{"flag": "-mllvm -debug-pass=Structure", "category": "analysis", "obfuscation_score": 1, "description": "Debug pass structure", "priority": "baseline"},

# === MORE LOOP FLAGS ===
{"flag": "-mllvm -loop-unswitch-threshold=1000", "category": "loop_optimization", "obfuscation_score": 5, "description": "Loop unswitch threshold", "priority": "medium"},
{"flag": "-mllvm -unroll-threshold=1000", "category": "loop_optimization", "obfuscation_score": 6, "description": "Unroll threshold", "priority": "medium"},
{"flag": "-mllvm -unroll-count=8", "category": "loop_optimization", "obfuscation_score": 6, "description": "Unroll count", "priority": "medium"},
{"flag": "-mllvm -unroll-allow-partial", "category": "loop_optimization", "obfuscation_score": 5, "description": "Allow partial unrolling", "priority": "medium"},
{"flag": "-mllvm -unroll-runtime", "category": "loop_optimization", "obfuscation_score": 6, "description": "Runtime loop unrolling", "priority": "medium"},

# === INTERPROCEDURAL ANALYSIS FLAGS ===
{"flag": "-mllvm -inline-threshold=1000", "category": "inlining", "obfuscation_score": 7, "description": "Inline threshold 1000", "priority": "high"},
{"flag": "-mllvm -inlinehint-threshold=500", "category": "inlining", "obfuscation_score": 6, "description": "Inline hint threshold", "priority": "medium"},
{"flag": "-mllvm -inlinecold-threshold=50", "category": "inlining", "obfuscation_score": 4, "description": "Inline cold threshold", "priority": "low"},
{"flag": "-mllvm -hot-cold-split", "category": "experimental", "obfuscation_score": 5, "description": "Hot cold splitting", "priority": "medium"},

# === ADDITIONAL VECTORIZATION ===
{"flag": "-mllvm -vectorizer-maximize-bandwidth", "category": "vectorization", "obfuscation_score": 4, "description": "Maximize vectorizer bandwidth", "priority": "low"},
{"flag": "-mllvm -enable-interleaved-mem-accesses", "category": "vectorization", "obfuscation_score": 4, "description": "Enable interleaved memory accesses", "priority": "low"},
{"flag": "-mllvm -enable-masked-interleaved-mem-accesses", "category": "vectorization", "obfuscation_score": 5, "description": "Enable masked interleaved accesses", "priority": "medium"},


]

if __name__ == "__main__" and pd is not None:
    df = pd.DataFrame(comprehensive_flags)
    df.to_csv('comprehensive_llvm_obfuscation_flags_200plus.csv', index=False)

    print(f"Created comprehensive flag database with {len(comprehensive_flags)} flags")
    print("\nBreakdown by category:")
    category_counts = df['category'].value_counts()
    print(category_counts)

    print("\nBreakdown by priority:")
    priority_counts = df['priority'].value_counts()
    print(priority_counts)

    print("\nTop 30 highest scoring flags:")
    top_flags = df.nlargest(30, 'obfuscation_score')[['flag', 'category', 'obfuscation_score', 'priority', 'description']]
    print(top_flags.to_string(index=False))
elif __name__ == "__main__":
    print("pandas not installed; skipping CSV export and summaries")
