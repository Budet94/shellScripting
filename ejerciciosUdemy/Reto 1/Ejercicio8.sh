#!/bin/bash
#read -p "Provide a File or Path " $FILE_OR_PATH
#FILE_OR_PATH=$1

USER_INPUT=$@

echo $USER_INPUT


for i in ${USER_INPUT[@]}
do


if [[ -d $i ]]; then
  #statements
  echo "User Provided a Path"
  #Move to path

elif [[ -f $i ]]; then
  #statements
  echo "User Provided a File"
else
  echo "User did not provide a file or path"
fi
done
