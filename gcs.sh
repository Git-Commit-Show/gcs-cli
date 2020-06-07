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
		v | volunteer) echo "Listing Volunteers.";
			echo "Lists everything.......";
			echo -e "Enter your choice \c";
			read val
			case "$val" in 
				1) echo "1";;
				2) echo "2";;
			esac
			rm parth.md parth.html;
			curl -sS -O https://raw.githubusercontent.com/Git-Commit-Show/volunteers/master/2020/parth.md;
			awkdown parth.md > parth.html;
			html2text parth.html;
			 ;;
		speaker) pwd; cal;;
		q) exit;;
	esac
	echo -e "Enter return to continue \c"
	read input
done
