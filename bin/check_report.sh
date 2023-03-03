#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage : $0 {U-1|U-2|U-3}"
fi

INPUT=$1
NUM=${INPUT:2}

FILE1=/root/bin/report.txt

sed -n "/U-$NUM/,/U-$(expr $NUM + 1)/p" $FILE1 | sed '$d'