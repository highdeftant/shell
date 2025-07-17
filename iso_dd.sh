#!/bin/bash

# This script searches though a folder labled ISO
# Lists all ISO's found in numerical selection then
# mounts your 32GB USB drive for quick ISO install swapping

findIso() {
  NUM=0

  # Catches any errors if directory does not exist
  if [[ ! -d ]]; then
    echo "[ERROR]: Directory does not exist."
    exit
  fi

  # List all ISOs in folder by number
  for FILE in $(ls -A $1); do
    if [ -f "$FILE"  ]; || continue
      if [[ ${FILE##.-} == "*.iso"  ]]; then
        NUM=$((NUM + 1))
      fi
       echo "ISO BOOTER V0.1"
       echo "----- CHOOSE ISO -----"
       echo "[$NUM]: $ISO"
    fi
  done
}

# Checks UUID for specific UUID if the same drive is always used
checkUUID() {
  DEV=`lsblk | grep $UUID`
  UUID="67DA-AABF"

  if [[ "$DEV" == "$UUID" ]]; then
    findIso $1
  fi
}

# Run functions

checkUUID
findIso
