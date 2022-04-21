#!/bin/bash

FACTORIAL=1;

for arg in $(seq 1 $1)
do
    FACTORIAL=$[$FACTORIAL*$arg]
done

echo "Factorial of $1 is $FACTORIAL"

# chmod u+x q1.sh
