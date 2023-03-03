#!/bin/bash

for i in $(cat /etc/vsftpd/ftpusers | egrep -v '^#')
do
    echo $i
    read
done