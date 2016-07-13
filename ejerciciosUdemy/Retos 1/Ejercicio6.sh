#!/bin/bash
read -p "Provide a File or Path " ${FILE_OR_PATH}
#FILE_OR_PATH=$1

if [[ -d $FILE_OR_PATH ]]; then
  #statements
  echo "User Provided a Path"
  #Move to path
  cd $FILE_OR_PATH
  ls -ll
elif [[ -f $FILE_OR_PATH ]]; then
  #statements
  echo "User Provided a File"
else
  echo "User did not provide a file or path"
fi
