#!/bin/bash

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