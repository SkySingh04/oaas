#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <binary> [binary ...]" >&2
  exit 1
fi

if ! command -v r2 >/dev/null 2>&1; then
  echo "Error: radare2 (r2) is not installed or not in PATH" >&2
  exit 2
fi

status=0
for artifact in "$@"; do
  if [[ ! -e "${artifact}" ]]; then
    echo "Error: ${artifact} does not exist" >&2
    status=3
    continue
  fi

  echo "Analyzing ${artifact} with radare2..."

  if ! section_output="$(r2 -nnqc 'iS~.debug' "${artifact}" 2>/dev/null)"; then
    echo "Error: radare2 failed to inspect ${artifact}" >&2
    status=4
    continue
  fi

  if [[ -n "${section_output}" ]]; then
    echo "Debug sections detected in ${artifact}:"
    echo "${section_output}"
    status=5
  else
    echo "${artifact}: no .debug sections detected"
  fi

  if ! dwarf_output="$(r2 -nnqc 'iIj~DWARF' "${artifact}" 2>/dev/null)"; then
    echo "Warning: unable to query DWARF metadata for ${artifact}" >&2
    continue
  fi

  if [[ -n "${dwarf_output}" ]]; then
    echo "DWARF metadata strings detected in ${artifact}:"
    echo "${dwarf_output}"
    status=6
  else
    echo "${artifact}: no DWARF metadata strings detected"
  fi

done

exit ${status}
