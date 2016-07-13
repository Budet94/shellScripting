#!/bin/bash
ls
CAT_STATUS=$?

if [[ "$CAT_STATUS" -eq "0" ]]; then
  #statements
  echo "Command is a go!"
  exit 0
elif [[ $CAT_STATUS -gt "0" ]]; then
  #statements
  echo "Command Failed"

  exit 1
else
  echo "Potato"
fi
