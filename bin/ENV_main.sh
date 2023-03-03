#!/bin/bash

#   ENV1.sh : 환경설정
#       $HOME/.bashrc
#   ENV2.sh : 필요한 패키지 설치
#       패키지 설치(gcc, php, vscode, chrome)
#   ENV3.sh : 서버 세팅
#       telnet 서버(root 사용자 접속 가능)
#       ftp 서버(root 사용자 접속 가능)
#       ssh 서버(root 사용자 접속 가능)
#		nginx Web 서버(index.html)

/root/bin/ENV1.sh
/root/bin/ENV2.sh
/root/bin/ENV3.sh

