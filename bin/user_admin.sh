#!/bin/bash

PASSWD=/etc/passwd

Menu() {
cat << EOF

(관리 목록)
------------------------------------
1) 사용자 추가
2) 사용자 확인
3) 사용자 삭제
4) 종료
------------------------------------
EOF
}

UserAdd() {
    echo
    echo "(사용자 추가)"
    echo -n "추가할 사용자 이름? : "
    read UNAME
    
    if [ ! $(awk -F: '{print $1}' $PASSWD | grep -w $UNAME) ]; then
        useradd $UNAME > /dev/null 2>&1
        echo $UNAME | useradd --stdin $UNAME > /dev/null 2>&1
        echo "------------------------------------"
        echo "정상적으로 추가 되었습니다."
        echo "------------------------------------"
    else
        
        echo "------------------------------------"
        echo "사용자가 이미 존재합니다."
        echo "------------------------------------"
    fi
}

UserVerify() {
cat << EOF

(사용자 확인)
------------------------------------
$(awk -F: '$3 >= 1000 && $3 <= 60000 {print $1}' $PASSWD | nl)
------------------------------------
EOF
}

UserDel() {
    echo
    echo "(사용자 삭제)"
    echo -n "삭제할 사용자 이름? : "
    read UNAME

    if [ $(awk -F: '{print $1}' $PASSWD | grep -w $UNAME) ]; then
        userdel -r $UNAME
        echo "------------------------------------"
        echo "정상적으로 삭제 되었습니다."
        echo "------------------------------------"
    else
        echo "------------------------------------"
        echo "사용자가 없습니다."
        echo "------------------------------------"
    fi
}

while true
do
    Menu
    echo -n "선택 번호?(1|2|3|4) : "
    read INPUT

    case $INPUT in
        1) UserAdd ;;
        2) UserVerify ;;
        3) UserDel ;;
        4) break ;;
        *) echo "[WARN] 잘못된 선택." ;;
    esac
done