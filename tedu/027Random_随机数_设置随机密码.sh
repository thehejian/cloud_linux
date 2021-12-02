#!/bin/bash

#随机从数组a(大小写字母，数字，特殊字符)中取n个数字
#一般用于设置密码,密码长度为8位
#不要用特殊字符，会出很奇怪的问题

a=AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789
read -p "请输入密码长度，最长20位;（密码为大小写和数字） " mima

for ((i=1; i<=$mima; i++))
#for i in {1..8}
do
	x=$[RANDOM%63]
	#0~62的随机数,数组a的长度
	y=${a:x:1}
	#截取字符串，从随机数x+1（数组从0开始）开始截取数组，并截取一个
	z=$z$y
	#$y为任意字符开始的一个字符；随机的取$mama次
done
echo $z

