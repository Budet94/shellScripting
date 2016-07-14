#!/bin/bash
echo "Extention to be changed?"
read -p "Please enter a file extension: " FILE_EXTENTION
echo "File extension provided " ${FILE_EXTENTION}
FILE=$(echo *.${FILE_EXTENTION})
echo "This are all .jpg in this Dir. : " $FILE
read -p "Please enter the extention to be changed: " CHANGED_EXTENTION
echo "Changing files with current file extention ${FILE_EXTENTION} to the extention ${CHANGED_EXTENTION}"

for i in ${FILE}
do
	#GRAB BASE NAME
	BASE_NAME=$(basename -s ${FILE_EXTENTION} $i)
	echo "Changing ${i} to ${BASE_NAME}${CHANGED_EXTENTION}"
	mv $i ${BASE_NAME}${CHANGED_EXTENTION}

done
