#!/bin/bash

#   ENV2.sh : 필요한 패키지 설치
#       패키지 설치(gcc, php, vscode, chrome)

. /root/bin/functions.sh

#   1) gcc
#   2) php
PkgInst "gcc php"

#   3) vscode
VSCodeInst
VSCodeComment

#   4) chrome
ChromeInst