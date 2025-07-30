#!/bin/bash

# This script searches though a folder labled ISO
# Lists all ISO's found in numerical selection then
# mounts your 32GB USB drive for quick ISO install swapping

findIso() {
  # Checks directory existence
  if [[ ! -d $1 ]]; then
    echo "[ERROR]: Directory does not exist."
    exit
  fi

  # List all files, finds the .iso, adds it to array
  for FILE in $(ls -A $1); do
    if [ -f "$FILE"  ]; then
      # Checks for .ext
      if [[ ${FILE##.-} == "*.iso"  ]]; then 
        # Create list and add isos to list
        declare -A ISOLIST=()
        ISOLIST["ISOS"]="$FILE"
      fi
    fi
  done

  echo "**** ISO BOOTER V0.1****"
  for star in {0..4}; do
    echo "*"
  done
  echo "----- CHOOSE ISO -----"

  for NUM in ${!ISOLIST[@]}; do
    for FILE in ${ISOLIST[@]}; do
     #Lists Number of file, filename
     echo "[$NUM]: ${ISOLIST[NUM]}"
   done
 done

  # Ask user for ISO Choice
  read -r "IMG/ISO to Mount" CHOICE }

# Checks UUID for specific UUID if the same drive is always used
checkUUID() {
  DEV=$(blkid | awk '/UUID/ {print $3}')
  UUID2="65d75412-118b-49d6-b2ce-2bf1448c711b"

  for DEVICE in $DEV; do
    if [[ "$DEV" == "$UUID" ]]; then
      findIso $1
    else
      echo "[ERROR]: UUID Not Found. USB may not be mounted."
    fi
  done
}

# Takes the selected ISO and burns it to the disk
burnISO() {
  DEST=$1
  DEV=$2

  sudo dd if="$DEST" of="$DEV" bs=4M status=progress   
}

checkUUID
findIso
