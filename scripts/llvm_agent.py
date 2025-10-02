#!/usr/bin/env python3
"""CLI for interacting with an Agno agent tailored to this repository."""

import os
from pathlib import Path
from typing import Optional

import typer
from dotenv import load_dotenv

from agno.agent import Agent

APP = typer.Typer(add_completion=False, help="Interact with the LLVM Obfuscator Agno agent.")

PROJECT_ROOT = Path(__file__).resolve().parent.parent
MODEL_DEFAULTS = {
    "openai": "gpt-4o-mini"
}
DEFAULT_INSTRUCTIONS = (
    "You are an AI assistant helping with the LLVM Obfuscator Research project. "
    "Provide clear, concise, and actionable support grounded in the repository's code, scripts, and docs."
)
DEFAULT_AGENT_NAME = "LLVMResearchAgent"

def _load_environment() -> None:
    env_path = PROJECT_ROOT / ".env"
    if env_path.exists():
        load_dotenv(env_path)
    else:
        load_dotenv()


def _resolve_provider(provider: Optional[str]) -> str:
    candidate = provider or os.getenv("AGNO_MODEL_PROVIDER") or "openai"
    return candidate.strip().lower()


def _resolve_model_name(provider: str, model_name: Optional[str]) -> str:
    if model_name:
        return model_name
    env_value = os.getenv("AGNO_MODEL_ID")
    if env_value:
        return env_value
    if provider in MODEL_DEFAULTS:
        return MODEL_DEFAULTS[provider]
    raise typer.BadParameter(
        "No model id provided. Set --model, AGNO_MODEL_ID, or add a default for the chosen provider."
    )


def _build_model(provider: str, model_name: str):
    try:
        if provider == "openai":
            from agno.models.openai import OpenAIChat

            return OpenAIChat(id=model_name)
        if provider == "groq":
            from agno.models.groq import Groq

            return Groq(id=model_name)
        if provider == "ollama":
            from agno.models.ollama import Ollama

            host = os.getenv("OLLAMA_HOST")
            return Ollama(id=model_name, host=host)
    except ImportError as exc:  # pragma: no cover - surfaced interactively
        hint = (
            "Install the provider's SDK inside the virtualenv, e.g. "
            "`pip install openai` / `pip install groq` / `pip install ollama`."
        )
        raise typer.BadParameter(hint) from exc
    raise typer.BadParameter(f"Unsupported model provider '{provider}'.")


def build_agent(
    provider: Optional[str] = None,
    model_name: Optional[str] = None,
    instructions: Optional[str] = None,
    *,
    markdown: bool = True,
    stream: bool = True,
) -> Agent:
    _load_environment()
    resolved_provider = _resolve_provider(provider)
    target_model = _resolve_model_name(resolved_provider, model_name)
    agent_instructions = instructions or os.getenv("AGNO_AGENT_INSTRUCTIONS", DEFAULT_INSTRUCTIONS)
    agent_name = os.getenv("AGNO_AGENT_NAME", DEFAULT_AGENT_NAME)

    model = _build_model(resolved_provider, target_model)

    return Agent(
        name=agent_name,
        description="Assistant for the LLVM Obfuscator Research repository.",
        instructions=agent_instructions,
        model=model,
        markdown=markdown,
        stream=stream,
        add_datetime_to_context=True,
        add_name_to_context=True,
    )


@APP.command()
def ask(
    prompt: str = typer.Argument(..., help="Message to send to the agent."),
    provider: Optional[str] = typer.Option(None, "--provider", "-p", help="Model provider to use."),
    model_name: Optional[str] = typer.Option(None, "--model", "-m", help="Model identifier to target."),
    instructions: Optional[str] = typer.Option(
        None,
        "--instructions",
        help="Override the system instructions for this single run.",
    ),
    stream: bool = typer.Option(True, help="Stream tokens as they are generated."),
    markdown: bool = typer.Option(True, help="Render responses with Markdown formatting."),
) -> None:
    """Send a one-off prompt to the configured agent."""

    agent = build_agent(
        provider=provider,
        model_name=model_name,
        instructions=instructions,
        markdown=markdown,
        stream=stream,
    )
    agent.print_response(prompt, stream=stream, markdown=markdown)


@APP.command()
def chat(
    provider: Optional[str] = typer.Option(None, "--provider", "-p", help="Model provider to use."),
    model_name: Optional[str] = typer.Option(None, "--model", "-m", help="Model identifier to target."),
    instructions: Optional[str] = typer.Option(
        None,
        "--instructions",
        help="Override the agent instructions for the entire chat session.",
    ),
    stream: bool = typer.Option(True, help="Stream tokens as they are generated."),
    markdown: bool = typer.Option(True, help="Render responses with Markdown formatting."),
    emoji: str = typer.Option(":rocket:", help="Emoji displayed for the user prompt."),
) -> None:
    """Launch an interactive REPL that keeps the conversation context."""

    agent = build_agent(
        provider=provider,
        model_name=model_name,
        instructions=instructions,
        markdown=markdown,
        stream=stream,
    )
    agent.cli_app(stream=stream, markdown=markdown, emoji=emoji)


@APP.command("show-config")
def show_config() -> None:
    """Display the resolved agent configuration without contacting any model."""

    _load_environment()
    provider = _resolve_provider(None)
    model_name = _resolve_model_name(provider, None)
    agent_name = os.getenv("AGNO_AGENT_NAME", DEFAULT_AGENT_NAME)
    instructions = os.getenv("AGNO_AGENT_INSTRUCTIONS", DEFAULT_INSTRUCTIONS)

    typer.echo(f"Project root    : {PROJECT_ROOT}")
    typer.echo(f"Provider        : {provider}")
    typer.echo(f"Model           : {model_name}")
    typer.echo(f"Agent name      : {agent_name}")
    typer.echo(f"Instructions    : {instructions}")

    # Summarise credential availability without printing secrets
    provider_keys = {
        "openai": os.getenv("OPENAI_API_KEY"),
        "groq": os.getenv("GROQ_API_KEY"),
        "ollama": os.getenv("OLLAMA_HOST") or os.getenv("OLLAMA_API_KEY"),
    }
    for key_provider, value in provider_keys.items():
        status = "configured" if value else "missing"
        typer.echo(f"Credential [{key_provider}] : {status}")


if __name__ == "__main__":
    APP()
