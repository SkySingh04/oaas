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
from core.config import AdvancedConfiguration, OutputConfiguration
from core.exceptions import ObfuscationError
from core.utils import create_logger, load_yaml

app = typer.Typer(add_completion=False, help="LLVM-based binary obfuscation toolkit")
logger = create_logger("cli", logging.INFO)


def _build_config(
    input_path: Path,
    output: Path,
    platform: Platform,
    level: ObfuscationLevel,
    enable_flattening: bool,
    enable_substitution: bool,
    enable_bogus_cf: bool,
    enable_split: bool,
    cycles: int,
    string_encryption: bool,
    fake_loops: int,
    report_formats: str,
    custom_flags: Optional[str],
    config_file: Optional[Path],
    custom_pass_plugin: Optional[Path],
) -> ObfuscationConfig:
    if config_file:
        data = load_yaml(config_file)
        return ObfuscationConfig.from_dict(data.get("obfuscation", data))

    flags = []
    if custom_flags:
        flags = [flag.strip() for flag in custom_flags.split(" ") if flag.strip()]

    passes = PassConfiguration(
        flattening=enable_flattening,
        substitution=enable_substitution,
        bogus_control_flow=enable_bogus_cf,
        split=enable_split,
    )
    advanced = AdvancedConfiguration(
        cycles=cycles,
        string_encryption=string_encryption,
        fake_loops=fake_loops,
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
    level: ObfuscationLevel = typer.Option(ObfuscationLevel.MEDIUM, help="Obfuscation level 1-5"),
    enable_flattening: bool = typer.Option(False, "--enable-flattening", help="Enable control flow flattening"),
    enable_substitution: bool = typer.Option(False, "--enable-substitution", help="Enable instruction substitution"),
    enable_bogus_cf: bool = typer.Option(False, "--enable-bogus-cf", help="Enable bogus control flow"),
    enable_split: bool = typer.Option(False, "--enable-split", help="Enable basic block splitting"),
    cycles: int = typer.Option(1, help="Number of obfuscation cycles"),
    string_encryption: bool = typer.Option(False, "--string-encryption", help="Enable string encryption"),
    fake_loops: int = typer.Option(0, "--fake-loops", help="Number of fake loops to insert"),
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
            level=level,
            enable_flattening=enable_flattening,
            enable_substitution=enable_substitution,
            enable_bogus_cf=enable_bogus_cf,
            enable_split=enable_split,
            cycles=cycles,
            string_encryption=string_encryption,
            fake_loops=fake_loops,
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


if __name__ == "__main__":
    app()
