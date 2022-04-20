#!/bin/bash

# Auto-Backup and update OS on schedule

DATE=$(date +%b-%d-%y)
TIME=$(date +%H:%M:%S)
SRCDIR=~/
DESTUSB=/media/gh0st/mybook/os_backup/

function restoreos() {
	DESTDR=~/
	SRCDR=/media/gh0st/mybook/os_backup
	echo "Starting Restoration..."
	sudo rsync -av $SRCDR $DESTDR
}

function backupos() {
	echo $DATE "@" $TIME
	echo "Starting Backup...."
	sudo rm -vr .cache/mozilla/*
	sudo rsync -av --delete $SRCDIR $DESTUSB
	echo "Backup Completed at $TIME"
}

function updateOS() {
	updates=('update' 'dist-upgrade' 'autoclean' 'autoremove' )
	echo $DATE
  echo $TIME

	for i in $updates
	do 
		sudo apt $i
	done

 	echo "Starting Update"
 	echo "Update Complete"
 	echo "Completed at $TIME"
}

backupos
echo "\n \n \n"
echo "-------------------------"
echo "-------------------------"
echo "-------------------------"
exit
