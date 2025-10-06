from __future__ import annotations

import base64
import json
import logging
import os
import platform
import shutil
import subprocess
import tempfile
from datetime import datetime
from pathlib import Path
from typing import Dict, Iterable, List, Optional, Tuple

from .exceptions import ObfuscationError, ToolchainNotFoundError

logger = logging.getLogger(__name__)


def ensure_directory(path: Path) -> None:
    path.mkdir(parents=True, exist_ok=True)


def run_command(command: List[str], cwd: Optional[Path] = None, env: Optional[Dict[str, str]] = None) -> Tuple[int, str, str]:
    logger.debug("Executing command: %s", " ".join(command))
    process = subprocess.Popen(
        command,
        cwd=str(cwd) if cwd else None,
        env=env,
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        text=True,
    )
    stdout, stderr = process.communicate()
    logger.debug("Command stdout: %s", stdout)
    if stderr:
        logger.debug("Command stderr: %s", stderr)
    if process.returncode != 0:
        raise ObfuscationError(f"Command failed with exit code {process.returncode}: {' '.join(command)}\n{stderr}")
    return process.returncode, stdout, stderr


def tool_exists(tool_name: str) -> bool:
    return shutil.which(tool_name) is not None


def require_tool(tool_name: str) -> None:
    if not tool_exists(tool_name):
        raise ToolchainNotFoundError(f"Required tool '{tool_name}' not found in PATH")


def get_timestamp() -> str:
    return datetime.utcnow().isoformat() + "Z"


def detect_binary_format(binary_path: Path) -> str:
    if not binary_path.exists():
        return "unknown"
    with binary_path.open("rb") as f:
        magic = f.read(4)
    if magic.startswith(b"\x7fELF"):
        return "ELF"
    if magic[:2] in (b"MZ", b"ZM"):
        return "PE"
    return "unknown"


def compute_entropy(data: bytes) -> float:
    if not data:
        return 0.0
    from math import log2

    entropy = 0.0
    length = len(data)
    counts = [0] * 256
    for byte in data:
        counts[byte] += 1
    for count in counts:
        if count == 0:
            continue
        p = count / length
        entropy -= p * log2(p)
    return round(entropy, 3)


def get_file_size(path: Path) -> int:
    return path.stat().st_size if path.exists() else 0


def base64_to_file(content_b64: str, destination: Path) -> None:
    decoded = base64.b64decode(content_b64)
    destination.write_bytes(decoded)


def read_json(path: Path) -> Dict:
    with path.open("r", encoding="utf-8") as f:
        return json.load(f)


def write_json(path: Path, data: Dict) -> None:
    ensure_directory(path.parent)
    with path.open("w", encoding="utf-8") as f:
        json.dump(data, f, indent=2)


def write_text(path: Path, content: str) -> None:
    ensure_directory(path.parent)
    with path.open("w", encoding="utf-8") as f:
        f.write(content)


def create_temp_directory(prefix: str = "obf-") -> tempfile.TemporaryDirectory[str]:
    return tempfile.TemporaryDirectory(prefix=prefix)


def get_platform_triple(target_platform: str) -> str:
    system = target_platform.lower()
    if system == "linux":
        return "x86_64-pc-linux-gnu"
    if system == "windows":
        return "x86_64-pc-windows-msvc"
    return platform.machine()


def merge_flags(base: Iterable[str], extra: Optional[Iterable[str]] = None) -> List[str]:
    merged = list(base)
    if extra:
        for flag in extra:
            if flag not in merged:
                merged.append(flag)
    return merged


def summarize_symbols(binary_path: Path) -> Tuple[int, int]:
    if not binary_path.exists():
        return 0, 0
    nm_tool = "llvm-nm" if tool_exists("llvm-nm") else "nm"
    try:
        _, stdout, _ = run_command([nm_tool, str(binary_path)])
    except ObfuscationError:
        return 0, 0
    symbols = stdout.splitlines()
    functions = [line for line in symbols if " T " in line or " t " in line]
    return len(symbols), len(functions)


def write_html(path: Path, content: str) -> None:
    ensure_directory(path.parent)
    with path.open("w", encoding="utf-8") as f:
        f.write(content)


def write_pdf_placeholder(path: Path) -> None:
    ensure_directory(path.parent)
    placeholder = "PDF generation not implemented in sandbox."
    path.write_text(placeholder, encoding="utf-8")


def list_sections(binary_path: Path) -> Dict[str, int]:
    if not binary_path.exists():
        return {}
    objdump = "llvm-objdump" if tool_exists("llvm-objdump") else "objdump"
    try:
        _, stdout, _ = run_command([objdump, "-h", str(binary_path)])
    except ObfuscationError:
        return {}
    sections: Dict[str, int] = {}
    for line in stdout.splitlines():
        parts = line.split()
        if len(parts) >= 4 and parts[0].isdigit():
            name = parts[1]
            size = int(parts[2], 16)
            sections[name] = size
    return sections


def current_platform() -> str:
    return platform.system().lower()


def is_windows_platform() -> bool:
    return current_platform().startswith("win")


def make_executable(path: Path) -> None:
    mode = path.stat().st_mode
    path.chmod(mode | 0o111)


def load_yaml(path: Path) -> Dict:
    import yaml

    with path.open("r", encoding="utf-8") as f:
        return yaml.safe_load(f)


def dump_yaml(path: Path, data: Dict) -> None:
    import yaml

    ensure_directory(path.parent)
    with path.open("w", encoding="utf-8") as f:
        yaml.safe_dump(data, f, sort_keys=False)


def create_logger(name: str, level: int = logging.INFO) -> logging.Logger:
    logger = logging.getLogger(name)
    if not logger.handlers:
        handler = logging.StreamHandler()
        formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
        handler.setFormatter(formatter)
        logger.addHandler(handler)
    logger.setLevel(level)
    return logger


def read_text(path: Path) -> str:
    with path.open("r", encoding="utf-8") as f:
        return f.read()
