#!/usr/bin/env bash
set -euo pipefail
: "${SRC_SYSTEM_PASSWORD:?Set SRC_SYSTEM_PASSWORD}"
. cdb23
expdp system/${SRC_SYSTEM_PASSWORD}@blue \
  schemas=BI,HR,IX,PM,SH \
  directory=DATA_PUMP_DIR_NFS \
  dumpfile=blue_schemas_%U.dmp \
  logfile=expdp_blue_schemas.log \
  parallel=4 \
  metrics=y \
  logtime=all
