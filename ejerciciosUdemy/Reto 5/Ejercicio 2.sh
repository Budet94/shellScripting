#!/bin/bash
read -p "How many lines would you like to print?: " LINE_NUMBER
COUNTER=0
while  read LINE
do
  if [[ $COUNTER -eq $LINE_NUMBER ]]; then
    exit 1
  else
    echo "${COUNTER}: ${LINE}"
    ((COUNTER++))
  fi

done < /etc/passwd
