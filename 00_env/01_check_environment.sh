#!/usr/bin/env bash
set -euo pipefail

LOG_DIR="${LOG_DIR:-$HOME/adb_migration_logs}"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/01_check_environment_$(date +%Y%m%d_%H%M%S).log"
exec > >(tee -a "$LOG_FILE") 2>&1

echo "== Listener processes =="
ps -ef | grep LISTENER | grep -v grep || true

echo "== PMON processes =="
ps -ef | grep ora_ | grep pmon | grep -v grep || true

echo "== Podman containers =="
sudo podman ps -a || true

echo "Log: $LOG_FILE"
