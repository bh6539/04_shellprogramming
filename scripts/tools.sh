#!/bin/bash

clear
cat << EOF
====================================================
  (1). who      (2). date     (3). pwd              
====================================================
EOF

echo -n "Enter Your Choice(1~3)? : "
read CHOICE

#echo $CHOICE

case $CHOICE in
    1) who ;;
    2) date ;;
    3) pwd ;;
    *) echo "Error!"
        exit 1;;
esac