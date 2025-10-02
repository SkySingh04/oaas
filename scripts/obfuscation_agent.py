#!/usr/bin/env python3
"""CLI entry point for the autonomous LLVM flag optimization agent."""

from __future__ import annotations

import json
from pathlib import Path
from typing import Dict, List, Optional
import sys

import typer

from agno.agent import Agent
from agno.tools import tool

CURRENT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = CURRENT_DIR.parent
if str(PROJECT_ROOT) not in sys.path:
    sys.path.append(str(PROJECT_ROOT))

from scripts.flag_optimizer import optimize_flags
from scripts import flags as flag_catalog
from scripts.llvm_agent import build_agent


APP = typer.Typer(add_completion=False, help="Autonomous LLVM flag optimization agent")


def _select_candidate_flags(
    *,
    categories: Optional[List[str]] = None,
    priorities: Optional[List[str]] = None,
    limit: Optional[int] = None,
) -> List[str]:
    """Filter the comprehensive flag list based on metadata."""

    categories = [c.lower() for c in categories or []]
    priorities = [p.lower() for p in priorities or []]

    def _matches(entry: Dict[str, str]) -> bool:
        category_ok = not categories or entry.get("category", "").lower() in categories
        priority_ok = not priorities or entry.get("priority", "").lower() in priorities
        return category_ok and priority_ok

    filtered = [f["flag"] for f in flag_catalog.comprehensive_flags if _matches(f)]

    if limit is not None:
        return filtered[: limit if limit >= 0 else None]
    return filtered


@tool
def list_candidate_flags(
    categories: Optional[List[str]] = None,
    priorities: Optional[List[str]] = None,
    limit: Optional[int] = None,
) -> List[str]:
    """Return candidate flags filtered by category/priority (tool accessible to the agent)."""

    return _select_candidate_flags(
        categories=categories,
        priorities=priorities,
        limit=limit,
    )


@tool
def optimize_flags_sequence(
    source_file: str,
    output_dir: Optional[str] = None,
    base_flags: Optional[List[str]] = None,
    flag_list: Optional[List[str]] = None,
    categories: Optional[List[str]] = None,
    priorities: Optional[List[str]] = None,
    limit: Optional[int] = None,
    threshold: float = 0.0,
    sensitive_strings: Optional[List[str]] = None,
) -> Dict[str, object]:
    """Sequentially evaluate flags and return the optimization summary."""

    source_path = Path(source_file).resolve()
    out_dir = Path(output_dir).resolve() if output_dir else (Path("bin") / "agent_runs").resolve()

    if flag_list:
        candidates = flag_list
    else:
        candidates = _select_candidate_flags(
            categories=categories,
            priorities=priorities,
            limit=limit,
        )

    summary = optimize_flags(
        source_file=source_path,
        output_dir=out_dir,
        candidate_flags=candidates,
        base_flags=base_flags,
        sensitive_strings=sensitive_strings,
        improvement_threshold=threshold,
    )

    return summary


def _build_agent(
    *,
    provider: Optional[str],
    model_name: Optional[str],
    instructions: Optional[str],
    stream: bool,
) -> Agent:
    """Construct an Agent configured with our custom tools."""

    agent = build_agent(
        provider=provider,
        model_name=model_name,
        instructions=instructions,
        stream=stream,
        markdown=False,
    )
    agent.set_tools([optimize_flags_sequence, list_candidate_flags])
    return agent


@APP.command()
def optimize(
    source: Path = typer.Argument(..., help="Path to the C/C++ source file to obfuscate."),
    provider: Optional[str] = typer.Option(None, "--provider", "-p", help="LLM provider override."),
    model: Optional[str] = typer.Option(None, "--model", "-m", help="LLM model id override."),
    base_flag: List[str] = typer.Option(None, "--base-flag", "-b", help="Base flags applied before evaluation."),
    flag: List[str] = typer.Option(None, "--flag", help="Explicit flags to evaluate (in order)."),
    category: List[str] = typer.Option(None, "--category", "-c", help="Flag categories to include."),
    priority: List[str] = typer.Option(None, "--priority", "-r", help="Flag priorities to include."),
    limit: Optional[int] = typer.Option(None, "--limit", "-l", help="Maximum number of candidate flags."),
    threshold: float = typer.Option(0.0, "--threshold", help="Required score improvement to accept a flag."),
    sensitive_string: List[str] = typer.Option(None, "--sensitive-string", help="Strings that should disappear from the binary."),
    output_dir: Path = typer.Option(Path("bin") / "agent_runs", "--output-dir", help="Directory for intermediate binaries."),
    stream: bool = typer.Option(True, "--stream", help="Stream model output."),
) -> None:
    """Run the obfuscation agent for the provided source file."""

    source = source.resolve()
    output_dir = output_dir.resolve()

    base_flags = [bf for bf in (base_flag or []) if bf]
    explicit_flags = [f for f in (flag or []) if f]
    categories = [c for c in (category or []) if c]
    priorities = [p for p in (priority or []) if p]
    sensitive_strings = [s for s in (sensitive_string or []) if s]

    agent_instructions = (
        "You are an autonomous LLVM obfuscation assistant. "
        "Use the provided tools to evaluate compilation flags sequentially. "
        "Call `optimize_flags_sequence` exactly once with the supplied arguments, "
        "wait for its response, then summarise the chosen flags, improvement and output paths."
    )

    agent = _build_agent(
        provider=provider,
        model_name=model,
        instructions=agent_instructions,
        stream=stream,
    )

    tool_args = {
        "source_file": str(source),
        "output_dir": str(output_dir),
        "base_flags": base_flags or None,
        "flag_list": explicit_flags or None,
        "categories": categories or None,
        "priorities": priorities or None,
        "limit": limit,
        "threshold": threshold,
        "sensitive_strings": sensitive_strings or None,
    }

    prompt = (
        "Sequentially evaluate LLVM flags for obfuscation. "
        "Call `optimize_flags_sequence` with the following JSON arguments and report the results:\n"
        f"```json\n{json.dumps(tool_args, indent=2)}\n```"
    )

    agent.print_response(prompt, stream=stream, markdown=False)


if __name__ == "__main__":
    APP()
