#!/bin/bash

# This script searches though a folder labled ISO
# Lists all ISO's found in numerical selection then
# mounts your 32GB USB drive for quick ISO install swapping

find_iso() {
  NUM=0

  # Catches any errors if directory does not exist
  if [[ ! -d  ]]; then
    echo "[ERROR]: Directory does not exist."
  fi

  # List all ISOs in folder by number
  cd $1

  for NUM in $(ls $DIR | wc -l); do
    for FILE in $(ls); do
    if [[ ${FILE##.-} == "*.iso"  ]]; then
      echo "[$NUM]:  $ISO"
    fi
  done
done

}


checkUUID() {
  UUID=""
  lsusb

  if [[ "$DEV" == "$UUID" ]]; then
    find_iso
  fi
}
