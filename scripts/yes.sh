#!/bin/bash

echo -n "Choice! (yes/no): "
read CHOICE

case $CHOICE in
    yes|Y|YES|y|Yes) echo "[ YES ] YES!~! " ;;
    no|NO|n|N) echo "[ N O ] Noooooo" ;;
    *) echo "error! "
        exit 1 ;;
esac