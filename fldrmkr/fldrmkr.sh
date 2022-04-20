#!/bin/bash

# Builds directory for web development (HTML/CSS) *MAC OSX*
# Dropbox/Projects/"New Project"/resources/css/index.css
#                   ^^^index.html

TIME=$(date +%H:%M)
DATE=$(date +%b-%d)

echo "------ SYD'S DIRECTORY BUILDER ------"
echo "------ VERSION ID *0.2.5* OSX  ------"
echo "------  Today is $DATE $TIME   ------"
echo "*"
echo "*"

echo "Hi Syd, Have a good day!"
echo "------------------------"
cd /Users/Sydney/Dropbox/Projects/
read -p "Name Project: " FOLDER
sleep 1
mkdir $FOLDER
cd $FOLDER
sleep 1
touch index.html | mkdir resources/
sleep 1
mkdir resources/css/
touch resources/css/index.css


echo "*"
echo "*"
echo "------ DIRECTORIES CREATED ------"
echo "------   SCRIPT COMPLETE   ------"
echo "------    Built By: Ant    ------"

exit



# Update Log:
# *Ver 0.2.5*
# added "Name Project" to read command to minimize script
# Added Time/Date Description in intro
# Added a update log lol
# Added seperator between greeting and folder creation


# Compatible with Linux/MACOSX
