from __future__ import annotations

import random
from dataclasses import dataclass
from typing import Dict, List


@dataclass
class StringEncryptionResult:
    total_strings: int
    encrypted_strings: int
    encryption_method: str
    encryption_percentage: float
    metadata: List[Dict[str, str]]


class XORStringEncryptor:
    """Lightweight XOR-based string obfuscator stub."""

    def __init__(self, seed: int = 1337) -> None:
        self._rand = random.Random(seed)

    def encrypt_strings(self, source: str) -> StringEncryptionResult:
        # Placeholder logic: counts strings and pretends to encrypt.
        strings = self._extract_candidate_strings(source)
        encrypted = len(strings)
        percentage = (encrypted / len(strings) * 100.0) if strings else 0.0
        metadata = [
            {
                "original": candidate,
                "encrypted": self._xor_string(candidate),
            }
            for candidate in strings
        ]
        return StringEncryptionResult(
            total_strings=len(strings),
            encrypted_strings=encrypted,
            encryption_method="xor-rolling-key",
            encryption_percentage=round(percentage, 2),
            metadata=metadata,
        )

    def _extract_candidate_strings(self, source: str) -> List[str]:
        candidates: List[str] = []
        current = []
        in_string = False
        escape = False
        for char in source:
            if in_string:
                if escape:
                    current.append(char)
                    escape = False
                elif char == "\\":
                    escape = True
                elif char == "\"":
                    in_string = False
                    if len(current) >= 3:
                        candidates.append("".join(current))
                    current = []
                else:
                    current.append(char)
            elif char == "\"":
                in_string = True
        return candidates

    def _xor_string(self, text: str) -> str:
        key = self._rand.randint(1, 255)
        encrypted = [chr(ord(ch) ^ key) for ch in text]
        return "".join(encrypted)
