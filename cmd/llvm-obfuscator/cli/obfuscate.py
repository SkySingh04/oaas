from __future__ import annotations

import json
import logging
from pathlib import Path
from typing import Optional

import typer

from core import (
    AnalyzeConfig,
    CompareConfig,
    LLVMObfuscator,
    ObfuscationConfig,
    ObfuscationLevel,
    ObfuscationReport,
    PassConfiguration,
    Platform,
    analyze_binary,
    compare_binaries,
)
from core.batch import load_batch_config
from core.config import AdvancedConfiguration, AntiDebugConfiguration, IndirectCallConfiguration, OutputConfiguration, UPXConfiguration
from core.exceptions import ObfuscationError
from core.jotai_benchmark import JotaiBenchmarkManager, BenchmarkCategory
from core.utils import create_logger, load_yaml, normalize_flags_and_passes

app = typer.Typer(add_completion=False, help="LLVM-based binary obfuscation toolkit")
logger = create_logger("cli", logging.INFO)

# ANSI color codes
class Colors:
    RED = '\033[91m'
    GREEN = '\033[92m'
    YELLOW = '\033[93m'
    BLUE = '\033[94m'
    MAGENTA = '\033[95m'
    CYAN = '\033[96m'
    WHITE = '\033[97m'
    RESET = '\033[0m'
    BOLD = '\033[1m'


def print_banner():
    """Print OAAS ASCII art banner with colored letters."""
    # Easy to modify ASCII art - each letter can be changed independently
    # To modify: change the characters in each letter's section (O, A, A, S)
    # Colors: RED, GREEN, YELLOW, BLUE (change Colors.RED, Colors.GREEN, etc.)
    
    # Letter O (RED)
    o_line1 = f"{Colors.RED}{Colors.BOLD}  ___  "
    o_line2 = f"{Colors.RED}{Colors.BOLD} / _ \\ "
    o_line3 = f"{Colors.RED}{Colors.BOLD}| | | |"
    o_line4 = f"{Colors.RED}{Colors.BOLD}| |_| |"
    o_line5 = f"{Colors.RED}{Colors.BOLD} \\___/ "
    
    # Letter A (GREEN) - first A
    a1_line1 = f"{Colors.GREEN}{Colors.BOLD}  ___  "
    a1_line2 = f"{Colors.GREEN}{Colors.BOLD} / _ \\ "
    a1_line3 = f"{Colors.GREEN}{Colors.BOLD}| / \\ |"
    a1_line4 = f"{Colors.GREEN}{Colors.BOLD}| |_| |"
    a1_line5 = f"{Colors.GREEN}{Colors.BOLD}|_/ \\_|"
    
    # Letter A (YELLOW) - second A
    a2_line1 = f"{Colors.YELLOW}{Colors.BOLD}  ___  "
    a2_line2 = f"{Colors.YELLOW}{Colors.BOLD} / _ \\ "
    a2_line3 = f"{Colors.YELLOW}{Colors.BOLD}| / \\ |"
    a2_line4 = f"{Colors.YELLOW}{Colors.BOLD}| |_| |"
    a2_line5 = f"{Colors.YELLOW}{Colors.BOLD}|_/ \\_|"
    
    # Letter S (BLUE)
    s_line1 = f"{Colors.BLUE}{Colors.BOLD}  ___  "
    s_line2 = f"{Colors.BLUE}{Colors.BOLD} / __| "
    s_line3 = f"{Colors.BLUE}{Colors.BOLD}| (__  "
    s_line4 = f"{Colors.BLUE}{Colors.BOLD} \\___ \\"
    s_line5 = f"{Colors.BLUE}{Colors.BOLD} |___/ "
    
    banner = f"""
{o_line1}{a1_line1}{a2_line1}{s_line1}
{o_line2}{a1_line2}{a2_line2}{s_line2}
{o_line3}{a1_line3}{a2_line3}{s_line3}
{o_line4}{a1_line4}{a2_line4}{s_line4}
{o_line5}{a1_line5}{a2_line5}{s_line5}
{Colors.RESET}
"""
    typer.echo(banner, err=False)


