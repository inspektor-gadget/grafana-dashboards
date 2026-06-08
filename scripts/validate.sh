#!/usr/bin/env bash
# Validate that every dashboard JSON file in the repo is well-formed JSON
# and has the minimal expected Grafana dashboard keys.
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DASHBOARDS_DIR="${ROOT_DIR}/dashboards"

if ! command -v jq >/dev/null 2>&1; then
    echo "error: jq is required" >&2
    exit 1
fi

fail=0
found=0
while IFS= read -r -d '' file; do
    found=1
    if ! jq empty "${file}" >/dev/null 2>&1; then
        echo "INVALID JSON: ${file}" >&2
        fail=1
        continue
    fi
    for key in title schemaVersion panels; do
        if ! jq -e "has(\"${key}\")" "${file}" >/dev/null; then
            echo "MISSING KEY '${key}': ${file}" >&2
            fail=1
        fi
    done
    echo "ok: ${file#${ROOT_DIR}/}"
done < <(find "${DASHBOARDS_DIR}" -type f -name '*.json' -print0)

if [[ "${found}" -eq 0 ]]; then
    echo "no dashboards found under ${DASHBOARDS_DIR} (nothing to validate)"
fi

exit "${fail}"
