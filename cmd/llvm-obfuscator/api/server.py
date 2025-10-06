from __future__ import annotations

import base64
import logging
import os
from pathlib import Path
from typing import Dict, Optional

from fastapi import BackgroundTasks, Depends, FastAPI, HTTPException, Request, WebSocket, WebSocketDisconnect
from fastapi.responses import FileResponse, JSONResponse
from pydantic import BaseModel, Field

from core import (
    AnalyzeConfig,
    LLVMObfuscator,
    ObfuscationConfig,
    ObfuscationReport,
    Platform,
    analyze_binary,
)
from core.comparer import CompareConfig, compare_binaries
from core.config import AdvancedConfiguration, PassConfiguration
from core.exceptions import JobNotFoundError, ValidationError
from core.job_manager import JobManager
from core.progress import ProgressEvent, ProgressTracker
from core.utils import create_logger, ensure_directory

# Load flags database for the /api/flags endpoint. Prefer importing from the
# repo's scripts module; fall back to loading the file directly, and finally to
# an empty list if unavailable.
try:  # Attempt local package import if PYTHONPATH includes repo root
    from scripts.flags import comprehensive_flags  # type: ignore
except Exception:  # pragma: no cover - dev fallback when running from cmd/
    try:
        repo_root = Path(__file__).resolve().parents[4]
        flags_path = repo_root / "scripts" / "flags.py"
        namespace: Dict[str, object] = {}
        exec(flags_path.read_text(), namespace)
        comprehensive_flags = namespace.get("comprehensive_flags", [])  # type: ignore
    except Exception:
        comprehensive_flags = []  # type: ignore

API_KEY_HEADER = "x-api-key"
DEFAULT_API_KEY = os.environ.get("OBFUSCATOR_API_KEY", "change-me")
DISABLE_AUTH = os.environ.get("OBFUSCATOR_DISABLE_AUTH", "false").lower() == "true"
MAX_SOURCE_SIZE = 100 * 1024 * 1024  # 100MB

app = FastAPI(title="LLVM Obfuscator API", version="1.0.0")
logger = create_logger("api", logging.INFO)
job_manager = JobManager()
progress_tracker = ProgressTracker()
report_base = Path("reports").resolve()
ensure_directory(report_base)
reporter = ObfuscationReport(report_base)
obfuscator = LLVMObfuscator(reporter=reporter)


class PassesModel(BaseModel):
    flattening: bool = False
    substitution: bool = False
    bogus_control_flow: bool = False
    split: bool = False


class ConfigModel(BaseModel):
    level: int = Field(3, ge=1, le=5)
    passes: PassesModel = PassesModel()
    cycles: int = Field(1, ge=1, le=5)
    string_encryption: bool = False
    fake_loops: int = Field(0, ge=0, le=50)


class ObfuscateRequest(BaseModel):
    source_code: str
    filename: str
    platform: Platform = Platform.LINUX
    config: ConfigModel = ConfigModel()
    report_formats: Optional[list[str]] = Field(default_factory=lambda: ["json"])
    custom_flags: Optional[list[str]] = None
    custom_pass_plugin: Optional[str] = None


class CompareRequest(BaseModel):
    original_b64: str
    obfuscated_b64: str
    filename: str = "comparison"


def check_api_key(request: Request) -> None:
    if DISABLE_AUTH:
        return
    header_key = request.headers.get(API_KEY_HEADER)
    if header_key != DEFAULT_API_KEY:
        raise HTTPException(status_code=401, detail="Invalid API key")


class RateLimiter:
    def __init__(self, limit: int, interval: int) -> None:
        self.limit = limit
        self.interval = interval
        self.calls: Dict[str, list[float]] = {}

    async def __call__(self, request: Request) -> None:
        import time

        key = request.client.host if request.client else "anonymous"
        now = time.time()
        bucket = self.calls.setdefault(key, [])
        bucket[:] = [ts for ts in bucket if now - ts < self.interval]
        if len(bucket) >= self.limit:
            raise HTTPException(status_code=429, detail="Rate limit exceeded")
        bucket.append(now)


rate_limiter = RateLimiter(limit=10, interval=60)


def _validate_source_size(source_b64: str) -> None:
    if len(source_b64) * 3 / 4 > MAX_SOURCE_SIZE:
        raise HTTPException(status_code=413, detail="Source too large")


def _sanitize_filename(name: str) -> str:
    # Keep simple ASCII filename with word chars, dashes, underscores, dots
    import re
    safe = re.sub(r"[^A-Za-z0-9._-]", "_", name)
    return safe or "source.c"


def _decode_source(source_b64: str, destination: Path) -> None:
    decoded = base64.b64decode(source_b64)
    destination.write_bytes(decoded)


