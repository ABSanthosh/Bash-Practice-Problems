#!/bin/bash

read -p "Enter a word: " WORD
REVERSE=""
LEN=${#WORD}
FLAG=true
for i in $(seq 0 $LEN)
do
    REVERSE="$REVERSE${WORD:$[$LEN-$i]:1}"
done

for i in $(seq 1 $LEN)
do
    R=${REVERSE:$[$LEN-$i]:1}
    W=${WORD:$[$LEN-$i]:1}
    if [[ "$W" != "$R" ]]
    then
        FLAG=false
    fi
done

if [ $FLAG = true ]
then
    echo "Palindrome"
else
    echo "Not Palindrome"
fi
