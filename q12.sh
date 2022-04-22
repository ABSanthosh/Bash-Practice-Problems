#!/bin/bash

read -p "Enter file name: " FILE

if  test -f "$FILE";
then
    echo "File exists"
    # type of file
    if [[ -d "$FILE" ]]
    then
        echo "File is a directory"
    elif [[ -f "$FILE" ]]
    then
        echo "File is a regular file"
    elif [[ -h "$FILE" ]]
    then
        echo "File is a symbolic link"
    elif [[ -s "$FILE" ]]
    then
        echo "File is not empty"
    else
        echo "File is empty"
    fi
else
    echo "File does not exist"
fi

