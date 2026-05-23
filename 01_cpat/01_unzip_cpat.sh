#!/usr/bin/env bash
set -euo pipefail
CPAT_ZIP="${CPAT_ZIP:-/home/oracle/scripts/p32613591_112048_Generic.zip}"
CPAT_HOME="${CPAT_HOME:-$HOME/cpat}"
mkdir -p "$CPAT_HOME"
unzip -o "$CPAT_ZIP" -d "$CPAT_HOME"
ls -l "$CPAT_HOME"
