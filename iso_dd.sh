#!/bin/bash



ISO=$1
DIR=$2

find_iso() {
  # Catches any errors if directory does not exist
  if [[ ! -d $1 ]];then
    echo "[ERROR]: Directory does not exist"
  fi

# TO DO: add case statements for each ISO in folder  
#  case "$ISO" in;
#    eos)

}
