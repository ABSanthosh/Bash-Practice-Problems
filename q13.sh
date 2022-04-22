#!/bin/bash

read -p "Enter file name: " FILE

if  test -f "$FILE";
then
    echo $R
    if [ -x $FILE ];
    then
        touch temp
        cp $FILE temp
        echo "Copied file content to temp"
    else
        echo "Execute = No"
    fi
else
    echo "File does not exist"
fi

