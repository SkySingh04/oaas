from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum
from pathlib import Path
from typing import Dict, List, Optional


class Platform(str, Enum):
    LINUX = "linux"
    WINDOWS = "windows"

    @classmethod
    def from_string(cls, value: str) -> "Platform":
        normalized = value.lower()
        try:
            return cls(normalized)
        except ValueError as exc:
            raise ValueError(f"Unsupported platform: {value}") from exc


class ObfuscationLevel(int, Enum):
    MINIMAL = 1
    LOW = 2
    MEDIUM = 3
    HIGH = 4
    MAXIMUM = 5


@dataclass
class PassConfiguration:
    flattening: bool = False
    substitution: bool = False
    bogus_control_flow: bool = False
    split: bool = False
    linear_mba: bool = False

    def enabled_passes(self) -> List[str]:
        mapping = {
            "flattening": self.flattening,
            "substitution": self.substitution,
            "boguscf": self.bogus_control_flow,
            "split": self.split,  # Note: New PM uses "split", legacy uses "splitbbl"
            "linear-mba": self.linear_mba,
        }
        return [name for name, enabled in mapping.items() if enabled]


@dataclass
class SymbolObfuscationConfiguration:
    enabled: bool = False
    algorithm: str = "sha256"  # sha256, blake2b, siphash
    hash_length: int = 12
    prefix_style: str = "typed"  # none, typed, underscore
    salt: Optional[str] = None
    preserve_main: bool = True
    preserve_stdlib: bool = True


@dataclass
class AdvancedConfiguration:
    cycles: int = 1
    string_encryption: bool = False
    fake_loops: int = 0
    symbol_obfuscation: SymbolObfuscationConfiguration = field(default_factory=SymbolObfuscationConfiguration)


@dataclass
class OutputConfiguration:
    directory: Path
    report_formats: List[str] = field(default_factory=lambda: ["json"])  # json, html, pdf


@dataclass
class ObfuscationConfig:
    level: ObfuscationLevel = ObfuscationLevel.MEDIUM
    platform: Platform = Platform.LINUX
    compiler_flags: List[str] = field(default_factory=list)
    passes: PassConfiguration = field(default_factory=PassConfiguration)
    advanced: AdvancedConfiguration = field(default_factory=AdvancedConfiguration)
    output: OutputConfiguration = field(default_factory=lambda: OutputConfiguration(Path("./obfuscated")))
    custom_pass_plugin: Optional[Path] = None

    @classmethod
    def from_dict(cls, data: Dict) -> "ObfuscationConfig":
        level = ObfuscationLevel(data.get("level", ObfuscationLevel.MEDIUM))
        platform = Platform.from_string(data.get("platform", Platform.LINUX.value))
        compiler_flags = data.get("compiler_flags", [])
        passes_data = data.get("passes", {})
        passes = PassConfiguration(
            flattening=passes_data.get("flattening", False),
            substitution=passes_data.get("substitution", False),
            bogus_control_flow=passes_data.get("bogus_control_flow", False),
            split=passes_data.get("split", False),
            linear_mba=passes_data.get("linear_mba", False),
        )
        adv_data = data.get("advanced", {})
        advanced = AdvancedConfiguration(
            cycles=adv_data.get("cycles", 1),
            string_encryption=adv_data.get("string_encryption", False),
            fake_loops=adv_data.get("fake_loops", 0),
        )
        output_data = data.get("output", {})
        output = OutputConfiguration(
            directory=Path(output_data.get("directory", "./obfuscated")),
            report_formats=output_data.get("report_format", ["json"]),
        )
        custom_pass_plugin = data.get("custom_pass_plugin")
        if custom_pass_plugin:
            custom_pass_plugin = Path(custom_pass_plugin)
        return cls(
            level=level,
            platform=platform,
            compiler_flags=compiler_flags,
            passes=passes,
            advanced=advanced,
            output=output,
            custom_pass_plugin=custom_pass_plugin,
        )


@dataclass
class AnalyzeConfig:
    binary_path: Path
    output: Optional[Path] = None


@dataclass
class CompareConfig:
    original_binary: Path
    obfuscated_binary: Path
    output: Optional[Path] = None
