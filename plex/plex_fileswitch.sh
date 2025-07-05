#!/bin/bash

# todo: Add a function to compare file size
# with free storage on server

$DEST="/home/$USER/Plex/Media/Movies"

addMovie() {
  MOVIE=$1
  local USER='gh0stpi'
  local HOST='hashirama'

  if [[ ! -f $MOVIE ]]; then
    echo "[ERROR]: $MOVIE not found"
  else
    rsync -av -e ssh $MOVIE $USER@$HOST:$DEST
    echo "[SUCCESS]: Moved $MOVIE to $DEST"
  fi



# todo: Add funtion to scan for files older
# than 30 days and prompt to delete/keep
archiveFile() {
  COUNT=ssh $USER@$HOST "ls $DEST | wc -l"
}


addMovie
