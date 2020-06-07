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
	echo "Type stream to stream the Master Class"
	echo "Type Glimpse to See what GCS 2019 was like"
	echo "Type Schedule to See the Schedule of GCS-20"
	echo "Type countdown to show a timer"
	echo "Type q to list exit."

	echo -e "\n"
	echo -e "Enter your choice \c"
	read option
	case "$option" in
		v | volunteer)while true
		do
			clear
		       	echo "Listing Volunteers.";
			echo "1.Pradeep Sharma";
			echo "2.Barış Elçin";
			echo "3.Shreya Arora";
			echo "4.Eric Mao";
			echo "5.Parth krishna";
			echo "6.Annet Tomcy";
			echo "7.Apurva Kulkulewar";
			echo "8.Akhil Mantha";
			echo "9.Ayush Aryan";
			echo "10.Dinesh Kumar";
			echo "11.Varun Bharadwaj";
			echo "12.Sarvesh Khandelwal";
			echo "13.Aditya Yadav";
			echo "14.Deepak Jakhar";
			echo "15.Ritik Loomba";
			echo "Type b to go back";
			echo -e "Enter your choice \c";
			read val
			case "$val" in 
				1 | Pradeep) echo " Details About Pradeep Sharma";;
				2 | Barış) echo " Details About Barış Elçin";;
				3 | Shreya) echo " Details About Shreya Arora";;
				4 | Eric) echo " Details About Eric Mao";;
				5 | Parth) echo " Details About Parth krishna";;
				6 | Annet) echo " Details About Annet Tomcy";;
				7 | Apurva) echo " Details About Apurva Kulkulewar";;
				8 |  Akhil) echo " Details About Akhil Mantha";;
				9 |  Ayush) echo " Details About Ayush Aryan";;
			       10 | Dinesh) echo " Details About Dinesh Kumar";;
			       11 | Varun) echo " Details About Varun Bharadwaj";;
			       12 | Sarvesh) echo " Details About Sarvesh Khandelwal";;
		       	       13 | Aditya) echo " Details About Aditya Yadav";;
			       14 | Deepak) echo " Details About Deepak Jakhar";;
			       15 | Ritik) echo " Details About Ritik Loomba";;
		               b) break;;
			esac
		        echo -e "Enter return to continue \c"
		        read input
		done
			rm parth.md parth.html;
			curl -sS -O https://raw.githubusercontent.com/Git-Commit-Show/volunteers/master/2020/parth.md;
			awkdown parth.md > parth.html;
			html2text parth.html;
			 ;;
		speaker | s)while true
		do
			 clear
		       	 echo "Listing Speakers.";
			 echo " 1 SCOTT HANSELMANN";
			 echo " 2 SARTHAK VATS";
			 echo " 3 ANUPAM VARGHESE";
			 echo " 4 PHIL STURGEON";
			 echo " 5 MUHAMMAD AHSAN AYAZ";
			 echo " 6 ERIC NORMAND";
			 echo " 7 ROGER DANNENBERRG";
			 echo " 8 SANDEEP GIRI";
			 echo " 9 NILESH TRIVEDI";
			 echo " Type b to go back";
			 echo -e "Enter your choice \c";
			 read val
	        	 case "$val" in
                                 1 | SCOTT) echo " Details About SCOTT HANSELMANN";;
				 2 | SARTHAK) echo " Details About SARTHAK VATS";;
				 3 | ANUPAM) echo " Details About ANUPAM VARGHESE";;
				 4 | PHIL) echo " Details About PHIL STURGEON";;
				 5 | MUHAMMAD) echo " Details About MUHAMMAD AHSAN AYAZ";;
				 6 | ERIC) echo " Details About ERIC NORMAND";;
				 7 | ROGER) echo " Details About ROGER DANNENBERRG";;
				 8 | SANDEEP) echo " Details About SANDEEP GIRI";;
				 9 | NILESH) echo " Details About NILESH TRIVEDI";;				 
				 b) break;;
			 esac
	               echo -e "Enter return to continue \c"
                       read input 		       
		 done
		 ;;
                stream |s) echo "STreams a videos";	
	                 ;;
                schedule | sc) echo "Prints the Schedule";
	                 ;;		 
		q) exit;;
	esac
	echo -e "Enter return to continue \c"
	read input
done
