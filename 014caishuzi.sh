#!/bin/bash

num1=$[ RANDOM%11 ]
read -p "shuru shuzi 0 dao 10 " num

if [ -z $num ] ; then
	echo "qing chongxin zhixing 0 - 10"
	exit
fi


if [ $num == $num1 ] ; then
	echo  "wocao zhenniubi"	
elif [ $num > $num1 ] ; then
	echo "dale"
else
	echo "xiaole"
fi

