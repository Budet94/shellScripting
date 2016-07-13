#!/bin/bash

ARRAY=("man" "bear" "pig" "dog" "cat" "sheep")

for i in ${ARRAY[@]}
do
  echo "The $i will eat you."
done
