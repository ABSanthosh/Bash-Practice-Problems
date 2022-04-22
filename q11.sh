#!/bin/bash

# Write a script using case structure to generate the sum of series given below up to the nth term. Take input from the user for nth term and choose a, b or c. 

# -2 + 5 + 24 + 61 + ……
# 1 + 4 + 7 + 10 +……….
# 3 + 6 + 11 + 27 + ………..

read -p "Enter nth term: " n
echo "a) -2 + 5 + 24 + 61 + ... 
b) 1 + 4 + 7 + 10 +....
c) 3 + 6 + 11 + 27 + ...."
read -p "Enter choice: " choice

case $choice in
    a)
        for (( i=0; i<$n; i++ ))
        do
            if [ $i -eq 0 ]
            then
                sum=0
            else
                sum=$((sum + (2*i + 1)))
            fi
        done
        echo "Sum of series is: " $sum
        ;;
    b)
        for (( i=0; i<$n; i++ ))
        do
            if [ $i -eq 0 ]
            then
                sum=0
            else
                sum=$((sum + (i + 1)))
            fi
        done
        echo "Sum of series is: " $sum
        ;;
    c)
        for (( i=0; i<$n; i++ ))
        do
            if [ $i -eq 0 ]
            then
                sum=0
            else
                sum=$((sum + (3*i + 1)))
            fi
        done
        echo "Sum of series is: " $sum
        ;;
    *)
        echo "Invalid choice"
        ;;
esac