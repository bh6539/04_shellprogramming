#!/bin/bash

#   1. PV
#     (1) View
#     (2) Works
#   2. VG
#     (1) View
#     (2) Works
#   3. LV
#     (1) View
#     (2) Works

TMP1=/root/bin/tmp1.tmp
TMP2=/root/bin/tmp2.tmp
TMP3=/root/bin/tmp3.tmp
TMP4=/root/bin/tmp4.tmp

while true
do

# 1. PV
echo
echo "############################# PV 생성 #############################"
# (1) ViEW
fdisk -l | grep LVM | awk '{print $1}' > $TMP1
pvs | tail -n +2 | awk '{print $1}' > $TMP2
cat << EOF
----------------- PV VIEW -----------------
$(cat $TMP1 $TMP2 | sort | uniq -u)
-------------------------------------------
EOF

# (2) Works
echo "=> 위의 목록에서 PV로 생성하고 싶은 볼륨을 선택합니다. <="
echo -n "볼륨 선택?(ex: /dev/sdb1 /dev/sdc1) : "
read VOLUME

echo -n "\"pvcreate $VOLUME\" 실행하시겠습니까?(Yes/No/Skip): "
read INPUT1

case $INPUT1 in
    'Yes') 
        pvcreate $VOLUME > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[  OK  ] Physical volume \"$VOLUME\" successfully created."
            echo ; pvs ; echo
        else
            echo "[ FAIL ] Physical volume not created."
            exit 1
        fi
        break ;;
    'No') continue ;;
    'Skip') break ;;
    *) echo "error! "; continue ;;
esac

done


while true
do

# 2. VG
echo
echo "############################# VG 생성 #############################"
# (1) VIEW
vgs | tail -n +2 | awk '{print $1}' > $TMP3
pvs > $TMP4
for i in $(cat $TMP3)
do
    sed -i "/$i/d" $TMP4
done
cat << EOF
----------------- PV LIST -----------------
$(cat $TMP4)
-------------------------------------------
EOF

# (2) Works
echo -n "VG 이름은?(ex: vg1) : "
read VGNAME

echo -n "선택가능한 PV 목록을 적어주세요?(ex: /dev/sdb1 /dev/sdc1 ...) : "
read PVLIST

echo -n "\"vgcreate $VGNAME $PVLIST\" 실행하시겠습니까?(Yes/No/Skip): "
read INPUT2

case $INPUT2 in
    'Yes') 
        vgcreate $VGNAME $PVLIST > /dev/null 2>&1
        if [ $? -eq 0 ]; then
            echo "[  OK  ] Volume group \"$VGNAME\" successfully created"
            echo ; vgs ; echo
        else
            echo "[ FAIL ] Volume group not created"
            exit 2
        fi
        break ;;
    'No') continue ;;
    'Skip') break ;;
    *) echo "error! "; continue ;;
esac

done


while true
do
# 3. LV
echo
echo "############################# LV 생성 #############################"
# (1) VIEW
cat << EOF
----------------- VG LIST -----------------
$(vgs | awk '$7 != "0" {print $0}')
-------------------------------------------
EOF

# (2) Wroks
echo -n "LV를 생성할 VG 이름은? (ex: vg1) : "
read VGLV

echo -n "생성할 LV 이름은? (ex: lv1) : "
read LVNAME

echo -n "LV 용량은? (ex: 500m) : "
read LVSIZE

echo -n "\"lvcreate $VGLV -n $LVNAME -L $LVSIZE\" 실행하시겠습니까?(Yes/No/Skip): "
read INPUT3

case $INPUT3 in
    'Yes') 
        lvcreate $VGLV -n $LVNAME -L $LVSIZE > /dev/null 2>&1
        if [ $? -eq 0 ]; then 
            echo "[  OK  ] Logical volume \"$LVNAME\" created."
            echo ; lvs ; echo
        else
            echo "[ FAIL ] Logical volume not created."
            exit 3
        fi
        break ;;
    'No') continue ;;
    'Skip') break ;;
    *) echo "error! "; continue ;;
esac

done