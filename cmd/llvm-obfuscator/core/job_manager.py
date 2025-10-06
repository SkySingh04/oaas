from __future__ import annotations

import uuid
from dataclasses import dataclass, field
from datetime import datetime
from typing import Dict, List, Optional

from .exceptions import JobNotFoundError


@dataclass
class JobRecord:
    job_id: str
    status: str
    created_at: datetime
    updated_at: datetime
    metadata: Dict
    report_paths: Dict[str, str] = field(default_factory=dict)


class JobManager:
    """In-memory job registry (non-persistent)."""

    def __init__(self) -> None:
        self._jobs: Dict[str, JobRecord] = {}

    def create_job(self, metadata: Dict) -> JobRecord:
        job_id = uuid.uuid4().hex
        now = datetime.utcnow()
        record = JobRecord(
            job_id=job_id,
            status="pending",
            created_at=now,
            updated_at=now,
            metadata=metadata,
        )
        self._jobs[job_id] = record
        return record

    def update_job(self, job_id: str, status: Optional[str] = None, **metadata: Dict) -> JobRecord:
        record = self._jobs.get(job_id)
        if not record:
            raise JobNotFoundError(job_id)
        if status:
            record.status = status
        if metadata:
            record.metadata.update(metadata)
        record.updated_at = datetime.utcnow()
        return record

    def attach_reports(self, job_id: str, reports: Dict[str, str]) -> JobRecord:
        record = self._jobs.get(job_id)
        if not record:
            raise JobNotFoundError(job_id)
        record.report_paths.update(reports)
        record.updated_at = datetime.utcnow()
        return record

    def get_job(self, job_id: str) -> JobRecord:
        if job_id not in self._jobs:
            raise JobNotFoundError(job_id)
        return self._jobs[job_id]

    def list_jobs(self) -> List[JobRecord]:
        return list(self._jobs.values())
