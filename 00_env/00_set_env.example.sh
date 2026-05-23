#!/usr/bin/env bash
set -euo pipefail

export ADB_ADMIN_PASSWORD="Welcome_1234"
export SRC_CDB_ENV="cdb23"
export ADB_ENV="adb"
export CPAT_HOME="$HOME/cpat"
export CPAT_OUTPUT="$HOME/cpat_output"
export LOG_DIR="$HOME/adb_migration_logs"
mkdir -p "$LOG_DIR"
