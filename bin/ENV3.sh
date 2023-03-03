#!/bin/bash

#   ENV3.sh : 서버 세팅
#       telnet 서버(root 사용자 접속 가능)
#       ftp 서버(root 사용자 접속 가능)
#       ssh 서버(root 사용자 접속 가능)
#		nginx Web 서버(index.html)

. /root/bin/functions.sh

#   1) telnet server
echo "########## TELNET Server ##########"
PkgInst "telnet telnet-server"
SvcEnable "telnet.socket"

#   2) ftp server
echo "##########  FTP Server   ##########"
PkgInst "vsftpd ftp"
VsFtpConf
SvcEnable "vsftpd.service"

#   3) ssh server
echo "##########  SSH Server   ##########"
PkgInst "openssh-server openssh-clients openssh"
SshConf
SvcEnable "sshd.service"

#   4) nginx server
echo "##########   WEB Server  ##########"
CheckWebSvc "nginx"
PkgInst "nginx"
NginxConf
SvcEnable "nginx.service"
