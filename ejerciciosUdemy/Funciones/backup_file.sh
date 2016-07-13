#!/bin/bash

function backup_file(){
  if [[ -f $1 ]]; then
    #statements
    BACK="/tmp/$ (basename ${1}).$ (date +%F).$$"
    echo "Backing up $1 to ${BACK}"
    cp $1 $BACK
  fi
}
backup_file /etc/host

if [[ $? -eq 0 ]]; then
  #statements
  echo "Backup Succeded!"
  return 1
fi
