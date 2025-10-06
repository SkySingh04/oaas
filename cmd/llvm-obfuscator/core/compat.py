from __future__ import annotations

import sys
import typing


if sys.version_info >= (3, 13):
    _orig_forward_evaluate = typing.ForwardRef._evaluate  # type: ignore[attr-defined]
    _sentinel = _orig_forward_evaluate.__defaults__[0]  # type: ignore[index]

    def _patched_forward_evaluate(self, globalns, localns, type_params=_sentinel, *, recursive_guard=None):
        if recursive_guard is None:
            recursive_guard = set()
        return _orig_forward_evaluate(
            self,
            globalns,
            localns,
            type_params,
            recursive_guard=recursive_guard,
        )

    typing.ForwardRef._evaluate = _patched_forward_evaluate  # type: ignore[attr-defined]
