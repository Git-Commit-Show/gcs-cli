#!/bin/bash

PWD=`pwd`
echo $PWD

echo "Installing Libraries..."

rm -rf /tmp/awk*
cd /tmp
git clone https://github.com/tfritzon/awkdown.git
cd awkdown/
cp awkdown ~/.local/bin/
vlcPath=$( command -v vlc)
streamLinkPath=$(command -v streamlink)
ffmpegPath=$(command -v ffmpeg) 
if [ ${#vlcPath} == 0 ]
then
	sudo apt install vlc
fi
if [ ${#streamLinkPathsudo} == 0 ]
then
	       sudo apt install streamlink
fi
if [ ${#ffmpegPath} == 0 ]
then
	        sudo apt install ffmpeg
fi
cd ${PWD}
pwd

echo "Making file executable..."
chmod +x ./gcs.sh;
sleep 2;
echo "Files setup completely."
