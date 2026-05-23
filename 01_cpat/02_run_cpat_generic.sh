#!/usr/bin/env bash
set -euo pipefail
. cdb23
~/cpat/premigration.sh \
  --connectstring jdbc:oracle:oci:@ --sysdba \
  --targetcloud ALL \
  --migrationmethod ALL \
  --reportformat JSON HTML TEXT \
  --outdir ~/cpat_output/1_generic/
