#!/bin/bash

read -p "Favor de entrar un file or path: " INPUT;
echo $INPUT
if [[ -f "${INPUT}" ]]; then
  #statements
  echo "That is a regular file."
  exit 0
elif [[ -d "${INPUT}" ]]; then
  #statements
  echo "That is a directory."
  exit 1
else
  echo "No estoy seguro que eso lo entrado en el terminal"
  exit 2 
fi
