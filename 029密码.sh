#!/bin/bash

read -p "请输入用户名 " name
useradd $name

stty -echo
#关闭屏幕显示
read -p "请输入密码 " passwd
stty echo
#打开屏幕显示
echo $passwd | passwd --stdin $name

