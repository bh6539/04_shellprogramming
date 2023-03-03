#!/bin/bash
#   # cat hosts.txt
#   192.168.10.10   server10.example.com    server10
#   192.168.10.11   server11.example.com    server11
#   ....
#   192.168.10.30   server30.example.com    server30

HOSTS=/root/bin/hosts
START=10
END=30

C_IP=$(ip addr show ens33 | grep -w inet | awk '{print $2}' | awk -F. '{print $4}' | awk -F/ '{print $1}')

for i in $(seq $START $END)
do
    [ $C_IP -eq $i ] && continue
    echo "192.168.10.$i   server$i.example.com    server$i" >> $HOSTS
done