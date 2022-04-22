#!/bin/bash

read -p "Enter the directory: " dir
count=0

for file in $(find $dir -type f)
do
    if test -f $file 
    then
        count=$((count + 1))
    fi
done


echo "Total number of files: " $count