# Create a help sub-app for organized help commands
help_app = typer.Typer(name="help", help="Detailed help and documentation", invoke_without_command=True)

@help_app.callback(invoke_without_command=True)
def help_callback(ctx: typer.Context):
    """Show basic commands, usage, and available help topics."""
    if ctx.invoked_subcommand is None:
        # Show main app help by invoking it programmatically
        import sys
        from typer.main import get_command
        from click.testing import CliRunner
        
        root_cmd = get_command(app)
        runner = CliRunner()
        result = runner.invoke(root_cmd, ['--help'])
        typer.echo(result.output)
        
        typer.echo("\nBasic Usage Examples:")
        typer.echo("  python -m cli.obfuscate compile examples/hello.c --output ./output")
        typer.echo("  python -m cli.obfuscate analyze ./output/hello")
        typer.echo("  python -m cli.obfuscate compare ./baseline/hello ./obfuscated/hello")
        
        typer.echo("\nFor detailed documentation on obfuscation layers, use:")
        typer.echo("  python -m cli.obfuscate help <topic>")
        typer.echo("\nAvailable help topics:")
        typer.echo("  layers     - Overview of obfuscation layers and architecture")
        typer.echo("  mlir       - Layer 1: MLIR obfuscation passes (string-encrypt, symbol-obfuscate, etc.)")
        typer.echo("  ollvm      - Layer 2: OLLVM obfuscation passes (flattening, substitution, etc.)")
        typer.echo("  advanced   - Layer 3: Advanced features (indirect calls, UPX, cycles, fake loops)")
        typer.echo("  strategies - Pre-configured obfuscation strategies for different use cases")
        typer.echo("  examples   - Detailed usage examples for common scenarios")

@help_app.command("layers")
def help_layers():
    """Overview of obfuscation layers and architecture."""
    typer.echo("Obfuscation Architecture - Layer Overview\n")
    typer.echo("The obfuscator applies transformations in multiple layers, each targeting")
    typer.echo("different aspects of your code. You can selectively enable/disable each layer")
    typer.echo("to achieve the desired balance between protection and performance.\n")
    typer.echo("Use 'help mlir', 'help ollvm', or 'help advanced' for detailed information.")

@help_app.command("mlir")
def help_mlir():
    """Layer 1: MLIR Obfuscation passes."""
    typer.echo("Layer 1: MLIR Obfuscation (High-Level Transformations)\n")
    typer.echo("MLIR passes operate on the Multi-Level Intermediate Representation, providing")
    typer.echo("high-level semantic obfuscation before code generation.\n")
    
    typer.echo("1. String Encryption (--enable-string-encrypt)")
    typer.echo("   • Encrypts string literals at compile-time")
    typer.echo("   • Decryption happens at runtime via injected decryption functions")
    typer.echo("   • Prevents static analysis tools from extracting sensitive strings")
    typer.echo("   • Impact: Low performance overhead, high security value\n")
    
    typer.echo("2. Symbol Obfuscation (--enable-symbol-obfuscate)")
    typer.echo("   • Renames function and variable symbols to meaningless identifiers")
    typer.echo("   • Makes reverse engineering significantly harder")
    typer.echo("   • Preserves linkage and external visibility requirements")
    typer.echo("   • Impact: Minimal performance overhead\n")
    
    typer.echo("3. Constant Obfuscation (--enable-constant-obfuscate)")
    typer.echo("   • Obfuscates numeric constants using mathematical transformations")
    typer.echo("   • Replaces direct constants with equivalent expressions")
    typer.echo("   • Hides magic numbers and configuration values")
    typer.echo("   • Impact: Negligible performance overhead\n")
    
    typer.echo("4. Crypto Hash (via config file)")
    typer.echo("   • Advanced symbol obfuscation using cryptographic hashing")
    typer.echo("   • Uses SHA-256 or other algorithms to generate symbol names")
    typer.echo("   • Provides stronger obfuscation than basic symbol obfuscation")
    typer.echo("   • Impact: Minimal overhead, replaces symbol-obfuscate")

