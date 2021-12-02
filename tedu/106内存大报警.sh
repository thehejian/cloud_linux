#!/bin/bash

mymem=$(free -h | awk '/Mem/{print $4}' | awk -F "M" '{print $1}')

[ $mymem -lt 100 ] && {
echo "出问题了，内存不够了"
mail;
} || echo "内存够用"

if [ $mymem -lt 100 ]; then
echo "出问题了，内存不够了"
mail;
else
echo "内存够用";
fi
#
