#!/bin/bash

# Disk alert by Daniel Kayode

THRESHOLD=80
LOG="/home/docker/daniel/usage.alert/disk_alert.log"

U=$(df / | awk 'END{print +$5}' | tr -d '%')
H=$(hostname)
D=$(date '+%F %T')

if [ "$U" -gt "$THRESHOLD" ]; then
  M="ALERT: $H disk at ${U}% ($D)"
  echo "$M" | tee -a "$LOG"
else
  echo "$D OK: $U%" >> "$LOG"
fi
