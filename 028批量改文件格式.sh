#!/bin/bash

#批量替换文件格式（后缀）

read -p "请输入旧格式（后缀）像：.txt " old
read -p "请输入新格式 " new

for i in `ls *$old`
do
	x=${i%$old*}
	#截取$new格式之前的所有内容（文件的名称，不带后缀）
	mv $i $x$new
	#i为老文件名
	#$x文件名不带后缀
	#$new新文件格式
done
ls *$new

