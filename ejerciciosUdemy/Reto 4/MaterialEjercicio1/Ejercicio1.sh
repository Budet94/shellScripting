#!/bin/bash
read -p "Please enter a file extension: " FILE_EXTENTION
echo "File extension provided "${FILE_EXTENTION}
ALL_JPG=$(echo *.${FILE_EXTENTION})
echo "This are all .jpg in this Dir. : "$ALL_JPG
#echo "${ALL_JPG}"
for i in ${ALL_JPG}
do
  mv $i $i

done
