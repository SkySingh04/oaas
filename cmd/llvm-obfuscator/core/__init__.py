"""Core package for LLVM obfuscator."""

from . import compat as _compat  # noqa: F401  # ensure compatibility patches load
from .analyzer import analyze_binary
from .comparer import compare_binaries
from .config import (
    AnalyzeConfig,
    AdvancedConfiguration,
    CompareConfig,
    ObfuscationConfig,
    ObfuscationLevel,
    OutputConfiguration,
    PassConfiguration,
    Platform,
)
from .obfuscator import LLVMObfuscator
from .reporter import ObfuscationReport

__all__ = [
    "LLVMObfuscator",
    "ObfuscationConfig",
    "PassConfiguration",
    "AdvancedConfiguration",
    "OutputConfiguration",
    "Platform",
    "ObfuscationLevel",
    "AnalyzeConfig",
    "CompareConfig",
    "ObfuscationReport",
    "analyze_binary",
    "compare_binaries",
]
