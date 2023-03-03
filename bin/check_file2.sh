#!/bin/bash

# 	# crontab -e
# 	Min Hour Day Mon Week CMD
#  	0   8    *   *   *   /root/bin/check_file2.sh
#
# 	# cat /root/bin/check_file_list.txt
# 	/etc/passwd
# 	/etc/group
# 	/etc/hosts
# 	.....

F_LIST=/root/bin/file_list.txt                    # 점검할 파일 목록
T_FILE=/tmp/tmp1                                  # 임시파일
F_RESULT=/root/bin/result.$(date +'%m%d')          # 결과 리포트 파일
EMAIL=root                                        # 결과를 받을 이메일 주소
BACKUPDIR=/backup

> $F_RESULT                                       # 결과파일 초기화

for F_NAME in $(cat $F_LIST)                         # 점검해야 하는 파일 목록 읽기
do
    DIRNAME=$(dirname $F_NAME)
    FILENAME=$(basename $F_NAME)
    BACKUPFILE=$BACKUPDIR/$FILENAME.orig
    if [ -f $BACKUPFILE ] ; then                   # 백업파일 존재 유무 확인
        diff $F_NAME $BACKUPFILE > $T_FILE         # 원본파일<-->백업파일 비교
        if [ -s $T_FILE ] ; then
            echo "[ WARN ] $F_NAME" >> $F_RESULT
            /bin/cp $F_NAME $BACKUPFILE.$(date +%m%d_%H%M%S)
            /bin/cp $F_NAME $BACKUPFILE
        else
            echo "[  OK  ] $F_NAME" >> $F_RESULT
        fi
    else
        cp $F_NAME $BACKUPFILE
    fi
done

grep -qw WARN $F_RESULT
if  [ $? -eq 0 ]; then
    mailx -s "[ WARN ] Check Files" $EMAIL < $F_RESULT
else
    mailx -s "[  OK  ] Check_file: Good" $EMAIL < $F_RESULT
fi

rm $T_FILE                     # tempory file delete