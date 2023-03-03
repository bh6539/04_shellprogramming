#!/bin/bash

echo -n "파일 이름은? : "
read FILE1

if [ -f $FILE1 ]; then
    echo "일반파일"
elif [ -d $FILE1 ]; then
    echo "디렉토리"
else
    echo "???"
fi