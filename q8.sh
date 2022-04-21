#!/bin/bash
num=$1

while [[ $num -gt 0 ]]
do
        let temp=$num%2
        if [[ $temp -eq 1 ]]
        then
                let count=$count+1
        fi
        let num=$num/2
done

echo "Number of set bits are: $count"