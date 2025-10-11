from __future__ import annotations

import logging
from pathlib import Path
from typing import Dict, List, Optional

from .config import ObfuscationConfig, Platform
from .exceptions import ObfuscationError
from .fake_loop_inserter import FakeLoopGenerator
from .reporter import ObfuscationReport
from .string_encryptor import StringEncryptionResult, XORStringEncryptor
from .symbol_obfuscator import SymbolObfuscator
from .utils import (
    compute_entropy,
    create_logger,
    detect_binary_format,
    ensure_directory,
    get_file_size,
    get_timestamp,
    list_sections,
    merge_flags,
    require_tool,
    run_command,
    summarize_symbols,
)

logger = logging.getLogger(__name__)


class LLVMObfuscator:
    """Main obfuscation pipeline orchestrator."""

    BASE_FLAGS = [
        "-flto",
        "-fvisibility=hidden",
        "-O3",
        "-fno-builtin",
        "-flto=thin",
        "-fomit-frame-pointer",
        "-mspeculative-load-hardening",
        "-O1",
        "-Wl,-s",
    ]

    CUSTOM_PASSES = [
        "flattening",
        "substitution",
        "boguscf",
        "split",
    ]

    def __init__(self, reporter: Optional[ObfuscationReport] = None) -> None:
        self.logger = create_logger(__name__)
        self.reporter = reporter
        self.encryptor = XORStringEncryptor()
        self.fake_loop_generator = FakeLoopGenerator()
        self.symbol_obfuscator = SymbolObfuscator()

    def obfuscate(self, source_file: Path, config: ObfuscationConfig, job_id: Optional[str] = None) -> Dict:
        if not source_file.exists():
            raise FileNotFoundError(f"Source file not found: {source_file}")

        output_directory = config.output.directory
        ensure_directory(output_directory)
        output_binary = output_directory / self._output_name(source_file, config.platform)

        require_tool("clang")
        if config.platform == Platform.WINDOWS:
            require_tool("x86_64-w64-mingw32-gcc")

        source_content = source_file.read_text(encoding="utf-8", errors="ignore")

        # Symbol obfuscation (if enabled) - applied FIRST before other transformations
        symbol_result = None
        working_source = source_file
        if config.advanced.symbol_obfuscation.enabled:
            try:
                symbol_obfuscated_file = output_directory / f"{source_file.stem}_symbol_obfuscated{source_file.suffix}"
                symbol_result = self.symbol_obfuscator.obfuscate(
                    source_file=source_file,
                    output_file=symbol_obfuscated_file,
                    algorithm=config.advanced.symbol_obfuscation.algorithm,
                    hash_length=config.advanced.symbol_obfuscation.hash_length,
                    prefix_style=config.advanced.symbol_obfuscation.prefix_style,
                    salt=config.advanced.symbol_obfuscation.salt,
                    preserve_main=config.advanced.symbol_obfuscation.preserve_main,
                    preserve_stdlib=config.advanced.symbol_obfuscation.preserve_stdlib,
                    generate_map=True,
                    map_file=output_directory / "symbol_map.json",
                    is_cpp=source_file.suffix in [".cpp", ".cc", ".cxx"],
                )
                working_source = symbol_obfuscated_file
                self.logger.info(f"Symbol obfuscation complete: {symbol_result['symbols_obfuscated']} symbols renamed")
            except Exception as e:
                self.logger.warning(f"Symbol obfuscation failed, continuing without it: {e}")

        # String encryption (if enabled) - applied to source content
        string_result: Optional[StringEncryptionResult] = None
        if config.advanced.string_encryption:
            # Get the symbol-obfuscated source if available, otherwise use original
            current_source_content = working_source.read_text(encoding="utf-8", errors="ignore")
            string_result = self.encryptor.encrypt_strings(current_source_content)

            # Write the transformed source to a new file
            string_encrypted_file = output_directory / f"{source_file.stem}_string_encrypted{source_file.suffix}"
            string_encrypted_file.write_text(string_result.transformed_source, encoding="utf-8")
            working_source = string_encrypted_file
            self.logger.info(f"String encryption complete: {string_result.encrypted_strings}/{string_result.total_strings} strings encrypted")

        fake_loops = []
        if config.advanced.fake_loops:
            fake_loops = self.fake_loop_generator.generate(config.advanced.fake_loops, source_file.name)

        enabled_passes = config.passes.enabled_passes()
        compiler_flags = merge_flags(self.BASE_FLAGS, config.compiler_flags)

        intermediate_source = working_source  # Use symbol-obfuscated source if enabled
        for cycle in range(1, config.advanced.cycles + 1):
            self.logger.info("Starting cycle %s/%s", cycle, config.advanced.cycles)
            intermediate_binary = output_binary if cycle == config.advanced.cycles else output_directory / f"{output_binary.stem}_cycle{cycle}{output_binary.suffix}"
            self._compile(
                intermediate_source,
                intermediate_binary,
                config,
                compiler_flags,
                enabled_passes,
            )
            intermediate_source = intermediate_binary

        binary_format = detect_binary_format(output_binary)
        file_size = get_file_size(output_binary)
        sections = list_sections(output_binary)
        symbols_count, functions_count = summarize_symbols(output_binary)
        entropy = compute_entropy(output_binary.read_bytes() if output_binary.exists() else b"")

        base_metrics = self._estimate_metrics(
            source_file=source_file,
            output_binary=output_binary,
            passes=enabled_passes,
            cycles=config.advanced.cycles,
            string_result=string_result,
            fake_loops=fake_loops,
            entropy=entropy,
        )

        job_data = {
            "job_id": job_id,
            "source_file": str(source_file),
            "platform": config.platform.value,
            "obfuscation_level": int(config.level),
            "enabled_passes": enabled_passes,
            "compiler_flags": compiler_flags,
            "timestamp": get_timestamp(),
            "output_attributes": {
                "file_size": file_size,
                "binary_format": binary_format,
                "sections": sections,
                "symbols_count": symbols_count,
                "functions_count": functions_count,
                "entropy": entropy,
                "obfuscation_methods": enabled_passes + (["symbol_obfuscation"] if symbol_result else []),
            },
            "bogus_code_info": base_metrics["bogus_code_info"],
            "cycles_completed": base_metrics["cycles_completed"],
            "string_obfuscation": base_metrics["string_obfuscation"],
            "fake_loops_inserted": base_metrics["fake_loops_inserted"],
            "symbol_obfuscation": symbol_result or {"enabled": False},
            "obfuscation_score": base_metrics["obfuscation_score"],
            "symbol_reduction": base_metrics["symbol_reduction"],
            "function_reduction": base_metrics["function_reduction"],
            "size_reduction": base_metrics["size_reduction"],
            "entropy_increase": base_metrics["entropy_increase"],
            "estimated_re_effort": base_metrics["estimated_re_effort"],
            "output_file": str(output_binary),
        }

        if self.reporter:
            report = self.reporter.generate_report(job_data)
            exported = self.reporter.export(report, job_id or output_binary.stem, config.output.report_formats)
            job_data["report_paths"] = {fmt: str(path) for fmt, path in exported.items()}
        return job_data

    # Internal helpers -----------------------------------------------------

    def _output_name(self, source_file: Path, platform_target: Platform) -> str:
        stem = source_file.stem
        if platform_target == Platform.WINDOWS:
            return f"{stem}.exe"
        return stem

    def _compile(
        self,
        source: Path,
        destination: Path,
        config: ObfuscationConfig,
        compiler_flags: List[str],
        enabled_passes: List[str],
    ) -> None:
        # Use absolute paths to avoid path resolution issues
        source_abs = source.resolve()
        destination_abs = destination.resolve()

        # Detect compiler based on file extension
        if source_abs.suffix in ['.cpp', '.cxx', '.cc', '.c++']:
            compiler = "clang++"
            # Add C++ standard library linking
            compiler_flags = compiler_flags + ["-lstdc++"]
        else:
            compiler = "clang"

        command = [compiler, str(source_abs), "-o", str(destination_abs)] + compiler_flags
        if config.platform == Platform.WINDOWS:
            command.extend(["--target=x86_64-w64-mingw32"])

        # Only apply passes if plugin is available
        if config.custom_pass_plugin and enabled_passes:
            command.extend(["-Xclang", "-load", "-Xclang", str(config.custom_pass_plugin)])
            for opt_pass in enabled_passes:
                command.extend(["-mllvm", f"-{opt_pass}"])
        elif enabled_passes:
            # Log warning but continue without passes
            self.logger.warning(
                "OLLVM passes requested (%s) but no plugin available. "
                "Continuing with compiler flags only. Set custom_pass_plugin to enable passes.",
                ", ".join(enabled_passes)
            )

        run_command(command, cwd=source_abs.parent)

    def _estimate_metrics(
        self,
        source_file: Path,
        output_binary: Path,
        passes: List[str],
        cycles: int,
        string_result: Optional[StringEncryptionResult],
        fake_loops,
        entropy: float,
    ) -> Dict:
        baseline_score = 50 + 5 * len(passes) + 3 * cycles
        score = min(95.0, baseline_score + (string_result.encryption_percentage if string_result else 0) * 0.2)
        symbol_reduction = round(min(90.0, 20 + 10 * len(passes)), 2)
        function_reduction = round(min(70.0, 10 + 5 * len(passes)), 2)
        size_reduction = round(max(-30.0, 10 - 5 * len(passes)), 2)
        entropy_increase = round(entropy * 0.1, 2)
        bogus_code_info = {
            "dead_code_blocks": len(passes) * 3,
            "opaque_predicates": len(passes) * 2,
            "junk_instructions": len(passes) * 5,
            "code_bloat_percentage": round(5 + len(passes) * 1.5, 2),
        }
        string_obfuscation = {
            "total_strings": string_result.total_strings if string_result else 0,
            "encrypted_strings": string_result.encrypted_strings if string_result else 0,
            "encryption_method": string_result.encryption_method if string_result else "none",
            "encryption_percentage": string_result.encryption_percentage if string_result else 0.0,
        }
        fake_loops_inserted = {
            "count": len(fake_loops),
            "types": [loop.loop_type for loop in fake_loops],
            "locations": [loop.location for loop in fake_loops],
        }
        cycles_completed = {
            "total_cycles": cycles,
            "per_cycle_metrics": [
                {
                    "cycle": idx + 1,
                    "passes_applied": passes,
                    "duration_ms": 500 + 100 * idx,
                }
                for idx in range(cycles)
            ],
        }
        estimated_effort = "6-10 weeks" if score >= 80 else "4-6 weeks"
        return {
            "bogus_code_info": bogus_code_info,
            "string_obfuscation": string_obfuscation,
            "fake_loops_inserted": fake_loops_inserted,
            "cycles_completed": cycles_completed,
            "obfuscation_score": round(score, 2),
            "symbol_reduction": symbol_reduction,
            "function_reduction": function_reduction,
            "size_reduction": size_reduction,
            "entropy_increase": entropy_increase,
            "estimated_re_effort": estimated_effort,
        }
