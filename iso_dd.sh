#!/bin/bash

# This script searches though a folder labled ISO
# Lists all ISO's found in numerical selection then
# mounts your 32GB USB drive for quick ISO install swapping

find_iso() {
  ISO=0

  # Catches any errors if directory does not exist
  if [[ ! -d  ]]; then
    echo "[ERROR]: Directory does not exist."
  fi

  for FILE in $(ls $DIR); do
    echo "[$ISO]"
    if [[ ${FILE##.-} == ".iso" ]]; then

    fi
  done


}
