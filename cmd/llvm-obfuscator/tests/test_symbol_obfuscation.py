"""
Unit tests for symbol obfuscation functionality.

Tests cover:
- SymbolObfuscator core class
- CLI integration with symbol obfuscation options
- API integration with symbol obfuscation config
- Configuration validation
"""

import base64
import json
import subprocess
import time
from pathlib import Path
from unittest.mock import MagicMock, Mock, patch

import pytest
from fastapi.testclient import TestClient
from typer.testing import CliRunner

from api.server import app, job_manager
from cli.obfuscate import app as cli_app
from core import LLVMObfuscator, ObfuscationConfig, ObfuscationLevel, OutputConfiguration, Platform
from core.config import AdvancedConfiguration, PassConfiguration, SymbolObfuscationConfiguration
from core.reporter import ObfuscationReport
from core.symbol_obfuscator import SymbolObfuscator


# ============================================================================
# Fixtures
# ============================================================================

@pytest.fixture
def symbol_sample_source(tmp_path: Path) -> Path:
    """Create a sample C source file with multiple functions and variables."""
    source = tmp_path / "symbol_sample.c"
    source.write_text("""
    #include <stdio.h>

    int global_counter = 0;

    int validate_license_key(const char* key) {
        return strlen(key) == 16;
    }

    void process_data(int* data, int size) {
        for (int i = 0; i < size; i++) {
            data[i] *= 2;
        }
    }

    int main() {
        printf("Hello World\\n");
        return 0;
    }
    """, encoding="utf-8")
    return source


@pytest.fixture
def symbol_obfuscator(tmp_path: Path) -> SymbolObfuscator:
    """Create a SymbolObfuscator instance."""
    return SymbolObfuscator()


@pytest.fixture
def mock_symbol_tool(monkeypatch: pytest.MonkeyPatch):
    """Mock the symbol obfuscator tool to avoid requiring C++ build."""
    def fake_run(cmd, *args, **kwargs):
        # Extract output file path from command
        output_file = None
        for i, arg in enumerate(cmd):
            if arg == "-o" and i + 1 < len(cmd):
                output_file = Path(cmd[i + 1])
                break

        if output_file:
            # Create fake obfuscated output
            output_file.write_text("""
            #include <stdio.h>

            int v_a7f3b2c8d9e4 = 0;

            int f_d3e5a9b7c2f1(const char* key) {
                return strlen(key) == 16;
            }

            void f_b9c4e7f2a8d3(int* data, int size) {
                for (int i = 0; i < size; i++) {
                    data[i] *= 2;
                }
            }

            int main() {
                printf("Hello World\\n");
                return 0;
            }
            """, encoding="utf-8")

            # Create fake mapping file
            mapping_file = output_file.parent / f"{output_file.stem}_symbol_map.json"
            mapping_file.write_text(json.dumps({
                "function_mappings": {
                    "validate_license_key": "f_d3e5a9b7c2f1",
                    "process_data": "f_b9c4e7f2a8d3"
                },
                "variable_mappings": {
                    "global_counter": "v_a7f3b2c8d9e4"
                },
                "statistics": {
                    "functions_obfuscated": 2,
                    "variables_obfuscated": 1,
                    "total_symbols": 3
                }
            }, indent=2), encoding="utf-8")

        # Return fake subprocess result
        mock_result = Mock()
        mock_result.returncode = 0
        mock_result.stdout = "Symbol obfuscation completed successfully"
        mock_result.stderr = ""
        return mock_result

    monkeypatch.setattr(subprocess, "run", fake_run)
    return fake_run


# ============================================================================
# Core SymbolObfuscator Tests
# ============================================================================

