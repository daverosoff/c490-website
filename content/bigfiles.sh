#/bin/bash

MY_PATH=$1

if [[ -z "$1" ]]; then

    INPUT="Enter the path/directory you want to check: "
    read -p "${INPUT}" MY_PATH
fi 

#If there's no input continue with the current directory on default
MY_PATH=${MY_PATH:-.}


#Check if the user has permission to execute and edit. 

if ! [[ -r "$MY_PATH" ]] && [[ -x "$MY_PATH" ]]; then
        echo "File does not have read and execute permissions for user"
        exit 2
fi

#Check if the path provided exists 

if [[ -d "${MY_PATH}" ]]; then
cd $MY_PATH
du -hsx * | sort -rh | head -5

exit 0

else
	echo "Direcotry doesn't exist" 
	exit 1
fi
 