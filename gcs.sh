#!/bin/bash

trap '' 2
while true
do
	clear
	echo "============================"
	echo "Menu ----"
	echo "============================"
	echo "Type volunteer to list volunteers."
	echo "Type speaker to list speakers."
	echo "Type q to list exit."
	echo -e "\n"
	echo -e "Enter your choice \c"
	read option
	case "$option" in
		volunteer) curl -sS https://raw.githubusercontent.com/Git-Commit-Show/volunteers/master/index.md | mdless;;
		speaker) pwd; cal;;
		q) exit;;
	esac
	echo -e "Enter return to continue \c"
	read input
done