def test_symbol_obfuscator_basic(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test basic symbol obfuscation with default settings."""
    obfuscator = SymbolObfuscator()
    output_file = tmp_path / "obfuscated.c"

    result = obfuscator.obfuscate(
        source_file=symbol_sample_source,
        output_file=output_file
    )

    assert output_file.exists()
    assert result["success"] is True
    assert result["input_file"] == str(symbol_sample_source)
    assert result["output_file"] == str(output_file)
    assert "symbol_mappings" in result
    assert result["symbols_obfuscated"] == 3


def test_symbol_obfuscator_algorithms(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test different hash algorithms."""
    obfuscator = SymbolObfuscator()

    for algorithm in ["sha256", "blake2b", "siphash"]:
        output_file = tmp_path / f"obfuscated_{algorithm}.c"
        result = obfuscator.obfuscate(
            source_file=symbol_sample_source,
            output_file=output_file,
            algorithm=algorithm
        )

        assert result["success"] is True
        assert result["algorithm"] == algorithm


def test_symbol_obfuscator_prefix_styles(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test different prefix styles."""
    obfuscator = SymbolObfuscator()

    for prefix_style in ["none", "typed", "underscore"]:
        output_file = tmp_path / f"obfuscated_{prefix_style}.c"
        result = obfuscator.obfuscate(
            source_file=symbol_sample_source,
            output_file=output_file,
            prefix_style=prefix_style
        )

        assert result["success"] is True
        assert result["prefix_style"] == prefix_style


def test_symbol_obfuscator_hash_length(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test different hash lengths."""
    obfuscator = SymbolObfuscator()

    for hash_length in [8, 12, 16, 24, 32]:
        output_file = tmp_path / f"obfuscated_{hash_length}.c"
        result = obfuscator.obfuscate(
            source_file=symbol_sample_source,
            output_file=output_file,
            hash_length=hash_length
        )

        assert result["success"] is True
        assert result["hash_length"] == hash_length


def test_symbol_obfuscator_with_salt(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test obfuscation with custom salt."""
    obfuscator = SymbolObfuscator()
    output_file = tmp_path / "obfuscated_salted.c"

    result = obfuscator.obfuscate(
        source_file=symbol_sample_source,
        output_file=output_file,
        salt="custom_salt_value_123"
    )

    assert result["success"] is True
    assert result["salt"] == "custom_salt_value_123"


def test_symbol_obfuscator_tool_not_found(symbol_sample_source, tmp_path, monkeypatch):
    """Test error handling when tool is not found."""
    def fake_run_error(*args, **kwargs):
        raise FileNotFoundError("Symbol obfuscator tool not found")

    monkeypatch.setattr(subprocess, "run", fake_run_error)

    obfuscator = SymbolObfuscator()
    output_file = tmp_path / "obfuscated.c"

    with pytest.raises(Exception):
        obfuscator.obfuscate(
            source_file=symbol_sample_source,
            output_file=output_file
        )


# ============================================================================
# Configuration Tests
# ============================================================================

def test_symbol_obfuscation_configuration_defaults():
    """Test SymbolObfuscationConfiguration default values."""
    config = SymbolObfuscationConfiguration()

    assert config.enabled is False
    assert config.algorithm == "sha256"
    assert config.hash_length == 12
    assert config.prefix_style == "typed"
    assert config.salt is None


def test_symbol_obfuscation_configuration_custom():
    """Test SymbolObfuscationConfiguration with custom values."""
    config = SymbolObfuscationConfiguration(
        enabled=True,
        algorithm="blake2b",
        hash_length=16,
        prefix_style="underscore",
        salt="my_custom_salt"
    )

    assert config.enabled is True
    assert config.algorithm == "blake2b"
    assert config.hash_length == 16
    assert config.prefix_style == "underscore"
    assert config.salt == "my_custom_salt"


def test_advanced_configuration_with_symbol_obfuscation():
    """Test AdvancedConfiguration includes symbol obfuscation."""
    symbol_config = SymbolObfuscationConfiguration(
        enabled=True,
        algorithm="sha256",
        hash_length=12
    )

    advanced_config = AdvancedConfiguration(
        cycles=2,
        string_encryption=True,
        fake_loops=5,
        symbol_obfuscation=symbol_config
    )

    assert advanced_config.symbol_obfuscation.enabled is True
    assert advanced_config.symbol_obfuscation.algorithm == "sha256"
    assert advanced_config.cycles == 2


# ============================================================================
# Integration Tests with Obfuscator
# ============================================================================

def test_obfuscator_with_symbol_obfuscation(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test LLVMObfuscator with symbol obfuscation enabled."""
    reporter = ObfuscationReport(tmp_path / "reports")
    obfuscator = LLVMObfuscator(reporter=reporter)

    symbol_config = SymbolObfuscationConfiguration(
        enabled=True,
        algorithm="sha256",
        hash_length=12,
        prefix_style="typed"
    )

    config = ObfuscationConfig(
        level=ObfuscationLevel.MEDIUM,
        platform=Platform.LINUX,
        compiler_flags=[],
        passes=PassConfiguration(),
        advanced=AdvancedConfiguration(symbol_obfuscation=symbol_config),
        output=OutputConfiguration(directory=tmp_path / "out", report_formats=["json"])
    )

    result = obfuscator.obfuscate(symbol_sample_source, config)

    # Verify symbol obfuscation was applied
    assert "symbol_obfuscation" in result
    symbol_result = result["symbol_obfuscation"]
    assert symbol_result["success"] is True
    assert symbol_result["symbols_obfuscated"] > 0


def test_obfuscator_without_symbol_obfuscation(symbol_sample_source, tmp_path):
    """Test LLVMObfuscator with symbol obfuscation disabled."""
    reporter = ObfuscationReport(tmp_path / "reports")
    obfuscator = LLVMObfuscator(reporter=reporter)

    config = ObfuscationConfig(
        level=ObfuscationLevel.MEDIUM,
        platform=Platform.LINUX,
        compiler_flags=[],
        passes=PassConfiguration(),
        advanced=AdvancedConfiguration(),  # symbol_obfuscation disabled by default
        output=OutputConfiguration(directory=tmp_path / "out", report_formats=["json"])
    )

    result = obfuscator.obfuscate(symbol_sample_source, config)

    # Verify symbol obfuscation was not applied
    symbol_result = result.get("symbol_obfuscation")
    assert symbol_result is None or symbol_result.get("enabled") is False


# ============================================================================
# CLI Tests
# ============================================================================

def test_cli_symbol_obfuscation_basic(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test CLI with basic symbol obfuscation options."""
    runner = CliRunner()

    result = runner.invoke(
        cli_app,
        [
            "compile",
            str(symbol_sample_source),
            "--output",
            str(tmp_path / "out"),
            "--enable-symbol-obfuscation"
        ],
    )

    assert result.exit_code == 0
    output = json.loads(result.stdout)
    assert "symbol_obfuscation" in output


def test_cli_symbol_obfuscation_full_options(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test CLI with all symbol obfuscation options."""
    runner = CliRunner()

    result = runner.invoke(
        cli_app,
        [
            "compile",
            str(symbol_sample_source),
            "--output",
            str(tmp_path / "out"),
            "--enable-symbol-obfuscation",
            "--symbol-algorithm",
            "blake2b",
            "--symbol-hash-length",
            "16",
            "--symbol-prefix",
            "underscore",
            "--symbol-salt",
            "test_salt"
        ],
    )

    assert result.exit_code == 0
    output = json.loads(result.stdout)
    assert "symbol_obfuscation" in output
    symbol_result = output["symbol_obfuscation"]
    assert symbol_result["algorithm"] == "blake2b"
    assert symbol_result["hash_length"] == 16
    assert symbol_result["prefix_style"] == "underscore"
    assert symbol_result["salt"] == "test_salt"


def test_cli_symbol_obfuscation_with_other_passes(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test CLI with symbol obfuscation combined with OLLVM passes."""
    runner = CliRunner()

    result = runner.invoke(
        cli_app,
        [
            "compile",
            str(symbol_sample_source),
            "--output",
            str(tmp_path / "out"),
            "--enable-symbol-obfuscation",
            "--enable-flattening",
            "--enable-substitution",
            "--string-encryption",
            "--fake-loops",
            "3"
        ],
    )

    assert result.exit_code == 0
    output = json.loads(result.stdout)
    assert "symbol_obfuscation" in output
    assert "flattening" in output.get("enabled_passes", [])


# ============================================================================
# API Tests
# ============================================================================

def test_api_obfuscate_with_symbol_obfuscation(symbol_sample_source, mock_symbol_tool):
    """Test API obfuscate endpoint with symbol obfuscation config."""
    client = TestClient(app)

    source_b64 = base64.b64encode(symbol_sample_source.read_bytes()).decode("ascii")

    payload = {
        "source_code": source_b64,
        "filename": "symbol_sample.c",
        "platform": "linux",
        "config": {
            "level": 3,
            "passes": {
                "flattening": False,
                "substitution": False,
                "bogus_control_flow": False,
                "split": False
            },
            "cycles": 1,
            "string_encryption": False,
            "fake_loops": 0,
            "symbol_obfuscation": {
                "enabled": True,
                "algorithm": "sha256",
                "hash_length": 12,
                "prefix_style": "typed",
                "salt": None
            }
        },
        "report_formats": ["json"]
    }

    response = client.post("/api/obfuscate", headers={"x-api-key": "test-key"}, json=payload)
    assert response.status_code == 200

    job_id = response.json()["job_id"]

    # Wait for job completion
    for _ in range(10):
        job = job_manager.get_job(job_id)
        if job.status == "completed":
            break
        time.sleep(0.1)

    # Verify job completed
    job = job_manager.get_job(job_id)
    assert job.status == "completed"
    result = job.metadata.get("result", {})
    assert "symbol_obfuscation" in result


def test_api_obfuscate_sync_with_symbol_obfuscation(symbol_sample_source, mock_symbol_tool):
    """Test API sync obfuscate endpoint with symbol obfuscation."""
    client = TestClient(app)

    source_b64 = base64.b64encode(symbol_sample_source.read_bytes()).decode("ascii")

    payload = {
        "source_code": source_b64,
        "filename": "symbol_sample.c",
        "platform": "linux",
        "config": {
            "level": 5,
            "passes": {
                "flattening": True,
                "substitution": True,
                "bogus_control_flow": True,
                "split": True
            },
            "cycles": 1,
            "string_encryption": True,
            "fake_loops": 2,
            "symbol_obfuscation": {
                "enabled": True,
                "algorithm": "blake2b",
                "hash_length": 16,
                "prefix_style": "underscore",
                "salt": "api_test_salt"
            }
        },
        "report_formats": ["json"]
    }

    response = client.post("/api/obfuscate/sync", headers={"x-api-key": "test-key"}, json=payload)
    assert response.status_code == 200

    result = response.json()
    assert result["status"] == "completed"
    assert "download_url" in result
    assert "report_url" in result


def test_api_symbol_obfuscation_validation():
    """Test API validates symbol obfuscation config correctly."""
    client = TestClient(app)

    # Test invalid algorithm
    payload = {
        "source_code": "aGVsbG8=",
        "filename": "test.c",
        "config": {
            "symbol_obfuscation": {
                "enabled": True,
                "algorithm": "invalid_algo"  # Should fail validation
            }
        }
    }

    response = client.post("/api/obfuscate/sync", headers={"x-api-key": "test-key"}, json=payload)
    assert response.status_code == 422  # Validation error


# ============================================================================
# End-to-End Tests
# ============================================================================

def test_full_pipeline_with_symbol_obfuscation(symbol_sample_source, tmp_path, mock_symbol_tool):
    """Test complete obfuscation pipeline with all layers including symbol obfuscation."""
    reporter = ObfuscationReport(tmp_path / "reports")
    obfuscator = LLVMObfuscator(reporter=reporter)

    # Configure all obfuscation layers
    symbol_config = SymbolObfuscationConfiguration(
        enabled=True,
        algorithm="sha256",
        hash_length=12,
        prefix_style="typed",
        salt="integration_test"
    )

    config = ObfuscationConfig(
        level=ObfuscationLevel.AGGRESSIVE,
        platform=Platform.LINUX,
        compiler_flags=["-O3", "-flto"],
        passes=PassConfiguration(
            flattening=True,
            substitution=True,
            bogus_control_flow=True,
            split=True
        ),
        advanced=AdvancedConfiguration(
            cycles=2,
            string_encryption=True,
            fake_loops=5,
            symbol_obfuscation=symbol_config
        ),
        output=OutputConfiguration(directory=tmp_path / "out", report_formats=["json"])
    )

    result = obfuscator.obfuscate(symbol_sample_source, config)

    # Verify all layers were applied
    assert result["output_file"]
    assert "symbol_obfuscation" in result
    assert result["symbol_obfuscation"]["success"] is True
    assert result["string_encryption_applied"] is True
    assert result["fake_loops_inserted"] > 0
    assert len(result["enabled_passes"]) > 0

    # Verify report was generated
    report_paths = result.get("report_paths", {})
    assert "json" in report_paths
    report_path = Path(report_paths["json"])
    assert report_path.exists()

    # Verify report contains symbol obfuscation info
    report_data = json.loads(report_path.read_text())
    assert "symbol_obfuscation" in report_data["output_attributes"]
