#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 || -z "${1:-}" ]]; then
  printf 'Usage: %s /path/to/movie-file\n' "$0" >&2
  exit 2
fi

config_file="${PLEX_FILESWITCH_CONFIG:-${XDG_CONFIG_HOME:-$HOME/.config}/plex/plex_fileswitch.env}"
if [[ -r "$config_file" ]]; then
  # shellcheck source=/dev/null
  source "$config_file"
fi

: "${PLEX_DEST:?Set PLEX_DEST in $config_file or the environment}"
: "${PLEX_USER:?Set PLEX_USER in $config_file or the environment}"
: "${PLEX_HOST:?Set PLEX_HOST in $config_file or the environment}"

movie="$1"
if [[ ! -f "$movie" ]]; then
  printf '[ERR]: Not a regular file: %s\n' "$movie" >&2
  exit 1
fi

rsync -av -e ssh -P -- "$movie" "${PLEX_USER}@${PLEX_HOST}:${PLEX_DEST}"
printf '[SUCCESS]: Moved %s to %s\n' "$movie" "$PLEX_DEST"
