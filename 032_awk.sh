#! /bin/bash

user=$(awk -F[:] '/bash$/{print $1}' /etc/passwd)
#-F [:] 按照方括号中的内容间隔，支持多选；默认不写为空格

for i in $user
do
	grep ^$i /etc/shadow | awk -F[:] '{print $1" ----> "$2}'
done
