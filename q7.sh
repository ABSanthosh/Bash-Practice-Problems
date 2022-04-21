#!/bin/bash

N=$1
LEN=${#N}
SUM=0

for i in $(seq 1 $LEN)
do
    SUM=$[$SUM+$(($N%$((10**$i))/10**($i-1)))]
done

echo $SUM