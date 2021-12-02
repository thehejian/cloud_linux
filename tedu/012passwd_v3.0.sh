#!/bin/bash

read -p "input username " user
#输入用户名，并将用户名保存为变量

if [ -z $user ] ; then
	echo "input username "
	exit
fi
#-z 是否存在

useradd $user 

stty -echo
#关闭屏幕显示
read -p "input passwd" passWd
stty echo

echo $passWd | passwd --stdin $user
