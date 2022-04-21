#!/bin/bash

N=$1

for i in $(seq 2 $N)
do
    C=0
    for j in $(seq 1 $i)
    do
        if [ $((i%j)) -eq 0 ]
        then
            C=$[$C+1]
        fi
    done
    if [ $C -eq 2 ]
    then
        echo $i
    fi
done
