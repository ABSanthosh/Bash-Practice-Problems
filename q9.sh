#!/bin/bash

N=$1
LEN=${#N}
REVERSE=0

for i in $(seq 1 $LEN)
do
    REVERSE=$[$REVERSE+$[$N%$[10**$i]/10**($i-1) * $[10**($LEN-$i)]]]
done

echo $REVERSE