from __future__ import annotations

import asyncio
from asyncio import Queue
import asyncio
from dataclasses import dataclass
from typing import AsyncIterator, Dict


@dataclass
class ProgressEvent:
    job_id: str
    stage: str
    progress: float
    message: str


class ProgressTracker:
    """Simple progress broadcaster for WebSocket subscribers."""

    def __init__(self) -> None:
        self._queues: Dict[str, Queue[ProgressEvent]] = {}

    def _get_queue(self, job_id: str) -> Queue[ProgressEvent]:
        if job_id not in self._queues:
            self._queues[job_id] = Queue()
        return self._queues[job_id]

    async def publish(self, event: ProgressEvent) -> None:
        queue = self._get_queue(event.job_id)
        await queue.put(event)

    def publish_sync(self, event: ProgressEvent) -> None:
        try:
            loop = asyncio.get_running_loop()
        except RuntimeError:
            asyncio.run(self.publish(event))
            return
        loop.create_task(self.publish(event))

    async def subscribe(self, job_id: str) -> AsyncIterator[ProgressEvent]:
        queue = self._get_queue(job_id)
        while True:
            event = await queue.get()
            yield event
