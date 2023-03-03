#!/bin/bash

CMD() {
    sleep 1; echo 'root'
    sleep 1; echo 'centos'
    sleep 1; echo 'poweroff'
    sleep 1; echo 'exit'
}

cat /root/bin/server.txt | while read IP UNAME UPASS
do
    ping -c 1 -W 1 $IP > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo "[  OK  ] $IP is alive."
        CMD | telnet $IP
    else
        echo "[ FAIL ] $IP is shutdown"
    fi
done