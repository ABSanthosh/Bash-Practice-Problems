#!/bin/bash

COUNT=0
for arg in "$@"
do
    COUNT=$[$COUNT+1]
done

if [ $COUNT -eq 3 ]
then
    ARGUMENTS=($1 $2 $3)
    LARGEST=${ARGUMENTS[0]}

    for arg in "${ARGUMENTS[@]}"
    do
        if [[ $arg -gt $LARGEST ]]
        then
            LARGEST=$arg
        fi
    done

    echo "Largest number is $LARGEST"
else
    echo "Not entered 3 arguments...Try next time. Exit"
fi