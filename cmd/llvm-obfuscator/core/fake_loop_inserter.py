from __future__ import annotations

import random
from dataclasses import dataclass
from typing import List


@dataclass
class FakeLoop:
    loop_type: str
    location: str
    code_snippet: str


class FakeLoopGenerator:
    """Generates non-functional loops for obfuscation reports (stub implementation)."""

    def __init__(self, seed: int = 42) -> None:
        self._rand = random.Random(seed)

    def generate(self, count: int, filename: str) -> List[FakeLoop]:
        loops: List[FakeLoop] = []
        for index in range(count):
            loop_type = self._rand.choice(["while", "for", "do-while"])
            values = [self._rand.randint(1, 100) for _ in range(4)]
            if loop_type == "while":
                modulus = max(1, values[3])
                snippet = (
                    f"int counter_{index} = {values[0]};\n"
                    f"while(counter_{index} < {values[1]}) {{\n"
                    f"    counter_{index} += {values[2]};\n"
                    f"    if((counter_{index} % {modulus}) == 0) {{ break; }}\n"
                    "}"
                )
            elif loop_type == "for":
                snippet = (
                    f"for(int i_{index} = {values[0]}; i_{index} < {values[1]}; ++i_{index}) {{\n"
                    f"    volatile int sink_{index} = i_{index} * {values[2]};\n"
                    "}"
                )
            else:  # do-while
                snippet = (
                    f"int dummy_{index} = {values[0]};\n"
                    "do {\n"
                    f"    dummy_{index} += {values[1]};\n"
                    f"}} while(dummy_{index} < {values[2]});"
                )
            location = f"{filename}:fake_loop_{index}"
            loops.append(FakeLoop(loop_type=loop_type, location=location, code_snippet=snippet))
        return loops
