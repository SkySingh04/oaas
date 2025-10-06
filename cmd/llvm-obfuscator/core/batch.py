from __future__ import annotations

from pathlib import Path
from typing import Dict, List

from .config import ObfuscationConfig
from .utils import load_yaml


def load_batch_config(config_path: Path) -> List[Dict]:
    data = load_yaml(config_path)
    jobs = data.get("jobs", [])
    normalized = []
    for job in jobs:
        source = Path(job["source"]).expanduser()
        destination = Path(job.get("output", "./obfuscated")).expanduser()
        obf_config = ObfuscationConfig.from_dict(job.get("config", {}))
        normalized.append({
            "source": source,
            "config": obf_config,
            "output": destination,
        })
    return normalized
