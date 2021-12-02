#!/bin/bash

read -p "input username " user
useradd $user
[ -z "$user" ] && echo "input name" && exit
#-z 是否存在

stty -echo
#屏幕不显示输入 
read -p "input password " pass
stty echo
#屏幕恢复显示输入

echo $pass | passwd --stdin $user

