#!/usr/bin/env bash
set -euo pipefail
LOG_PATTERN="${1:-*.log}"
grep -Ei "ORA-|UDI-|error|failed|warning" $LOG_PATTERN || true
