#!/bin/bash
trap '' 2
getData(){
	var='https://github.com/Git-Commit-Show/'$1'/tree/master/2020'
        if [ -f html.txt ] 
	then
		rm html.txt
		rm imdt.txt
		rm imdt1.txt
		rm final.txt
	fi
		curl -sS $var -o html.txt
		filter1='<\s*a class="js-navigation-open "[^>]*>(.*?)<\s*/\s*a>'
		filter2='>(.*?)<'
		file=$(grep -oP '<\s*a class="js-navigation-open "[^>]*>(.*?)<\s*/\s*a>'  html.txt)
		echo $file > imdt.txt
		final=$(grep -oP '>(.*?)<' imdt.txt )
		echo $final > imdt1.txt
		o="$(tr -cs 'a-zA-Z0-9\.' '\n' < imdt1.txt)"
		echo "$o" > final.txt
		
}
getIndiData(){
        if [ -f $1 ]
	then

		rm $1
	        rm file.html	
	fi
	curl -sS -O https://raw.githubusercontent.com/Git-Commit-Show/volunteers/master/2020/$1;
	awkdown $1 > file.html;
	html2text file.html;
}
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
		       	echo "Listing Volunteers.";
			getData volunteers
		        input="final.txt"
			count=1
			while IFS= read -r line
			do
				if [ ${#line} \> 0 ]
			       	then
		       	        line=${line%???}	
				echo "$count.  $line"  
				count=$((count+1))
				fi
		       	done < "$input"
			echo "Type b to go back";
			echo -e "Enter your choice \c";
			read val
			case "$val" in 
			b ) break ;;
			* )
			if [ ${#val} = 1 ]
			then 
				count=1
				val=$((val+1))
				vname=0
				while IFS= read -r line
		                do
				if [ $count = $val ]
				then		
					vname=$line
                                        break					
				fi
				count=$((count+1))
               			done < "$input"
				echo $vname
                                getIndiData $vname
			else
				new=$val.md
				getIndiData $new
			fi
			rm file.html
		        rm imdt.txt
		        rm imdt1.txt
		        rm html.txt	
			;;

	esac
		        echo -e "Enter return to continue \c"
		        read input
		done
			 ;;
		speaker | s)while true
		do
			 clear
		       	 echo "Listing Speakers.";
			getData speakers
		        input="final.txt"
			count=1
			while IFS= read -r line
			do
				if [ ${#line} \> 0 ]
			       	then
		       	        line=${line%???}	
				echo "$count.  $line"  
				count=$((count+1))
				fi
		       	done < "$input"
			echo "Type b to go back";
			echo -e "Enter your choice \c";
			read val
			case "$val" in 
			b ) break ;;
			* )
			if [ ${#val} = 1 ]
			then 
				count=1
				val=$((val+1))
				vname=0
				while IFS= read -r line
		                do
				if [ $count = $val ]
				then		
					vname=$line
                                        break					
				fi
				count=$((count+1))
               			done < "$input"
				echo $vname
                                getIndiData $vname
			else
				new=$val.md
				getIndiData $new
			fi
			rm file.html
		        rm imdt.txt
		        rm imdt1.txt
		        rm html.txt	
			;;

	esac
		        echo -e "Enter return to continue \c"
		        read input
		done
			 ;;
	        glimpse | g) echo 'Git Commit Show is the leading online tech conference where <b>senior engineers</b>, researchers,scientists and professors meet while <b>being at home</b> <br />A 2-day long, online meetup where carefully curated senior developers and researchers share their knowledge and breakthrough project.<br />Unlike other online conferences, it is fully <b>interactive</b> with opportunities to connect with speakers and fellow attendees <b>face o face</b>.<br />Git Commit Show <b>started in 2019</b> to provide a better alternative to physical conferences by being open, free and inclusive of people who come from remote locations and modest backgrounds.' > display.txt
			html2text display.txt

		;;
                stream |s)while true
		do
			   echo "Stream any of these master classes";
			   echo "1. Master Class 1"
			   echo "2. Master Class 2"
			   echo "3. Play LiveStream"
			   echo " Type b for Break"
			   echo "Enter your Choice"
		           read val
		          case $val in 
	                  1 | masterclass1 )streamlink 'Link o mastr class 1' ;;
			  2 | masterclass2 )streamlink 'Link o mastr class 2' ;;
			  3 | livestream )streamlink 'Link o mastr class 1' ;;
			  b) break;;
	       esac
                        echo -e "Enter return to continue \c"
                        read input
		done
	                 ;;
                schedule | sc) html2text new.txt
	                 ;;		 
		q) exit;;
	esac
	echo -e "Enter return to continue \c"
	read input
done
