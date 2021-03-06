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

set -- a b "c c"
#设置3个变量

echo $1
echo $2
echo $3
#c c
echo $#
#3
#共有3个参数

shift
#把变量值减小1
#echo $2
#a
#变成之前的$1

time du -sh /etc/
#41M	/etc/

#real	0m0.640s
#user	0m0.010s
#sys	0m0.019s
#实际时间: 从 command 命令行开始执行到运行终止的时间。
#用户态使用时间：命令执行完成花费的用户 CPU 时间，即命令在用户态中执行时间总和。
#内核态使用时间：命令执行完成花费的系统 CPU 时间，即命令在核心态中执行时间总和。












