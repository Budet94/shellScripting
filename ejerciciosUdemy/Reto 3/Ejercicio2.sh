#!/bin/bash
function fileCount(){
  FILES=$(ls)
  echo $1
  cd $1
  wc $FILES
}
fileCount a.txt
