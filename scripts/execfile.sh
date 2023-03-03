#!/bin/bash

echo -n "파일 이름은? : "
read FILE1

# if [ -x $FILE1 ] ; then
#     eval $FILE1
# fi

[ -x $FILE1 ] && eval $FILE1