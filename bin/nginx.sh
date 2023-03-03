#!/bin/bash
#   httpd 웹서버 설정
#   (ㄱ) 패키지 설치(yum -y install nginx)
#   (ㄴ) 서버 설정(/usr/share/nginx/html/index.html)
#   (ㄷ) 서비스 기동(systemctl enable --now nginx.sevice)
#   (ㄹ) 방화벽 등록
#   (ㅁ) SELinux

yum -y install nginx \
    && echo "<h1>Nginx Web Server</h1>" > /usr/share/nginx/html/index.html \
    && service nginx restart \
    && echo "[ OK ] Nginx Web Server started"