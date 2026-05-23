#!/usr/bin/env bash
set -euo pipefail
: "${ADB_ADMIN_PASSWORD:?Set ADB_ADMIN_PASSWORD}"
. adb
impdp admin/${ADB_ADMIN_PASSWORD}@sapphire_tp \
  schemas=BI,HR,IX,PM,SH \
  directory=DATA_PUMP_DIR_NFS \
  dumpfile=blue_schemas_%U.dmp \
  logfile=impdp_sapphire_blue_schemas.log \
  parallel=4 \
  metrics=y \
  logtime=all
