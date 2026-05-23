#!/usr/bin/env bash
set -euo pipefail
. cdb23

~/cpat/premigration.sh \
  --connectstring jdbc:oracle:oci:@ --sysdba \
  --pdbs BLUE \
  --targetcloud ADBS \
  --migrationmethod DATAPUMP \
  --reportformat JSON HTML TEXT \
  --outdir ~/cpat_output/2_blue_datapump/

~/cpat/premigration.sh \
  --connectstring jdbc:oracle:oci:@ --sysdba \
  --pdbs RED \
  --targetcloud ADBS \
  --migrationmethod DATAPUMP_DBLINK \
  --reportformat JSON HTML TEXT \
  --outdir ~/cpat_output/3_red_datapump_dblink/
