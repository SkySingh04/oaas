"""
Symbol Table Cryptographic Obfuscation Integration

Wraps the C++ symbol obfuscator for use in the Python CLI/API pipeline.
"""

from __future__ import annotations

import json
import logging
import subprocess
from pathlib import Path
from typing import Dict, Optional

from .exceptions import ObfuscationError
from .utils import create_logger, ensure_directory, require_tool

logger = create_logger(__name__)


class SymbolObfuscator:
    """Symbol table cryptographic obfuscation using C++ tool."""

    TOOL_PATH = Path(__file__).parent.parent.parent.parent / "symbol-obfuscator" / "build" / "symbol-obfuscate"

    def __init__(self):
        self.logger = create_logger(__name__)
        self._check_tool()

    def _check_tool(self):
        """Check if symbol obfuscator tool is built."""
        if not self.TOOL_PATH.exists():
            self.logger.warning(
                f"Symbol obfuscator not found at {self.TOOL_PATH}. "
                "Build it with: cd symbol-obfuscator && mkdir -p build && cd build && cmake .. && make"
            )
            return False
        return True

    def obfuscate(
        self,
        source_file: Path,
        output_file: Path,
        algorithm: str = "sha256",
        hash_length: int = 12,
        prefix_style: str = "typed",
        salt: Optional[str] = None,
        preserve_main: bool = True,
        preserve_stdlib: bool = True,
        generate_map: bool = True,
        map_file: Optional[Path] = None,
        is_cpp: bool = False,
    ) -> Dict:
        """
        Obfuscate symbols in source code.

        Args:
            source_file: Input source file
            output_file: Output obfuscated file
            algorithm: Hash algorithm (sha256, blake2b, siphash)
            hash_length: Length of hash in characters
            prefix_style: Prefix style (none, typed, underscore)
            salt: Custom salt for hashing
            preserve_main: Preserve main() function
            preserve_stdlib: Preserve stdlib functions
            generate_map: Generate mapping file
            map_file: Path to mapping file
            is_cpp: Treat as C++ code

        Returns:
            Dict with obfuscation results
        """
        if not self._check_tool():
            raise ObfuscationError(
                "Symbol obfuscator tool not available. "
                "Please build it first or disable symbol obfuscation."
            )

        if not source_file.exists():
            raise FileNotFoundError(f"Source file not found: {source_file}")

        ensure_directory(output_file.parent)

        # Build command
        cmd = [
            str(self.TOOL_PATH),
            str(source_file),
            "-o", str(output_file),
            "--algorithm", algorithm,
            "--length", str(hash_length),
            "--prefix", prefix_style,
        ]

        if salt:
            cmd.extend(["--salt", salt])

        if not preserve_main:
            cmd.append("--no-preserve-main")

        if not preserve_stdlib:
            cmd.append("--no-preserve-stdlib")

        if not generate_map:
            cmd.append("--no-map")

        if map_file:
            cmd.extend(["--map", str(map_file)])

        if is_cpp:
            cmd.append("--cpp")

        # Run tool
        self.logger.info(f"Running symbol obfuscation: {' '.join(cmd)}")

        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                check=True,
                timeout=60,
            )

            self.logger.info(f"Symbol obfuscation completed: {result.stdout}")

            # Parse mapping file if generated
            mappings = []
            if generate_map:
                map_path = map_file or (output_file.parent / "symbol_map.json")
                if map_path.exists():
                    with open(map_path) as f:
                        map_data = json.load(f)
                        mappings = map_data.get("symbols", [])

            return {
                "success": True,
                "symbols_obfuscated": len(mappings),
                "mapping_file": str(map_file or (output_file.parent / "symbol_map.json")),
                "output_file": str(output_file),
                "algorithm": algorithm,
                "hash_length": hash_length,
            }

        except subprocess.TimeoutExpired:
            raise ObfuscationError("Symbol obfuscation timed out after 60 seconds")

        except subprocess.CalledProcessError as e:
            self.logger.error(f"Symbol obfuscation failed: {e.stderr}")
            raise ObfuscationError(f"Symbol obfuscation failed: {e.stderr}")

        except Exception as e:
            raise ObfuscationError(f"Symbol obfuscation error: {str(e)}")

    def analyze_symbols(self, binary: Path) -> Dict:
        """
        Analyze symbols in a binary.

        Args:
            binary: Binary file to analyze

        Returns:
            Dict with symbol statistics
        """
        try:
            # Use nm to list symbols
            result = subprocess.run(
                ["nm", str(binary)],
                capture_output=True,
                text=True,
                check=False,
            )

            lines = result.stdout.strip().split("\n")
            symbols = []
            functions = 0
            variables = 0

            for line in lines:
                parts = line.split()
                if len(parts) >= 3:
                    symbol_type = parts[1]
                    symbol_name = parts[2]

                    symbols.append({
                        "name": symbol_name,
                        "type": symbol_type,
                    })

                    if symbol_type in ["T", "t"]:  # Text (function)
                        functions += 1
                    elif symbol_type in ["D", "d", "B", "b"]:  # Data
                        variables += 1

            # Check for readable function names
            readable_count = sum(
                1 for sym in symbols
                if any(keyword in sym["name"].lower() for keyword in ["validate", "check", "auth", "license", "key"])
            )

            return {
                "total_symbols": len(symbols),
                "function_symbols": functions,
                "variable_symbols": variables,
                "readable_names": readable_count,
                "obfuscation_level": "none" if readable_count > 0 else "high",
            }

        except Exception as e:
            self.logger.error(f"Symbol analysis failed: {str(e)}")
            return {
                "total_symbols": 0,
                "function_symbols": 0,
                "variable_symbols": 0,
                "readable_names": 0,
                "obfuscation_level": "unknown",
                "error": str(e),
            }
