#!/bin/bash

x=$[ RANDOM % 101 ]

while :
do
	read -p "qingshuru (0-100)" num
	if [ -z $num ] ;then
		echo "shabi shi kongzhi"
		exit
	fi
	if [ $num -eq $x ] ;then
		echo "nibi caiduile jiushi $num"
		exit
	elif [ $num -lt $x ] ;then
		echo " cai xiaole"
	else
		echo "caidale"
	fi
done
