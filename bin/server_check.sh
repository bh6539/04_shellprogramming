#!/bin/bash

DATE=$(date +'%Y.%m.%d %H:%M')
#echo -n "Enter your name : "
#read NAME
NAME="LEE BANG HEON"
OS=$(cat /etc/centos-release)
KERNEL=$(uname -sr)
CPUS=$(lscpu | grep "^CPU(s)" | awk '{print $2}')
MEM=$(free -h | grep '^Mem' | awk '{print $2}')
DISKS=$(lsblk -S | awk '$3 == "disk" {print $0}' | wc -l)

: << EOF

Server Vul. Checker version 1.0

DATE: $DATE
NAME: $NAME

(1) Server Information
============================================
OS: $OS
Kernel: $KERNEL
CPU: $CPUS
MEM: $MEM
DISK: $DISKS
EOF


CNT=$(nmcli connection | grep -vw ' -- ' | tail -n +2 | wc -l)



for i in $(seq $CNT)
do
	NIC=$(nmcli connection | grep -vw ' -- ' | tail -n +2 | awk '{print $4}' | sed -n "${i}p")
	IP=$(ifconfig $NIC | grep 'inet ' | awk '{print $2}')
	NETMASK=$(ifconfig $NIC | grep 'netmask ' | awk '{print $4}')
	DEFAULTROUTER=$(ip route | grep default | grep $NIC | awk '{print $3}')
	#ifconfig $NIC
cat << EOF
Network : $NIC
	IP : $IP
	Netmask : $NETMASK
	Defaultrouter : $DEFAULTROUTER
EOF
done
echo -n "	DNS : "
echo $(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
