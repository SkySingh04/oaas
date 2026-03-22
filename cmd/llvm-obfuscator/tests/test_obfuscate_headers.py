"""
Tests for the indirect call obfuscation logic used by obfuscate_headers.py.

obfuscate_headers.py is just a CLI wrapper — the real work happens in
core/indirect_call_obfuscator.py via obfuscate_indirect_calls().

I test three flows mentioned in the issue:
  - stdlib-only  (--stdlib-only flag)
  - custom-only  (--custom-only flag)
  - dry-run      (metadata is correct even when no file is written)

Plus a couple of edge cases so regressions are caught early.
"""

import re
from pathlib import Path

import pytest

from core.indirect_call_obfuscator import obfuscate_indirect_calls


# Small C snippets used as inputs across the tests

STDLIB_SOURCE = """\
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
    printf("hello\\n");
    int *p = (int *)malloc(64);
    memset(p, 0, 64);
    free(p);
    return 0;
}
"""

CUSTOM_SOURCE = """\
#include <stdio.h>

int add(int a, int b) {
    return a + b;
}

void greet(const char *name) {
    printf("hi %s\\n", name);
}

int main(void) {
    int result = add(1, 2);
    greet("world");
    return result;
}
"""

MIXED_SOURCE = """\
#include <stdio.h>
#include <string.h>

int helper(const char *s) {
    return strlen(s);
}

int main(void) {
    printf("len=%d\\n", helper("test"));
    return 0;
}
"""


# --- stdlib-only flow ---
# This is what happens when you run: obfuscate_headers.py input.c --stdlib-only

def test_stdlib_only_obfuscates_stdlib_functions(tmp_path):
    # should obfuscate printf, malloc, free, memset — all stdlib calls in the source
    _, meta = obfuscate_indirect_calls(
        STDLIB_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=True, obfuscate_custom=False
    )
    assert meta["obfuscated_stdlib_functions"] > 0


def test_stdlib_only_does_not_touch_custom_functions(tmp_path):
    # with --stdlib-only, custom function count must stay 0
    _, meta = obfuscate_indirect_calls(
        STDLIB_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=True, obfuscate_custom=False
    )
    assert meta["obfuscated_custom_functions"] == 0


def test_stdlib_only_total_matches_stdlib_count(tmp_path):
    _, meta = obfuscate_indirect_calls(
        STDLIB_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=True, obfuscate_custom=False
    )
    assert meta["total_obfuscated"] == meta["obfuscated_stdlib_functions"]


def test_stdlib_only_pointer_names_follow_naming_convention(tmp_path):
    # the obfuscator names pointers as __fptr_<funcname>
    _, meta = obfuscate_indirect_calls(
        STDLIB_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=True, obfuscate_custom=False
    )
    for fn, ptr in meta["function_pointers"].items():
        assert ptr == f"__fptr_{fn}"


def test_stdlib_only_direct_calls_replaced_in_output(tmp_path):
    # after obfuscation, printf( should be gone and __fptr_printf( should appear
    transformed, _ = obfuscate_indirect_calls(
        STDLIB_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=True, obfuscate_custom=False
    )
    assert "__fptr_printf(" in transformed
    assert len(re.findall(r'\bprintf\s*\(', transformed)) == 0


# --- custom-only flow ---
# This is what happens when you run: obfuscate_headers.py input.c --custom-only

def test_custom_only_obfuscates_custom_functions(tmp_path):
    _, meta = obfuscate_indirect_calls(
        CUSTOM_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=False, obfuscate_custom=True
    )
    assert meta["obfuscated_custom_functions"] > 0


def test_custom_only_does_not_touch_stdlib(tmp_path):
    _, meta = obfuscate_indirect_calls(
        CUSTOM_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=False, obfuscate_custom=True
    )
    assert meta["obfuscated_stdlib_functions"] == 0


def test_custom_only_detected_add_and_greet(tmp_path):
    # CUSTOM_SOURCE defines add() and greet(), both should appear in the pointer map
    _, meta = obfuscate_indirect_calls(
        CUSTOM_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=False, obfuscate_custom=True
    )
    assert "add" in meta["function_pointers"]
    assert "greet" in meta["function_pointers"]


def test_custom_only_main_is_not_obfuscated(tmp_path):
    # main() should never be treated as a custom function to obfuscate
    _, meta = obfuscate_indirect_calls(
        CUSTOM_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=False, obfuscate_custom=True
    )
    assert "main" not in meta["function_pointers"]


def test_custom_only_calls_replaced_in_output(tmp_path):
    transformed, _ = obfuscate_indirect_calls(
        CUSTOM_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=False, obfuscate_custom=True
    )
    assert "__fptr_add(" in transformed


# --- dry-run flow ---
# When --dry-run is used, obfuscate_headers.py calls obfuscate_indirect_calls()
# normally but skips writing the file. So the metadata must be fully correct
# for the preview/display to make sense.

def test_dryrun_metadata_is_complete(tmp_path):
    # all keys the CLI reads for dry-run display must be present
    _, meta = obfuscate_indirect_calls(STDLIB_SOURCE, tmp_path / "t.c")
    assert "obfuscated_stdlib_functions" in meta
    assert "obfuscated_custom_functions" in meta
    assert "total_obfuscated" in meta
    assert "function_pointers" in meta


def test_dryrun_transformed_code_is_valid_for_preview(tmp_path):
    # the CLI prints the first 50 lines of transformed_code in dry-run mode
    transformed, _ = obfuscate_indirect_calls(STDLIB_SOURCE, tmp_path / "t.c")
    lines = transformed.split("\n")
    assert len(lines) >= 1 and any(line.strip() for line in lines)


def test_dryrun_function_pointers_can_be_sorted_and_printed(tmp_path):
    # the CLI does: for func, ptr in sorted(metadata['function_pointers'].items())
    _, meta = obfuscate_indirect_calls(STDLIB_SOURCE, tmp_path / "t.c")
    items = sorted(meta["function_pointers"].items())
    assert all(isinstance(fn, str) and isinstance(ptr, str) for fn, ptr in items)


# --- edge cases ---

def test_empty_source_gives_zero_counts(tmp_path):
    _, meta = obfuscate_indirect_calls("", tmp_path / "t.c")
    assert meta["total_obfuscated"] == 0
    assert meta["function_pointers"] == {}


def test_source_with_no_known_calls_gives_zero_total(tmp_path):
    source = "#include <stdio.h>\n\nint x = 42;\n"
    _, meta = obfuscate_indirect_calls(source, tmp_path / "t.c")
    assert meta["total_obfuscated"] == 0


def test_total_is_sum_of_stdlib_and_custom(tmp_path):
    # sanity check: total must always equal the two sub-counts added together
    _, meta = obfuscate_indirect_calls(
        MIXED_SOURCE, tmp_path / "t.c",
        obfuscate_stdlib=True, obfuscate_custom=True
    )
    assert meta["total_obfuscated"] == (
        meta["obfuscated_stdlib_functions"] + meta["obfuscated_custom_functions"]
    )