#!/bin/bash

read -p "Enter the number of elements: " N

for (( i=0; i<$N; i++ ))
do
    read -p "Enter the element: " arr[$i]
done

for (( i=0; i<$N; i++ ))
do
    for (( j=0; j<$N-1; j++ ))
    do
        if [ ${arr[$j]} -gt ${arr[$j+1]} ]
        then
            temp=${arr[$j]}
            arr[$j]=${arr[$j+1]}
            arr[$j+1]=$temp
        fi
    done
done

echo "Sorted array is: ${arr[@]}"