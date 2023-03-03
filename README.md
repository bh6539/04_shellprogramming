배시 쉘 프로그래밍

선수지식
명령어
grep CMD
# grep OPTIONS PATTERNS file1
* OPTIONS: -i(대소문자 구분), -v(제외), -l, -n(라인번호), -r(recursive 하위 모든파일), -w(단어 매칭)
* PATTERNS: * . ^root root$ [abc] [a-c] [^a]

sed CMD
	# sed [-n] ‘addressCMD’ file1
	* address: addr1,add2
	* CMD: p(print), d(delete), s
		# sed -n ‘1,3p’ /etc/hosts	(1~3줄 출력)
		# sed ‘1,3d’ /etc/hosts		(1~3줄 빼고 출력)
		# sed -i s/root/ROOT/’ /etc/hosts(root를 ROOT로 바꾸기)

awk CMD
		# awk ‘statement’ file1
		# awk {Action} file1
		# awk ‘statement {Action}’ file1
			{Action}에서 $# => $0전체, $1첫번째필드, $2두번째필드
		# awk ‘/file/’ testfile		(# grep ‘file’ testfile)
	# awk '/file/ {print $9, $3}' testfile
	# awk -F: ‘$3>=1000 && $3<=60000 print $6} /etc/passwd
	# ps -elf | awk ‘$2==“Z” {print $0}’

sort CMD
# sort -u file1 (-u:unique 중복제거)
# sort file1 | uniq -d (중복되는것만 표시)
cut CMD # cut -c1-5 /etc/hosts (char단위로 1~5번째 글자 출력)

쉘의 특성
Redirection (<, 0<, >, 1>, >>, 1>>, 2>, 2>> 2>&1)
Pipe (|)
Variable
Metacharacter (‘’, “”, ``, ;)
History
Alias
Function
(선언) : fun(){ CMD; CMD; }
(실행) : fun
(확인) : typeset -f
(해제) : unset -f fun
Environment File(s)
		/ect/profile, ~/.bash_profile, ~/.bashrc
cat CMD <<
Grouping
&&, ||
		A && B
		A && B || C
		A || C
dirname $DIR1, # basename 
dirname/basename CMD
eval CMD

Shell Script/Shell Programming
프로그램 작성과 실행
# bash -x script.sh
# . ~/.bashrc
# vi script.sh ; chmod +x script.sh ; ./script.sh
# vi script.sh(매직넘버) ; chmod +x script.sh ; ./script.sh
[참고] 매직넘버(#!/bin/bash)
주석처리
한줄주석	- 	#
여러줄주석	- 	: << EOF ~ EOF


입력 & 출력
	출력 : echo CMD, printf CMD
	입력 : read CMD

산술 연산
		expr 1 + 2
		expr 3 - 1
		expr 3 \* 3
		expr 10 / 2
		expr 10 % 3

조건문: if 문, case 문
if 문
if 조건1; then
	statement1
elif 조건2; then
	statement2
else
		statement3
fi
case 문
		case VAR in
			조건1) statement1 ;;
			조건2) statement2 ;;
			*) statement3 ; exit 1 ;;
		esac
반복문: for 문, while 문
for 문: for 문 + seq CMD
			for var in var_list
			do
				statement
			done
while 문: while 문 + continue, break
while 조건
do
	statement
done
함수
선언) 
fun() { CMD; CMD; }
function fun { CMD; CMD; }
실행) fun
확인) typeset -f
해제) unset -f fun

함수 입력: 인자($1, $2, $3, ... )
함수 출력: echo $RET

I/O 리다이렉션과 자식 프로세스
for LINE in $(cat file1)
do
	echo $LINE
done

cat file1 | while read LINE
do
	echo $LINE
done

시그널 제어(Signal Trap)
시그널 무시
시그널 받으면 개발자가 원하는 동작

디버깅
bash -x script.sh
bash -xv script.sh


옵션 처리
getopts CMD + while CMD + case CMD
		예) # ssh.sh -p 80 192.168.10.20
		while getoptions p: options
		do
			case $potions in
				p ) P_Action ;;
				/?) Usage ;;
				*) Usage ;;
			esac
		done

		shift $(expr $OPTIND - 1)
		if [ $# -ne 1 ]; then
			Usage
		fi
asd

