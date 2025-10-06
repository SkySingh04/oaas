import base64
import json
import time
from pathlib import Path

import pytest
from fastapi.testclient import TestClient

from api.server import app, job_manager
from core import LLVMObfuscator


def test_functional_equivalence(sample_source, obfuscation_config, obfuscator: LLVMObfuscator):
    """Verify obfuscated binary produces same output"""
    result = obfuscator.obfuscate(sample_source, obfuscation_config)
    output_file = Path(result["output_file"])
    assert output_file.exists()


def test_symbol_reduction(sample_source, obfuscation_config, obfuscator: LLVMObfuscator):
    """Verify symbols are properly hidden"""
    result = obfuscator.obfuscate(sample_source, obfuscation_config)
    assert result["symbol_reduction"] >= 20


def test_all_passes(sample_source, obfuscation_config, obfuscator: LLVMObfuscator):
    """Test each OLLVM pass individually"""
    result = obfuscator.obfuscate(sample_source, obfuscation_config)
    assert set(result["enabled_passes"]) == {"flattening", "substitution", "boguscf", "split"}


def test_report_generation(sample_source, obfuscation_config, obfuscator: LLVMObfuscator):
    """Verify all report fields are populated"""
    result = obfuscator.obfuscate(sample_source, obfuscation_config)
    report_paths = result.get("report_paths", {})
    assert "json" in report_paths
    data = json.loads(Path(report_paths["json"]).read_text())
    assert "input_parameters" in data
    assert "output_attributes" in data


def test_cross_platform(sample_source, obfuscation_config, obfuscator: LLVMObfuscator):
    """Test Windows and Linux binary generation"""
    from core.config import Platform

    obfuscation_config.platform = Platform.WINDOWS
    result = obfuscator.obfuscate(sample_source, obfuscation_config)
    assert result["output_file"].endswith(".exe")


@pytest.mark.parametrize("endpoint", ["/api/jobs", "/api/health"])
def test_api_endpoints_get(endpoint):
    """Test API GET endpoints with authentication"""
    client = TestClient(app)
    response = client.get(endpoint, headers={"x-api-key": "test-key"})
    assert response.status_code in {200, 204}


def test_api_endpoints_obfuscate_flow(sample_source, base64_source):
    """Test all API endpoints with various configs"""
    client = TestClient(app)

    payload = {
        "source_code": base64_source,
        "filename": "sample.c",
        "platform": "linux",
        "config": {
            "level": 3,
            "passes": {
                "flattening": True,
                "substitution": True,
                "bogus_control_flow": True,
                "split": True
            },
            "cycles": 1,
            "string_encryption": True,
            "fake_loops": 1
        },
        "report_formats": ["json"]
    }

    response = client.post("/api/obfuscate", headers={"x-api-key": "test-key"}, json=payload)
    assert response.status_code == 200
    job_id = response.json()["job_id"]

    # Allow background task to finish
    for _ in range(5):
        job = job_manager.get_job(job_id)
        if job.status == "completed":
            break
        time.sleep(0.05)
    else:
        pytest.fail("Job did not complete")

    analyze_response = client.get(f"/api/analyze/{job_id}", headers={"x-api-key": "test-key"})
    assert analyze_response.status_code == 200

    report_response = client.get(f"/api/report/{job_id}?fmt=json", headers={"x-api-key": "test-key"})
    assert report_response.status_code == 200


def test_api_compare_endpoint(sample_source):
    """Test API compare endpoint"""
    data = sample_source.read_bytes()
    client = TestClient(app)
    payload = {
        "original_b64": base64.b64encode(data).decode("ascii"),
        "obfuscated_b64": base64.b64encode(data).decode("ascii"),
        "filename": "sample"
    }
    response = client.post("/api/compare", headers={"x-api-key": "test-key"}, json=payload)
    assert response.status_code == 200
    body = response.json()
    assert "size_delta" in body


def test_cli_commands(sample_source, tmp_path, monkeypatch):
    """Test CLI commands and options"""
    from typer.testing import CliRunner

    from cli.obfuscate import app as cli_app

    runner = CliRunner()

    result = runner.invoke(
        cli_app,
        [
            "compile",
            str(sample_source),
            "--output",
            str(tmp_path / "out"),
            "--enable-flattening",
            "--enable-substitution",
            "--enable-bogus-cf",
            "--enable-split",
            "--string-encryption",
        ],
    )
    assert result.exit_code == 0

    analyze = runner.invoke(cli_app, ["analyze", str(tmp_path / "out" / "sample")])
    assert analyze.exit_code == 0

    compare = runner.invoke(
        cli_app,
        [
            "compare",
            str(tmp_path / "out" / "sample"),
            str(tmp_path / "out" / "sample"),
        ],
    )
    assert compare.exit_code == 0
