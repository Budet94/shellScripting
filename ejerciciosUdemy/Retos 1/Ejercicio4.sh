#!/bin/bash



PATH_FILE="a"

if [[ -d $PATH_FILE ]]; then
  #statements
  echo "The path file in the variable ${PATH_FILE} exits."
fi
#rm -r a
if [[ -w $PATH_FILE ]]; then
  #statements
  echo "File is writable by me."
else
  echo "You dont have permition to write in the file."
fi
