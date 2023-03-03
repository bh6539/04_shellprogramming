#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage : $0 <filename>"
    exit 1
fi

FILE1=$1
FILESIZE=$(wc -c < "$FILE1")

echo "$FILESIZE bytes"

if [ $FILESIZE -ge 5120 ]; then
    echo "큰 파일"
else
    echo "작은 파일"
fi