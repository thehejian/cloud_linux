#!/bin/bash
#这是一个按日期保存文件的脚本
#2021-11-13 何健 v1.0.0
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
read -p "第一个数字" a
read -p "第二个数字" b
total=$((a*b))
echo "${a}X${b}=$total"
