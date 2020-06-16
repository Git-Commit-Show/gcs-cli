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
				new='$val.md'
				echo $new
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
				new='$val.md'
				echo $new
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
                stream |s) echo "STreams a videos";	
	                 ;;
                schedule | sc) echo "Prints the Schedule";
	                 ;;		 
		q) exit;;
	esac
	echo -e "Enter return to continue \c"
	read input
done
