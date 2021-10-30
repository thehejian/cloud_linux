#!/bin/bash

read -p "input IP " wangye
#输入IP，并设置IP为变量
if [ -z $wangye ] ; then
	echo "input IP "
	exit
fi

ping $wangye -c 3 -i 0.2 -W 1 &> /dev/null
#-c 3 	ping3次
#-i 0.2	nterval 间隔
#-W  1	超时时间

if [ $? == 0 ] ;then
	echo "$wangye ping chenggongle"
else
	echo "$wangye ping shibaile"
fi

