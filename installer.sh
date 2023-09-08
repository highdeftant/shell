#!/bin/bash

function clonevundle() {
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
}

function GwE() {
	sudo apt install git meson python3-pip python3-setuptools libcairo2-dev libgirepository1.0-dev libglib2.0-dev libdazzle-1.0-dev gir1.2-gtksource-3.0 gir1.2-appindicator3-0.1 python3-gi-cairo appstream-util -y
}

function kismet() {
	wget -O - https://www.kismetwireless.net/repos/kismet-release.gpg.key | sudo apt-key add -
	echo 'deb https://www.kismetwireless.net/repos/apt/release/hirsute hirsute main' | sudo tee /etc/apt/sources.list.d/kismet.list
	sudo apt update -y
	sudo apt install kismet -y
}

function locatepointer() {
	gsettings set org.gnome.desktop.interface locate-pointer true
	gsettings set org.gnome.mutter locate-pointer-key Shift_R
}


DEBFILES=/media/$USER/BACKUPDRIVE/FOLDER/debfiles/*.deb
GWEINSTALLER='./Labs/scripts/gweinstaller.sh'

for files in $(cat ~/Documents/packages/installfiles.txt)
do
	sudo apt install $files -y
done


flatpak install spotify -y

clonevundle
GwE
kismet
locatepointer



sudo dpkg -i $DEBFILES -y
$GWEINSTALLER


exit
