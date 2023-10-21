#!/bin/bash

# Auto-Backup and update OS on schedule

DATE=$(date +%b-%d-%y)
TIME=$(date +%H:%M:%S)
EXTDR="/dev/sdd1"
CRONLOGS="$USER/Documents/cronlogs/"

# Searches to see if directory is made, if not, create it
# After directory creation, mount the drive
function findHDD() {

	if [ ! -d $BACKUPDR ]; then
		echo "Backup Drive not located... Creating directory..."
		mkdir -p $BACKUPDR
	else
		if grep -qs "$EXTDR" /proc/mounts; then
			echo "Device is already mounted"
		fi
	fi

	if sudo mount $EXT $BACKUPDR; then
		echo "Backup Drive has been mounted"
	else
		echo "Mounting Failed! Errors sent to log file"
		echo >>&2 $CRONLOGS/backuperr.log
		notify-send "Mounting Failed! Errors sent to log file"
	fi
}

#
function backupos() {
	sudo rm -vr .cache/mozilla/ .cache/brave*/
	
	if [ -d $BACKUPDR ]; then
		notify-send "OS Backup Starting"
		echo $DATE "@" $TIME
		echo "Initiating Backup...."
		sudo rsync -av --delete $HOME $BACKUPDR >> $CRONLOGS/backup.log
		echo "Backup Completed at $TIME"
	elif [ ! -d $BACKUPDR ]; then
		echo "Drive not detected. Can't perform backup!"
		echo >>&2 $CRONLOGS/backuperr.log
	fi


}

function restoreos() {
	if [-d $BACKUPDR]; then
		echo "Starting Restoration..."
		sudo rsync -av $BACKUPDR $HOME
	fi
}


function updateOS() {
	updates=('update' 'dist-upgrade' 'autoclean' 'autoremove')
	echo $DATE "@" $TIME
 	echo "Starting Updater...."

	for i in $updates
	do 
		sudo apt $i
	done

 	echo "Update Completed!"
 	echo "Completed at $TIME"
}

findHDD
backupos

exit
