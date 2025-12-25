#!/bin/bash

# todo: Add a function to compare file size
# with free storage on server

DEST="/mnt/backpack/Plex/Media/"

addMovie() {
  MOVIE="$1"

  local USER="gh0stpi"
  local HOST="hashirama"

  case true in
    $([[ ! -f $MOVIE ]]))
      echo "[ERR]: Cannot move file. Check -> $MOVIE"
      ;;
    $([[ ! -d $MOVIE ]]))
      echo "[ERR]: Cannot move directory. Check -> $MOVIE"
      ;;
    *)
    rsync -av -e ssh -P "$MOVIE" "$USER"@"$HOST":"$DEST"
    echo "[SUCCESS]: Moved "$MOVIE" to "$DEST""
    ;;
esac
}

#archiveFile() {
#  local DEST='~/Downloads'
#
#  LISTFILE=$(ssh $USER@$HOST ls -A "$DEST")
#
#  # Iterates through folder and checks
#  # last modded date of file
#
#  #this function needs some rearrangement
#  for FILE in $(ls -A $DEST); do
#    if [[ -f "$FILE" ]]; || continue
#    EXT=${FILE##*.-}
#    ARCHIVE=`date -d "30 days ago" +%s`
#    LASTMOD=`date -c "%Y" "$FILE"`
#
#    declare -A OLDMOVIES=()
#
#    case $EXT in
#      mp4|MP4)
#        OLDMOVIES["Archive"]="$FILE"
#        OLDMOVIES["Times"]=$LASTMOD
#        ;;
#      mp3|MP3)
#        OLDMOVIES
#    esac
#  done
#}
#
#
#archiveFile
addMovie "$1"

# todo: Add text processor for "\"
# possibly using sed/awk

