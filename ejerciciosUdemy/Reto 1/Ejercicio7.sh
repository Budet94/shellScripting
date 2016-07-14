#!/bin/bash
#read -p "Provide a File or Path " $FILE_OR_PATH
#FILE_OR_PATH=$1

USER_INPUT=$1



if [[ -d $USER_INPUT ]]; then
  #statements
  echo "User Provided a Path"
  #Move to path
  cd $USER_INPUT
  ls -ll
elif [[ -f $USER_INPUT ]]; then
  #statements
  echo "User Provided a File"
else
  echo "User did not provide a file or path"
fi