@help_app.command("ollvm")
def help_ollvm():
    """Layer 2: OLLVM Obfuscation passes."""
    typer.echo("Layer 2: OLLVM Obfuscation (Control Flow & Instructions)\n")
    typer.echo("OLLVM (Obfuscator-LLVM) passes transform the LLVM IR to obfuscate control")
    typer.echo("flow and instruction patterns, making decompilation extremely difficult.\n")
    
    typer.echo("1. Control Flow Flattening (--enable-flattening)")
    typer.echo("   • Flattens function control flow graphs into switch-based state machines")
    typer.echo("   • Eliminates natural control flow patterns")
    typer.echo("   • Makes function logic extremely hard to follow")
    typer.echo("   • Impact: Moderate performance overhead (10-30%), very high security\n")
    
    typer.echo("2. Instruction Substitution (--enable-substitution)")
    typer.echo("   • Replaces simple instructions with equivalent complex expressions")
    typer.echo("   • Uses mathematical identities (e.g., a+b → (a^b)+2*(a&b))")
    typer.echo("   • Makes pattern matching and instruction analysis harder")
    typer.echo("   • Impact: Low to moderate overhead (5-15%)\n")
    
    typer.echo("3. Bogus Control Flow (--enable-bogus-cf)")
    typer.echo("   • Inserts fake conditional branches that always take the same path")
    typer.echo("   • Adds opaque predicates (always true/false conditions)")
    typer.echo("   • Creates dead code blocks to confuse reverse engineers")
    typer.echo("   • Impact: Moderate overhead (15-25%), high confusion value\n")
    
    typer.echo("4. Basic Block Splitting (--enable-split)")
    typer.echo("   • Splits large basic blocks into smaller fragments")
    typer.echo("   • Breaks up linear code sequences")
    typer.echo("   • Makes control flow reconstruction more difficult")
    typer.echo("   • Impact: Low overhead (5-10%)\n")
    
    typer.echo("5. Linear MBA Obfuscation (--enable-linear-mba)")
    typer.echo("   • Applies Mixed Boolean-Arithmetic transformations")
    typer.echo("   • Replaces arithmetic operations with complex bitwise expressions")
    typer.echo("   • Uses linear MBA formulas to hide operation semantics")
    typer.echo("   • Impact: Moderate overhead (10-20%)")

@help_app.command("advanced")
def help_advanced():
    """Layer 3: Advanced features and binary protection."""
    typer.echo("Layer 3: Advanced Features (Runtime & Binary Protection)\n")
    
    typer.echo("1. Indirect Call Obfuscation (--enable-indirect-calls)")
    typer.echo("   • Replaces direct function calls with indirect calls via function pointers")
    typer.echo("   • Obfuscates call graphs and function relationships")
    typer.echo("   • Options:")
    typer.echo("     --indirect-stdlib: Obfuscate standard library calls")
    typer.echo("     --indirect-custom: Obfuscate custom function calls")
    typer.echo("   • Impact: Low overhead (5-10%), breaks static call analysis\n")
    
    typer.echo("2. Fake Loops (--fake-loops N)")
    typer.echo("   • Injects N fake loops that never execute")
    typer.echo("   • Creates noise in control flow graphs")
    typer.echo("   • Range: 0-50 loops (default: 0)")
    typer.echo("   • Impact: Minimal overhead, increases binary size\n")
    
    typer.echo("3. UPX Binary Packing (--enable-upx)")
    typer.echo("   • Compresses and packs the final binary using UPX")
    typer.echo("   • Adds an unpacking layer at runtime")
    typer.echo("   • Options:")
    typer.echo("     --upx-compression: fast|default|best|brute")
    typer.echo("     --upx-lzma: Use LZMA compression algorithm")
    typer.echo("     --upx-preserve-original: Keep backup of pre-packed binary")
    typer.echo("   • Impact: Increases startup time, reduces binary size\n")
    
    typer.echo("4. Obfuscation Cycles (--cycles N)")
    typer.echo("   • Applies OLLVM passes N times in sequence")
    typer.echo("   • Each cycle further obfuscates the code")
    typer.echo("   • Range: 1-5 cycles (default: 1)")
    typer.echo("   • Impact: Exponential overhead, maximum security")

