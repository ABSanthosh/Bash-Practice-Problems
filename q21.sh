#!/bin/bash

CFILE=$1
OUTPUT=$2

gcc -o /tmp/$OUTPUT.out $CFILE

echo "Output file $OUTPUT is written to /tmp directory"
echo "Executing /tmp/$OUTPUT"
/tmp/$OUTPUT.out > /tmp/$OUTPUT.out.txt

echo `cat /tmp/$OUTPUT.out.txt`