def _build_config_from_request(payload: ObfuscateRequest, destination_dir: Path) -> ObfuscationConfig:
    passes = PassConfiguration(
        flattening=payload.config.passes.flattening,
        substitution=payload.config.passes.substitution,
        bogus_control_flow=payload.config.passes.bogus_control_flow,
        split=payload.config.passes.split,
    )
    advanced = AdvancedConfiguration(
        cycles=payload.config.cycles,
        string_encryption=payload.config.string_encryption,
        fake_loops=payload.config.fake_loops,
    )
    output_config = ObfuscationConfig.from_dict(
        {
            "level": payload.config.level,
            "platform": payload.platform.value,
            "passes": {
                "flattening": passes.flattening,
                "substitution": passes.substitution,
                "bogus_control_flow": passes.bogus_control_flow,
                "split": passes.split,
            },
            "advanced": {
                "cycles": advanced.cycles,
                "string_encryption": advanced.string_encryption,
                "fake_loops": advanced.fake_loops,
            },
            "output": {
                "directory": str(destination_dir),
                "report_format": payload.report_formats,
            },
            "compiler_flags": payload.custom_flags or [],
            "custom_pass_plugin": payload.custom_pass_plugin,
        }
    )
    return output_config


def _run_obfuscation(job_id: str, source_path: Path, config: ObfuscationConfig) -> None:
    try:
        job_manager.update_job(job_id, status="running")
        progress_tracker.publish_sync(ProgressEvent(job_id=job_id, stage="running", progress=0.1, message="Compilation started"))
        result = obfuscator.obfuscate(source_path, config, job_id=job_id)
        job_manager.update_job(job_id, status="completed", result=result)
        job_manager.attach_reports(job_id, result.get("report_paths", {}))
        progress_tracker.publish_sync(ProgressEvent(job_id=job_id, stage="completed", progress=1.0, message="Obfuscation completed"))
    except Exception as exc:  # pragma: no cover - background tasks
        logger.exception("Job %s failed", job_id)
        job_manager.update_job(job_id, status="failed", error=str(exc))
        progress_tracker.publish_sync(ProgressEvent(job_id=job_id, stage="failed", progress=1.0, message=str(exc)))


@app.post("/api/obfuscate")
async def api_obfuscate(
    payload: ObfuscateRequest,
    background: BackgroundTasks,
):
    _validate_source_size(payload.source_code)
    job = job_manager.create_job({"filename": payload.filename, "platform": payload.platform.value})
    await progress_tracker.publish(ProgressEvent(job.job_id, "queued", 0.0, "Job queued"))
    working_dir = report_base / job.job_id
    ensure_directory(working_dir)
    source_filename = _sanitize_filename(payload.filename)
    source_path = (working_dir / source_filename).resolve()
    _decode_source(payload.source_code, source_path)
    config = _build_config_from_request(payload, working_dir)
    background.add_task(_run_obfuscation, job.job_id, source_path, config)
    return {"job_id": job.job_id, "status": job.status}


@app.get("/api/analyze/{job_id}")
async def api_analyze(job_id: str):
    try:
        job = job_manager.get_job(job_id)
    except JobNotFoundError:
        raise HTTPException(status_code=404, detail="Job not found")
    result = job.metadata.get("result")
    if not result:
        raise HTTPException(status_code=400, detail="Job not completed")
    binary_path = Path(result.get("output_file", ""))
    if not binary_path.exists():
        raise HTTPException(status_code=404, detail="Obfuscated binary not found")
    analysis = analyze_binary(AnalyzeConfig(binary_path=binary_path))
    return JSONResponse(analysis)


@app.post("/api/compare")
async def api_compare(payload: CompareRequest):
    working_dir = report_base / "comparisons"
    ensure_directory(working_dir)
    original_path = working_dir / f"{payload.filename}_original.bin"
    obfuscated_path = working_dir / f"{payload.filename}_obfuscated.bin"
    original_path.write_bytes(base64.b64decode(payload.original_b64))
    obfuscated_path.write_bytes(base64.b64decode(payload.obfuscated_b64))
    config = CompareConfig(original_binary=original_path, obfuscated_binary=obfuscated_path)
    result = compare_binaries(config)
    return JSONResponse(result)


@app.get("/api/jobs")
async def api_list_jobs():
    records = job_manager.list_jobs()
    payload = [
        {
            "job_id": job.job_id,
            "status": job.status,
            "created_at": job.created_at.isoformat() + "Z",
            "updated_at": job.updated_at.isoformat() + "Z",
        }
        for job in records
    ]
    return JSONResponse(payload)


@app.get("/api/report/{job_id}")
async def api_get_report(job_id: str, fmt: str = "json"):
    try:
        job = job_manager.get_job(job_id)
    except JobNotFoundError:
        raise HTTPException(status_code=404, detail="Job not found")
    report_path = job.report_paths.get(fmt)
    if not report_path:
        raise HTTPException(status_code=404, detail="Report not available")
    path = Path(report_path)
    if not path.exists():
        raise HTTPException(status_code=404, detail="Report file missing")
    return FileResponse(path)


@app.websocket("/ws/jobs/{job_id}")
async def websocket_progress(websocket: WebSocket, job_id: str):
    await websocket.accept()
    try:
        async for event in progress_tracker.subscribe(job_id):
            await websocket.send_json(
                {
                    "job_id": job_id,
                    "stage": event.stage,
                    "progress": event.progress,
                    "message": event.message,
                }
            )
    except WebSocketDisconnect:
        logger.info("WebSocket disconnected for job %s", job_id)


@app.get("/api/health")
async def api_health():
    return {"status": "ok"}


@app.get("/api/flags")
async def api_flags():
    # Expose the comprehensive flag list for UI selection
    return JSONResponse(comprehensive_flags)