@help_app.command("strategies")
def help_strategies():
    """Pre-configured obfuscation strategies for different use cases."""
    typer.echo("Selective Obfuscation Strategies\n")
    
    typer.echo("Minimal Protection (Fast, Low Overhead):")
    typer.echo("  --enable-string-encrypt --enable-symbol-obfuscate")
    typer.echo("  • Best for: Production code needing basic protection")
    typer.echo("  • Overhead: <5%\n")
    
    typer.echo("Balanced Protection (Recommended):")
    typer.echo("  --level 3 --enable-flattening --enable-substitution --enable-string-encrypt")
    typer.echo("  • Best for: Most applications")
    typer.echo("  • Overhead: 15-25%\n")
    
    typer.echo("High Security (Maximum Protection):")
    typer.echo("  --level 5 --enable-flattening --enable-substitution --enable-bogus-cf")
    typer.echo("  --enable-split --enable-linear-mba --enable-string-encrypt")
    typer.echo("  --enable-symbol-obfuscate --enable-constant-obfuscate")
    typer.echo("  --enable-indirect-calls --cycles 3 --fake-loops 10")
    typer.echo("  • Best for: Critical security-sensitive code")
    typer.echo("  • Overhead: 50-100%\n")
    
    typer.echo("Control Flow Focus:")
    typer.echo("  --enable-flattening --enable-bogus-cf --enable-split")
    typer.echo("  • Best for: Algorithms and business logic protection")
    typer.echo("  • Overhead: 30-40%\n")
    
    typer.echo("Data Protection Focus:")
    typer.echo("  --enable-string-encrypt --enable-constant-obfuscate --enable-linear-mba")
    typer.echo("  • Best for: Protecting sensitive data and constants")
    typer.echo("  • Overhead: 10-15%")

@help_app.command("examples")
def help_examples():
    """Usage examples for common scenarios."""
    typer.echo("Usage Examples\n")
    
    typer.echo("Basic compilation:")
    typer.echo("  python -m cli.obfuscate compile examples/hello.c --output ./output\n")
    
    typer.echo("Layer 1 only (MLIR obfuscation):")
    typer.echo("  python -m cli.obfuscate compile examples/hello.c \\")
    typer.echo("    --output ./output \\")
    typer.echo("    --enable-string-encrypt \\")
    typer.echo("    --enable-symbol-obfuscate \\")
    typer.echo("    --enable-constant-obfuscate\n")
    
    typer.echo("Layer 2 only (OLLVM obfuscation):")
    typer.echo("  python -m cli.obfuscate compile examples/hello.c \\")
    typer.echo("    --output ./output \\")
    typer.echo("    --enable-flattening \\")
    typer.echo("    --enable-substitution \\")
    typer.echo("    --enable-bogus-cf \\")
    typer.echo("    --enable-split\n")
    
    typer.echo("All layers (maximum protection):")
    typer.echo("  python -m cli.obfuscate compile examples/hello.c \\")
    typer.echo("    --output ./output \\")
    typer.echo("    --level 5 \\")
    typer.echo("    --enable-flattening --enable-substitution --enable-bogus-cf \\")
    typer.echo("    --enable-split --enable-linear-mba \\")
    typer.echo("    --enable-string-encrypt --enable-symbol-obfuscate \\")
    typer.echo("    --enable-constant-obfuscate \\")
    typer.echo("    --enable-indirect-calls \\")
    typer.echo("    --cycles 3 --fake-loops 10 \\")
    typer.echo("    --enable-upx\n")
    
    typer.echo("Analyze obfuscated binary:")
    typer.echo("  python -m cli.obfuscate analyze ./output/hello\n")
    
    typer.echo("Compare original vs obfuscated:")
    typer.echo("  python -m cli.obfuscate compare ./baseline/hello ./obfuscated/hello")

# Add help sub-app to main app
app.add_typer(help_app)


@app.callback(invoke_without_command=True)
def main(ctx: typer.Context):
    """LLVM-based binary obfuscation toolkit."""
    # Print banner once for all commands
    print_banner()
    if ctx.invoked_subcommand is None:
        typer.echo(f"{Colors.CYAN}Use {Colors.GREEN}'help'{Colors.CYAN} command or {Colors.GREEN}--help{Colors.CYAN} to see available commands.{Colors.RESET}")


