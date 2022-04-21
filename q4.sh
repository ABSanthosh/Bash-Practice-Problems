#!/bin/bash

SUM=0
for arg in "$@"
do
    SUM=$[$SUM+$arg]
done

echo "Sum of all arguments is $SUM"

# chmod u+x q1.sh
