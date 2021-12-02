#!/bin/bash
#这是一个按日期保存文件的脚本
#2021-11-13 何健 v1.0.0
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
echo "这是一个批量保存文件的脚本"
read -p "请输入文件名" fileusr
filename=${fileusr:-filename}
date1=$(date --date='2 days ago' +'%Y%m%d')
date2=$(date --date='1 days ago' +'%Y%m%d')
date=$(date +'%Y%m%d')

touch 113_$file$date2.txt
touch 113_$file$date1.txt
touch 113_$file$date.txt