def _build_config(
    input_path: Path,
    output: Path,
    platform: Platform,
    level: ObfuscationLevel,
    enable_flattening: bool,
    enable_substitution: bool,
    enable_bogus_cf: bool,
    enable_split: bool,
    enable_linear_mba: bool,
    cycles: int,
    string_encryption: bool,
    symbol_obfuscation: bool,
    fake_loops: int,
    enable_indirect_calls: bool,
    indirect_stdlib: bool,
    indirect_custom: bool,
    enable_upx: bool,
    upx_compression: str,
    upx_lzma: bool,
    upx_preserve_original: bool,
    upx_custom_path: Optional[Path],
    enable_anti_debug: bool,
    report_formats: str,
    custom_flags: Optional[str],
    config_file: Optional[Path],
    custom_pass_plugin: Optional[Path],
) -> ObfuscationConfig:
    if config_file:
        data = load_yaml(config_file)
        return ObfuscationConfig.from_dict(data.get("obfuscation", data))

    flags = []
    detected_passes = {"flattening": False, "substitution": False, "boguscf": False, "split": False, "linear-mba": False}
    if custom_flags:
        raw_flags = [flag.strip() for flag in custom_flags.split(" ") if flag.strip()]
        flags, detected_passes = normalize_flags_and_passes(raw_flags)

    passes = PassConfiguration(
        flattening=enable_flattening or detected_passes.get("flattening", False),
        substitution=enable_substitution or detected_passes.get("substitution", False),
        bogus_control_flow=enable_bogus_cf or detected_passes.get("boguscf", False),
        split=enable_split or detected_passes.get("split", False),
        linear_mba=enable_linear_mba or detected_passes.get("linear-mba", False),
        string_encrypt=string_encryption,
        symbol_obfuscate=symbol_obfuscation,
    )
    indirect_call_config = IndirectCallConfiguration(
        enabled=enable_indirect_calls,
        obfuscate_stdlib=indirect_stdlib,
        obfuscate_custom=indirect_custom,
    )
    upx_config = UPXConfiguration(
        enabled=enable_upx,
        compression_level=upx_compression,
        use_lzma=upx_lzma,
        preserve_original=upx_preserve_original,
        custom_upx_path=upx_custom_path,
    )
    anti_debug_config = AntiDebugConfiguration(
        enabled=enable_anti_debug,
        techniques=["ptrace", "proc_status"],  # Default techniques
    )
    advanced = AdvancedConfiguration(
        cycles=cycles,
        fake_loops=fake_loops,
        indirect_calls=indirect_call_config,
        upx_packing=upx_config,
        anti_debug=anti_debug_config,
    )
    output_config = OutputConfiguration(directory=output, report_formats=report_formats.split(","))
    return ObfuscationConfig(
        level=level,
        platform=platform,
        compiler_flags=flags,
        passes=passes,
        advanced=advanced,
        output=output_config,
        custom_pass_plugin=custom_pass_plugin,
    )


