#!/bin/bash

# This script searches though a folder labled ISO
# Lists all ISO's found in numerical selection then
# mounts your 32GB USB drive for quick ISO install swapping


DIR=$1

checkUUID() {
  declare -A DEVICE=()
  DEV=$(blkid | awk '/UUID/ {print $3}')
  UUID2="65d75412-118b-49d6-b2ce-2bf1448c711b"

  for DEVICE in $DEV; do

    if [[ "$DEV" == "$UUID" ]]; then
      findIso "$DIR"
    else
      echo "[ERROR]: UUID Not Found. USB may not be mounted."
    fi
  done
}

findIso() {
  if [[ ! -d "$DIR" ]]; then
    echo "[ERROR]: Directory does not exist."
    exit
  fi

  for FILE in $(ls -A "$DIR"); do
    if [ -f "$FILE"  ]; then
      if [[ ${FILE##.-} == "*.iso"  ]]; then 
        declare -A ISOLIST=()
        ISOLIST["ISOS"]="$FILE"
      fi
    fi
  done

  echo "----- ISO BOOTER v0.2 -----"
  for star in {0..2}; do
    echo "|                   |"
  done
  echo -e "----- CHOOSE ISO -----\n"

  for NUM in ${!ISOLIST[@]}; do
    for FILE in ${ISOLIST[@]}; do
     #Lists Number of file, filename
     echo "[$NUM]: ${ISOLIST[NUM]}"
   done
 done

  read -r "IMG/ISO to Mount" CHOICE
}

burnISO() {
  DEST=$1
  DEV=$2

  sudo dd if="$DEST" of="$DEV" bs=4M status=progress   
}

#checkUUID
findIso
#burnISO
