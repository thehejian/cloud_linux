#!/bin/bash

read -p "shuru zhi " a

if [ $a != 1 ] ; then
	echo "cuole shuru 1"
	exit
fi

while [ $a -eq 1 ]
do
	echo "hehe"
	echo "ni cai shi zhu"
	#sleep 1
done
