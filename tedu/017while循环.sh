#!/bin/bash

read -p "输入数字 " a

if [ $a != 1 ] ; then
	echo "不是$a，而是1"
	exit
fi

while [ $a -eq 1 ]
do
	echo "呵呵,刷屏了"
	echo "对了，就是1"
	sleep 1
	#别太快，会死机；1s就差不多了
done
