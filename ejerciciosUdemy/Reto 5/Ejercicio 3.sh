#!/bin/bash
echo "Please select an action from the menu:"
echo "1. Show disk usage."
echo "2. Show system uptime."
echo "3. Show the users logged into the system."
echo "To quit the program enter q or quit"

read -p "Enter menu option to execute." OPTION

case $OPTION in
   1)
   df;;
  2)
    uptime;;
  3)
  who;;
  "q" | "quit" )
  exit 0;;
     *)
  echo "What did you enter?"
  exit 1;;
esac
