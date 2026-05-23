#!/usr/bin/env bash
set -euo pipefail
: "${ADB_ADMIN_PASSWORD:?Set ADB_ADMIN_PASSWORD}"
. adb
impdp admin/${ADB_ADMIN_PASSWORD}@ruby_tp \
  schemas=F1 \
  network_link=RED_LINK \
  logfile=impdp_ruby_red_f1_network_link.log \
  metrics=y \
  logtime=all
