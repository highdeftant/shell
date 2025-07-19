#!/bin/bash

# This script searches though a folder labled ISO
# Lists all ISO's found in numerical selection then
# mounts your 32GB USB drive for quick ISO install swapping

findIso() {
  NUM=0

  # Checks directory existence
  if [[ ! -d $1 ]]; then
    echo "[ERROR]: Directory does not exist."
    exit
  fi

  # List all ISOs in folder by number
  for FILE in $(ls -A $1); do
    if [ -f "$FILE"  ]; || continue
      if [[ ${FILE##.-} == "*.iso" || ".img"  ]]; then
        echo "ISO BOOTER V0.1"
        echo "----- CHOOSE ISO -----"
        NUM=$((NUM + 1))
        echo "[$NUM]: $ISO"
      fi
       read -r "IMG/ISO to Mount" CHOICE
    fi
  done
}

# Checks UUID for specific UUID if the same drive is always used
checkUUID() {
  DEV=`blkid | awk '/UUID/ {print $3}'
  UUID2="65d75412-118b-49d6-b2ce-2bf1448c711b"

  for DEVICE in $DEV; do
    if [[ "$DEV" == "$UUID" ]]; then
      findIso $1
    else
      echo "[ERROR]: UUID Not Found. USB may not be mounted."
    fi
  done
}

burnISO() {
  DEST=
  sudo dd if=/path/to/yourfile.img of=/dev/sdX bs=4M status=progress   
}


# Run functions
checkUUID
findIso
