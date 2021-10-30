#!/bin/bash

x=$[ RANDOM % 101 ]
#产生100以下的随机数
while :
do
	read -p "请输入0~100的数字 " num
	if [ -z $num ] ;then
		echo "你的输入为空，拜拜"
		exit
	fi
	if [ $num -eq $x ] ;then
		echo "牛逼，猜对了；就是 $num"
		exit
	elif [ $num -lt $x ] ;then
		echo "猜小了"
	else
		echo "猜大了"
	fi
done