@app.command()
def compile(
    input_file: Path = typer.Argument(..., help="C/C++ source file to obfuscate"),
    output: Path = typer.Option(Path("./obfuscated"), help="Output directory"),
    platform: Platform = typer.Option(Platform.LINUX, case_sensitive=False, help="Target platform"),
    level: int = typer.Option(3, min=1, max=5, help="Obfuscation level 1-5"),
    enable_flattening: bool = typer.Option(False, "--enable-flattening", help="Enable control flow flattening"),
    enable_substitution: bool = typer.Option(False, "--enable-substitution", help="Enable instruction substitution"),
    enable_bogus_cf: bool = typer.Option(False, "--enable-bogus-cf", help="Enable bogus control flow"),
    enable_split: bool = typer.Option(False, "--enable-split", help="Enable basic block splitting"),
    enable_linear_mba: bool = typer.Option(False, "--enable-linear-mba", help="Enable Linear MBA bitwise obfuscation"),
    enable_string_encrypt: bool = typer.Option(False, "--enable-string-encrypt", help="Enable string encryption"),
    enable_symbol_obfuscate: bool = typer.Option(False, "--enable-symbol-obfuscate", help="Enable symbol obfuscation (MLIR pass)"),
    cycles: int = typer.Option(1, help="Number of obfuscation cycles"),
    fake_loops: int = typer.Option(0, "--fake-loops", help="Number of fake loops to insert"),
    enable_indirect_calls: bool = typer.Option(False, "--enable-indirect-calls", help="Enable indirect call obfuscation"),
    indirect_stdlib: bool = typer.Option(True, "--indirect-stdlib/--no-indirect-stdlib", help="Obfuscate stdlib function calls"),
    indirect_custom: bool = typer.Option(True, "--indirect-custom/--no-indirect-custom", help="Obfuscate custom function calls"),
    enable_upx: bool = typer.Option(False, "--enable-upx", help="Enable UPX binary packing (compression + obfuscation)"),
    upx_compression: str = typer.Option("best", help="UPX compression level (fast, default, best, brute)"),
    upx_lzma: bool = typer.Option(True, "--upx-lzma/--no-upx-lzma", help="Use LZMA compression for UPX"),
    upx_preserve_original: bool = typer.Option(False, "--upx-preserve-original", help="Keep backup of pre-UPX binary"),
    upx_custom_path: Optional[Path] = typer.Option(None, "--upx-custom-path", help="Path to custom UPX binary (overrides system UPX)"),
    enable_anti_debug: bool = typer.Option(False, "--enable-anti-debug", help="Enable anti-debugging protection (ptrace, /proc/self/status checks)"),
    report_formats: str = typer.Option("json", help="Report formats (comma separated)"),
    custom_flags: Optional[str] = typer.Option(None, help="Additional compiler flags"),
    config_file: Optional[Path] = typer.Option(None, help="Load configuration from YAML/JSON file"),
    custom_pass_plugin: Optional[Path] = typer.Option(None, help="Path to custom LLVM pass plugin"),
):
    """Compile and obfuscate a source file."""
    try:
        config = _build_config(
            input_path=input_file,
            output=output,
            platform=platform,
            level=ObfuscationLevel(level),
            enable_flattening=enable_flattening,
            enable_substitution=enable_substitution,
            enable_bogus_cf=enable_bogus_cf,
            enable_split=enable_split,
            enable_linear_mba=enable_linear_mba,
            cycles=cycles,
            string_encryption=enable_string_encrypt,
            symbol_obfuscation=enable_symbol_obfuscate,
            fake_loops=fake_loops,
            enable_indirect_calls=enable_indirect_calls,
            indirect_stdlib=indirect_stdlib,
            indirect_custom=indirect_custom,
            enable_upx=enable_upx,
            upx_compression=upx_compression,
            upx_lzma=upx_lzma,
            upx_preserve_original=upx_preserve_original,
            upx_custom_path=upx_custom_path,
            enable_anti_debug=enable_anti_debug,
            report_formats=report_formats,
            custom_flags=custom_flags,
            config_file=config_file,
            custom_pass_plugin=custom_pass_plugin,
        )
        reporter = ObfuscationReport(config.output.directory)
        obfuscator = LLVMObfuscator(reporter=reporter)
        result = obfuscator.obfuscate(input_file, config)
        typer.echo(json.dumps(result, indent=2))
    except ObfuscationError as exc:
        logger.error("Obfuscation failed: %s", exc)
        raise typer.Exit(code=1)


@app.command()
def analyze(
    binary: Path = typer.Argument(..., help="Binary to analyze"),
    output: Optional[Path] = typer.Option(None, help="Output report path"),
):
    """Analyze an existing binary for obfuscation metrics."""
    config = AnalyzeConfig(binary_path=binary, output=output)
    result = analyze_binary(config)
    typer.echo(json.dumps(result, indent=2))


@app.command()
def compare(
    original: Path = typer.Argument(..., help="Original binary"),
    obfuscated: Path = typer.Argument(..., help="Obfuscated binary"),
    output: Optional[Path] = typer.Option(None, help="Comparison report path"),
):
    """Compare original and obfuscated binaries."""
    config = CompareConfig(original_binary=original, obfuscated_binary=obfuscated, output=output)
    result = compare_binaries(config)
    typer.echo(json.dumps(result, indent=2))


