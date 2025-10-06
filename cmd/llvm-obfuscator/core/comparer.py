from __future__ import annotations

from pathlib import Path
from typing import Dict

from .config import CompareConfig
from .utils import compute_entropy, get_file_size, write_json


def compare_binaries(config: CompareConfig) -> Dict:
    original = Path(config.original_binary)
    obfuscated = Path(config.obfuscated_binary)
    comparison = {
        "original": {
            "path": str(original),
            "size": get_file_size(original),
            "entropy": compute_entropy(original.read_bytes() if original.exists() else b""),
        },
        "obfuscated": {
            "path": str(obfuscated),
            "size": get_file_size(obfuscated),
            "entropy": compute_entropy(obfuscated.read_bytes() if obfuscated.exists() else b""),
        },
        "size_delta": get_file_size(obfuscated) - get_file_size(original),
        "entropy_delta": compute_entropy(obfuscated.read_bytes() if obfuscated.exists() else b"")
        - compute_entropy(original.read_bytes() if original.exists() else b""),
    }
    if config.output:
        write_json(config.output, comparison)
    return comparison
