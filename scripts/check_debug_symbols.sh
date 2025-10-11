#!/usr/bin/env bash
set -euo pipefail

if [[ $# -eq 0 ]]; then
  echo "Usage: $0 <binary> [binary ...]" >&2
  exit 1
fi

declare -a candidates

if command -v llvm-readobj >/dev/null 2>&1; then
  candidates+=("$(command -v llvm-readobj)")
elif command -v llvm-readelf >/dev/null 2>&1; then
  candidates+=("$(command -v llvm-readelf)")
fi

if command -v readelf >/dev/null 2>&1; then
  candidates+=("$(command -v readelf)")
fi

if [[ ${#candidates[@]} -eq 0 ]]; then
  echo "Error: no tool found to inspect binaries (llvm-readobj/readelf)" >&2
  exit 2
fi

readobj_bin="${candidates[0]}"

status=0
for artifact in "$@"; do
  if [[ ! -e "${artifact}" ]]; then
    echo "Error: ${artifact} does not exist" >&2
    status=3
    continue
  fi

  if ! output="$(${readobj_bin} --sections "${artifact}" 2>&1)"; then
    echo "Error: failed to inspect ${artifact}: ${output}" >&2
    status=4
    continue
  fi

  if grep -q '\.debug' <<<"${output}"; then
    echo "Debug symbols detected in ${artifact}" >&2
    status=5
  else
    echo "${artifact}: no debug sections detected"
  fi

done

exit ${status}
