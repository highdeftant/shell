#!/bin/bash

DIR=$HOME
FEED=$1



curl $FEED | awk '/src="https/ {print $4}' > quicktext.txt
LINK=$(cat quicktext.txt | cut -b 6-70)
#wget -P $DIR $LINK
wget $LINK
rm quicktext.txt
