from __future__ import annotations

from pathlib import Path
from typing import Dict

from .config import AnalyzeConfig
from .utils import compute_entropy, detect_binary_format, get_file_size, list_sections, summarize_symbols


def analyze_binary(config: AnalyzeConfig) -> Dict:
    binary = config.binary_path
    binary_format = detect_binary_format(binary)
    file_size = get_file_size(binary)
    sections = list_sections(binary)
    symbols_count, functions_count = summarize_symbols(binary)
    entropy = compute_entropy(binary.read_bytes() if binary.exists() else b"")
    report = {
        "binary": str(binary),
        "file_size": file_size,
        "binary_format": binary_format,
        "sections": sections,
        "symbols_count": symbols_count,
        "functions_count": functions_count,
        "entropy": entropy,
    }
    if config.output:
        from .utils import write_json

        write_json(config.output, report)
    return report
