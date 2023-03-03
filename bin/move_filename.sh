#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage : $0 <Directory> <SRC Ext> <DST Ext>"
    exit1
fi

D_WORK=$1              	# working directory
T_FILE1=/tmp/.tmp1  	# tempory file1

SRC_EXT=".${2}$"
DST_EXT=".${3}"

ls -1 $D_WORK | grep $SRC_EXT > $T_FILE1
for FILE in $(cat $T_FILE1)
do
    mv $D_WORK/$FILE $(echo $D_WORK/$FILE | sed "s/$SRC_EXT/$DST_EXT/g")
done