#!/bin/bash

read -p "input IP " wangye
if [ -z $wangye ] ; then
	echo "shuru ip"
	exit
fi

ping $wangye -c 3 -i 0.2 -W 1 &> /dev/null

if [ $? == 0 ] ;then
	echo "$wangye ping chenggongle"
else
	echo "$wangye ping shibaile"
fi

