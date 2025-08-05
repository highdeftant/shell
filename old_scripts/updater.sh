#!/bin/bash

updateSys() {
  LIST=("update" "upgrade" "autoclean" "autoremove")

  for item in ${LIST[@]}; do
    sudo apt $item
  done
}
updateSys
