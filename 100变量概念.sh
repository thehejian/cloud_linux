#!/bin/bash
################——》变量概览

#变量类型默认为字符串，所以默认不指定变量类型 1+2 是字符串不是计算式
#bash环境的数值运算，默认是整数；比如 1/3结果是0

#变量的等号两边不能有空格
#名称开头只能是英文，内容只能是英文和数字
#双引号的特殊字符$会保有原来的特性
#可扩展变量的内容添加$PATH=${PATH}:/home/bin或$PATH=$PATH:/home/bin或$PATH="${PATH}":/home/bin或$PATH="$PATH":/home/bin

#单引号的特殊字符仅为一般字符
    #可用\对特殊字符回车 $ \ 空格 ' 进行转义
    #$() `` 可以输出命令的结果，而不是命令的字符
    #子进程指的是新开的shell执行操作；
    #一般大写的为系统默认变量$PATH，自己定义的小写即可$abc
    #取消变量使用 unset abc

#$本身是变量，本shell的PID echo "${$}" 或 echo $$
#?上次执行命令的返回值，成功是0；不成功是其他值 $? ${?} "$?" "${?}" 
#变量如果要在其他子程序中执行，需要 export PATH，将自定义变量变成环境变量
#locale -a 主机支持的语系 cat /etc/locale.conf

################——》环境变量和自定义变量
#环境变量=全局变量
#自定义变量=局部变量

################——》变量的读取、数组和声明
read -p "input variable" -t 30
#-p 提示内容
#-t 超时时间

declare -i sum=100+200+300
echo ${sum}
#450
#-i 变量定义为整数 integer
#-a 变量定义为数组 array
#-x 变量变为环境变量（全局变量） export类似 +x变回自定义变量
#-r 变量设置为只读，不能修改，也不能unset

echo "lang is $PATH"
#lang is /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

echo 'lang is $PATH'
#lang is $PATH

################——》环境变量
#env
#查看环境变量

#set
#查看所有变量，环境变量和自定义变量

################——》文件系统、呈现的限制关系
ulimit -a
#-a 列出来所有当前限制
#-c 创建的核心文件的最大大小
#-H hard limit 严格设置，必定不能超过
#-S soft limit 警告设置，可以超过，报告警
#-f shell 及其子进程写入的文件的最大大小

#################——》变量的删除、取代和替换
mypath=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/root/bin

echo ${mypath#*/local/sbin:}
#删除前面是#，删除后面是%；最长匹配是##；最短匹配是#；
#代表从开始到/local/sbin:的内容都删除
echo ${mypath#/*local/sbin:}
#实现同样功能，代表从开始的/到local/sbin:；最短匹配到的内容都删除掉

#################——》变量的删除 #删前面 %删后面
echo ${mypath#/*:}
#/usr/local/bin:/usr/sbin:/usr/bin:/root/bin
#/*：最短的匹配# 被删除 /usr/local/sbin:

echo ${mypath#/*:}
#/root/bin
#/*：最长的匹配## 被删除 /usr/local/bin:/usr/sbin:/usr/bin:

echo ${mypath%:*/bin}
#path=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
#删除最后一个/root/bin

echo ${mypath%%:*/bin}
#/usr/local/sbin
#只保留第一个

#########################——》变量的替换
myname=hejian@hejian@hejian
echo "${myname/hejian/zhu}"
#zhu@hejian@hejian

echo "${myname//hejian/zhu}"
#zhu@zhu@zhu

unset myname
#########################——》变量的测试和内容替换
echo "${myname-hejian}"
#hejian
#如果没有，临时赋值，为$myname赋值，结束后变量值依然为空
myname=hehehe
echo "${myname-hejian}"
#hehehe
#因为有值，不赋值。所以临时赋值不起作用
#原来是空字符串则不替换——————————《

unset myname
echo "${myname:-hejian}"
#hejian
#空字符串和空格也会被当做没有，替换掉————《




PS1='[\u@\h \W]\$ '
#命令提示字符
#\d 星期 月 日 Mon Feb 2
#\H 完整的主机名
#\h 主机名的第一个小数点之前
#\t 显示时间，24小时 15:05:56
#\T 显示时间，12小时 03:05:56
#\A 显示时间为24小时格式：HH：MM
#\@ 显示 am/pm
#\u 当前用户的账号名称
#\v BASH的版本信息 4.2.46
#\w 完整的工作目录名称 \etc 或 ~
\W 利用basename取得工作目录名称，只显示最后一个目录名
\# 下达的第几个命令
\$ 提示字符，如果是root用户，提示符为 # ，普通用户则为 $

#可以改颜色
PS1="\[\e[37;40m\][\[\e[32;40m\]\u\[\e[37;40m\]@\h \[\e[36;40m\]\w\[\e[0m\]]\\$ "
F    B
30  40 黑色
31  41 红色
32  42 绿色
33  43 黄色
34  44 蓝色
35  45 紫红色
36  46 青蓝色
37  47 白色

#永久生效
vim .bashrc
PS1="
\e[37;40m
[
\e[32;40m
\u
\e[37;40m
@\h
\e[36;40m
\w
\e[0m
]\\$ " 
source .bashrc


