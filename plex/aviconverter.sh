#!/bin/bash

# Uses VLC to convert a dir of avi's to mp4
#
function convert() {
for file in *.avi; do
    vlc -I dummy -vvv "$file" --sout="#transcode{vcodec=h264,acodec=mp4a,ab=128,channels=2,deinterlace}:standard{access=file,mux=mp4,dst=${file%.avi}.mp4}" vlc://quit
done   
}

convert

