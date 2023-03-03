#!/bin/bash

echo -n "Enter A : "
read A

echo -n "Enter Operator : "
read OP

echo -n "Enter C : "
read B

case $OP in
    '+') echo "$A $OP $B = $(expr $A + $B)" ;;
    '-') echo "$A $OP $B = $(expr $A - $B)" ;;
    '*') echo "$A $OP $B = $(expr $A \* $B)" ;;
    '/') echo "$A $OP $B = $(expr $A / $B)" ;;
    *) echo "error!" ; exit 1;;
esac