#!/bin/bash

# Auto-Backup and update OS on schedule

DATE=$(date +%b-%d-%y)
TIME=$(date +%H:%M:%S)
EXTDR=/dev/sdd1
BACKUPDR=/mnt/media/$USER/backupdr/arch_backup/
CRONLOGS=$USER/Documents/cronlogs/
UUID='63ACC6CE2E1BC18D'

function backupos() {
	sudo rm -vr ~/.cache/mozilla ~/.cache/brave*/
	notify-send "Backup Starting"
	echo $DATE "@" $TIME
	echo "Initiating Backup...."
	sudo rsync -av --delete $HOME $BACKUPDR 
	echo "Backup Completed at $TIME"
	notify-send "Backup Completed at $TIME"
}

# Searches to see if directory is made, if not, create it
# After directory creation, mount the drive

function findHDD() {
	if lsblk -f | grep -q $UUID; then
		echo 'Device mounted, ready for backup....'
		backupos
	else
		echo 'Device not found'
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


exit