@app.command()
def batch(
    config_path: Path = typer.Argument(..., help="YAML configuration for batch processing"),
):
    """Run batch obfuscation jobs using YAML configuration."""
    jobs = load_batch_config(config_path)
    typer.echo(f"Loaded {len(jobs)} jobs from {config_path}")
    reporter = ObfuscationReport(Path("./reports"))
    obfuscator = LLVMObfuscator(reporter=reporter)
    for job in jobs:
        source = job["source"]
        obf_config: ObfuscationConfig = job["config"]
        obf_config.output.directory = job["output"]
        typer.echo(f"Processing {source} -> {obf_config.output.directory}")
        try:
            result = obfuscator.obfuscate(source, obf_config)
            typer.echo(json.dumps(result, indent=2))
        except ObfuscationError as exc:
            logger.error("Batch job failed for %s: %s", source, exc)


@app.command()
def jotai(
    output: Path = typer.Option(Path("./jotai_results"), help="Output directory for benchmark results"),
    category: Optional[str] = typer.Option(None, help="Benchmark category (anghaLeaves, anghaMath)"),
    limit: Optional[int] = typer.Option(None, help="Maximum number of benchmarks to test"),
    level: int = typer.Option(3, min=1, max=5, help="Obfuscation level 1-5"),
    enable_flattening: bool = typer.Option(False, "--enable-flattening", help="Enable control flow flattening"),
    enable_substitution: bool = typer.Option(False, "--enable-substitution", help="Enable instruction substitution"),
    enable_bogus_cf: bool = typer.Option(False, "--enable-bogus-cf", help="Enable bogus control flow"),
    enable_split: bool = typer.Option(False, "--enable-split", help="Enable basic block splitting"),
    string_encryption: bool = typer.Option(False, "--string-encryption", help="Enable string encryption (MLIR pass)"),
    custom_flags: Optional[str] = typer.Option(None, help="Additional compiler flags"),
    custom_pass_plugin: Optional[Path] = typer.Option(None, help="Path to custom LLVM pass plugin"),
    max_failures: int = typer.Option(5, help="Stop after this many consecutive failures"),
    cache_dir: Optional[Path] = typer.Option(None, help="Directory to cache Jotai benchmarks"),
):
    """
    Run Jotai benchmarks through obfuscation to test effectiveness.
    
    Jotai is a collection of executable C benchmarks from real-world code.
    This command downloads the benchmarks (if needed) and tests obfuscation on them.
    """
    try:
        # Initialize benchmark manager
        manager = JotaiBenchmarkManager(cache_dir=cache_dir, auto_download=True)
        
        # Determine category
        benchmark_category = None
        if category:
            try:
                benchmark_category = BenchmarkCategory(category)
            except ValueError:
                typer.echo(f"Invalid category: {category}. Use 'anghaLeaves' or 'anghaMath'", err=True)
                raise typer.Exit(code=1)
        
        # Build obfuscation config
        config = _build_config(
            input_path=Path("dummy"),  # Not used for benchmark config
            output=output,
            platform=Platform.LINUX,
            level=ObfuscationLevel(level),
            enable_flattening=enable_flattening,
            enable_substitution=enable_substitution,
            enable_bogus_cf=enable_bogus_cf,
            enable_split=enable_split,
            enable_linear_mba=False,
            cycles=1,
            string_encryption=string_encryption,
            fake_loops=0,
            enable_indirect_calls=False,
            indirect_stdlib=True,
            indirect_custom=True,
            enable_upx=False,
            upx_compression="best",
            upx_lzma=True,
            upx_preserve_original=False,
            report_formats="json",
            custom_flags=custom_flags,
            config_file=None,
            custom_pass_plugin=custom_pass_plugin,
        )
        
        # Initialize obfuscator
        reporter = ObfuscationReport(output)
        obfuscator = LLVMObfuscator(reporter=reporter)
        
        typer.echo(f"Running Jotai benchmarks with obfuscation level {level}...")
        typer.echo(f"Output directory: {output}")
        
        # Run benchmark suite
        results = manager.run_benchmark_suite(
            obfuscator=obfuscator,
            config=config,
            output_dir=output,
            category=benchmark_category,
            limit=limit,
            max_failures=max_failures
        )
        
        # Generate report
        report_file = output / "jotai_report.json"
        manager.generate_report(results, report_file)
        
        # Print summary
        typer.echo("\n" + "="*60)
        typer.echo("Jotai Benchmark Results Summary")
        typer.echo("="*60)
        typer.echo(f"Total benchmarks: {len(results)}")
        typer.echo(f"Compilation success: {sum(1 for r in results if r.compilation_success)}")
        typer.echo(f"Obfuscation success: {sum(1 for r in results if r.obfuscation_success)}")
        typer.echo(f"Functional tests passed: {sum(1 for r in results if r.functional_test_passed)}")
        typer.echo(f"\nFull report: {report_file}")
        
    except Exception as exc:
        logger.error("Jotai benchmark failed: %s", exc)
        raise typer.Exit(code=1)
    
