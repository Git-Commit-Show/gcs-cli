#!/bin/bash

PWD=`pwd`
echo $PWD

echo "Installing Libraries..."
rm -rf /tmp/awk*
cd /tmp
git clone https://github.com/tfritzon/awkdown.git
cd awkdown/
cp awkdown ~/.local/bin/
clear

cd ${PWD}

pwd

echo "Making file executable..."
chmod +x ./gcs.sh;
chmod +x ./jq-linux64;
sleep 2;
echo "Files setup completely."
