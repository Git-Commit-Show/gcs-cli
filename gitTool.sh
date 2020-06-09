echo " Welcome to the tool" 
echo "1. To clone a project"
echo "2. push the cloned project to remote rep"
read op
case "${op}" in 
	1) echo "Enter the link to the repo";
	   read link;
	   git clone "${link}";
	   IFS='/' read -r -a array <<<cd "${array[4]}";
           bash check.sh
           esac

           
            
