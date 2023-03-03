#!/bin/bash

NUM=10

while [ $NUM -le 100 ]
do
	echo -ne "$NUM% |"
    i=$(expr $NUM / 10)
    for j in $(seq $i)
    do
        echo -ne "="
    done
    NUM=$(expr $NUM + 10)
    if [ $NUM -le 100 ]; then
        echo -ne ">"
    else
        echo -ne "| complete"
    fi
    sleep 1
    echo
done
echo