#!/bin/bash
function fileCount(){
  FILES=$(ls)

  wc $FILES
  


}
fileCount
