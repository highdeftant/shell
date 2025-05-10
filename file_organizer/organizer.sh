#!/bin/bash

declare -A FILE_TYPES=(
["Documents"]="pdf docx txt csv"
["Images"]="jpg jpeg png gif svg"
["Audio"]="mp4 wav flac"
["Videos"]="mp4 avi mov mkv"
["Scripts"]="sh py rb"
)

# Takes in directory as argument

FOLDER=$1
ERR=0
MOVED=0

# Function to move files
move_files() {

	local SOURCE="$1"
	local DEST=$2
	mkdir -p $DEST

	if [[ ! -d $DEST ]]; then
		echo "ERROR: $DEST2 not a valid folder." | tee -a "$LOGFILE"
		echo "Continuing with Default Directory Creation...." | tee -a "$LOGFILE"
		return 0
	fi


	if mv "$SOURCE" "$DEST" 2>> "$LOGFILE"; then
		echo "$(date +%Y-%m-%d.%H:%M) Moving $SOURCE => $DEST" | tee -a "$LOGFILE"
		(( MOVED++ ))
		return 0
	else
		echo "$(date +%Y-%m-%d.%H:%M) ERROR: Failed to move $SOURCE" >&2 | tee -a "$LOGFILE"
		(( ERR++ ))
	fi
	}

 	# Checks if directory exists
if [[ ! -d "$FOLDER" ]]; then
	echo "ERROR: Directory $FOLDER does not exist."
	exit 1
fi

	# Grabs all files in specified folder
for FILE in "$FOLDER"/*; do
	[[ -f "$FILE" ]] || continue
	echo "Checking $FILE ..."
	LASTMOD=`stat -c "%Y" "$FILE"`
	ARCHTIME=`date -d "30 days ago" +%s`
	EXT=${FILE##*.-}
	
	# Skips all dot files
 [[ "$(basename "FILE")" == .* ]] && continue

	# Checks last modified time against main archive time (~30 days)
	if [[ $LASTMOD -lt $ARCHTIME ]]; then
		ARCHIVE="ARCHIVE_$(date +%Y-%m-%d)"
		LOGFILE="Archive_$(date +%Y-%m-%d).log"
	
		# Matches all Extensions in specified directory
		case "$EXT" in
			pdf|docx|txt|csv)
			DEST="$HOME/$ARCHIVE/Documents"
			;;
			jpg|jpeg|png|gif|svg)
			DEST="$HOME/$ARCHIVE/Images"
			;;
			mp3|wav|flac)
			DEST="$HOME/$ARCHIVE/Audio"
			;;
			mp4|avi|mov|mkv)
			DEST="$HOME/$ARCHIVE/Videos"
			;;
			sh|py|rb)
			DEST="$HOME/$ARCHIVE/Scripts"
			;;
			*)
			DEST="$HOME/$ARCHIVE/Other"					
		esac
		move_files "$FILE" "$DEST"
	fi
done

echo -e "\n======[Summary]======"
echo "Files Moved: $MOVED"
echo -e "Errors Encountered $ERR\n"