@app.command()
def headers(
    input_file: Path = typer.Argument(..., help="C/C++ source file to obfuscate"),
    output: Optional[Path] = typer.Option(None, "--output", "-o", help="Output file (default: input_obfuscated.c)"),
    stdlib_only: bool = typer.Option(False, "--stdlib-only", help="Obfuscate only standard library functions"),
    custom_only: bool = typer.Option(False, "--custom-only", help="Obfuscate only custom functions"),
    dry_run: bool = typer.Option(False, "--dry-run", help="Show what would be obfuscated without writing output"),
    verbose: bool = typer.Option(False, "--verbose", "-v", help="Show function pointer mapping"),
):
    """Obfuscate function calls in a C/C++ source file using indirect calls via function pointers."""

    from core.indirect_call_obfuscator import obfuscate_indirect_calls

    if not input_file.exists():
        typer.echo(f"Error: Input file not found: {input_file}", err=True)
        raise typer.Exit(code=1)
    
    output_file = output or input_file.parent / f"{input_file.stem}_obfuscated{input_file.suffix}"

    if stdlib_only:
        obfuscate_stdlib = True
        obfuscate_custom = False
    elif custom_only:
        obfuscate_stdlib = False
        obfuscate_custom = True
    else:
        obfuscate_stdlib = True
        obfuscate_custom = True

    typer.echo(f"📄 Reading: {input_file}")
    source_code = input_file.read_text(encoding="utf-8", errors="replace")

    typer.echo("🔒 Obfuscating function calls...")
    typer.echo(f"   - Standard library: {'Yes' if obfuscate_stdlib else 'No'}")
    typer.echo(f"   - Custom functions: {'Yes' if obfuscate_custom else 'No'}")

    try:
        transformed_code, metadata = obfuscate_indirect_calls(
            source_code,
            input_file,
            obfuscate_stdlib=obfuscate_stdlib,
            obfuscate_custom=obfuscate_custom,
        )

        typer.echo("\n✅ Obfuscation complete:")
        typer.echo(f"   - Standard library functions: {metadata['obfuscated_stdlib_functions']}")
        typer.echo(f"   - Custom functions: {metadata['obfuscated_custom_functions']}")
        typer.echo(f"   - Total obfuscated: {metadata['total_obfuscated']}")

        if verbose:
            typer.echo("\n📋 Function pointers created:")
            for func, ptr in sorted(metadata["function_pointers"].items()):
                typer.echo(f"   {func} → {ptr}")

        if dry_run:
            typer.echo("\n Dry run mode - no file written")
            typer.echo("\n Preview (first 50 lines):")
            typer.echo("=" * 60)
            for i, line in enumerate(transformed_code.split("\n")[:50], 1):
                typer.echo(f"{i:3}: {line}")
            typer.echo("=" * 60)
        else:
            output_file.write_text(transformed_code, encoding="utf-8")
            typer.echo(f"\n💾 Output written to: {output_file}")

    except Exception as exc:
        typer.echo(f"\n❌ Error during obfuscation: {exc}", err=True)
        if verbose:
            import traceback
            traceback.print_exc()
        raise typer.Exit(code=1)


if __name__ == "__main__":
    app()
