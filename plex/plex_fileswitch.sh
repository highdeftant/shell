#!/bin/bash

# todo: Add a function to compare file size
# with free storage on server

DEST="/mnt/Plex/Media/"

addMovie() {
  MOVIE="$1"

  local USER="gh0stpi"
  local HOST="hashirama"

  case true in
    $([[ -f $MOVIE ]]))
      echo "[ERR]: Cannot move file. Check -> $MOVIE"
      ;;
    $([[ -d $MOVIE ]]))
      echo "[ERR]: Cannot move directory. Check -> $MOVIE"
      ;;
    *)
    rsync -av -e ssh -P "$MOVIE" "$USER"@"$HOST":"$DEST"
    echo "[SUCCESS]: Moved "$MOVIE" to "$DEST""
    ;;
esac

addMovie "$1"

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
