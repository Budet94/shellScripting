#!/bin/bash
LINE_NUMBER=1
while read LINE
do
  #statements
  echo "${LINE_NUMBER}: ${LINE}"
  ((LINE_NUMBER++))
done < /etc/passwd
