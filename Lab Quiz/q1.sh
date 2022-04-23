#!/bin/bash

SUM=0
INTEGERS="$@"
for i in "$@"
do
    SUM=$(( $SUM+$i ))
done

echo "SUM: $SUM"