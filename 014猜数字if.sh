#!/bin/bash

num1=$[ RANDOM%11 ]
read -p "请输入0~10之间的数字 " num

if [ -z $num ] ; then
	echo "请重新输入0~10之间的数字"
	exit
fi


if [ $num == $num1 ] ; then
	echo  "我草，真牛逼"	
elif [ $num > $num1 ] ; then
	echo "大了"
else
	echo "小了"
fi

