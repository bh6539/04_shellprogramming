#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Useage : $0 <pattern> <filename>"
    exit 1
fi

PATTERN=$1
FILE1=$2

grep -q $PATTERN $FILE1
if [ $? -eq 0 ]; then
    echo "[  OK  ] 찾았다 "
else
    echo "[ FAIL ] 못찾았다 "
fi