#!/bin/bash
#   # cat hosts.txt
#   192.168.10.10   server10.example.com    server10
#   192.168.10.11   server11.example.com    server11
#   ....
#   192.168.10.30   server30.example.com    server30

HOSTS=/etc/hosts
START=10
END=30

for i in $(seq $START $END)
do
    echo "192.168.10.$i   server$i.example.com    server$i" >> $HOSTS
done