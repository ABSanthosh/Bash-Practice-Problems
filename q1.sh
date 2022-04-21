#!/bin/bash
// Write a program to list all the passed arguments to a script.

COUNT=1
for arg in "$@"
do
    echo "Argument $COUNT: $arg"
    COUNT=$[$COUNT+1]
done


# chmod u+x q1.sh
