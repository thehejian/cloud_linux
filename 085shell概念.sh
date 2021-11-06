#!/bin/bash

#######################################################内部变量
cd -
#返回上一个目录

echo $RANDOM
#随机数

echo $UID
#用户ID

echo $HISTORY
#历史命令

echo $HISTORYFILE
#历史文件

echo $HOSTNAME
#显示主机名

echo $LANG
#语言

echo $PATH
#路径

echo $TMOUT
#窗口超时时间

#######################################################内部命令
#which source
#查找路径
#bash的内置应用

source
#执行命令

.
#当前路径

alias
#别名

bg
#命令放到后台

fg
#命令放到前台

break
#跳出循环

continue
#跳出本次循环

declare
#声明变量

jobs
#显示当前进程

let
#计算

read
#读入变量
read -p "input var" var

help
#内置的帮助，类似bin的man

echo
echo -e "hello\tworld"
#hell world

echo -e "hell\tworld"
#hell
#world

#支持特殊
#-e 启用对下列反斜杠转义的解释
#-E 明确抑制反斜杠转义的解释

printf
#打印标准格式的字符串
printf "hello\tworld\nhihi\n"
#hello  world
#hihi
#结尾记着加\n不然会和下面没法区分

history
history -c
#删除历史记录
history -d 1
#删除第一条命令

ulimit -n
#查看文件参数
ulimit -a
#查看所有参数

export
#环境变量
#declare -x HOME="/root"


















