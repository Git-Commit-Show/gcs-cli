username=$(git config user.name)
url=$(git config --get remote.origin.url)
IFS='/' read -r -a array <<< "$url"
if [ "$username"="${array[3]}" ];
then
echo " The repo is cloned from the forked repo";
else
echo " The Repo is cloned from ${url} fork the Repo and set origin as your Rep"
fi 
