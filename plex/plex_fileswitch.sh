#!/bin/bash

# todo: Add a function to compare file size
# with free storage on server

DEST="Plex/Media/"

addMovie() {
  MOVIE="$1"

  local USER="gh0stpi"
  local HOST="hashirama"
  
  if [[ ! -f "$MOVIE" ]]; then
    echo "[ERROR]: "$MOVIE" not found"
  else
    rsync -av -e ssh -P "$MOVIE" "$USER"@"$HOST":"$DEST"
    echo "[SUCCESS]: Moved "$MOVIE" to "$DEST""
  fi
}

addMovie "$1"

list_dir() {
  NUM=0

  if [[ -d "$MOVIE" ]]; then
    echo "v- Move which file -v"
    for "SERIES" in "$MOVIE"; do
      (( NUM ++))
      echo "[$NUM]:" "$SERIES"
    done
  fi
}
# todo: Add text processor for "\"
# possibly using sed/awk

# todo: Add funtion to scan for files older
# than 30+ days and prompt to delete/keep

#archiveFile() {
#  LISTFILE=$(ssh $USER@$HOST ls -A "$DEST")
#
#  # Iterates through folder and checks
#  # last modded date of file
#
#
#  #this function needs some rearrangement
#  for FILE in $LISTFILE; do
#    [[ -f $FILE ]]; || continue
#    EXT=${FILE##*.-}
#    ARCHIVE=`date -d "30 days ago" +%s`
#    LASTMOD=`date -c "%Y" "$FILE"`
#    declare -A OLDMOVIES=()
#    case $EXT in
#      mp4|MP4)
#        OLDMOVIES["Archive"]="$FILE"
#        OLDMOVIES["Times"]=$LASTMOD
#        ;;
#    esac
#  done
#}
#
