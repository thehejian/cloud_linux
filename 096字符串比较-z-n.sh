#!/bin/bash
[ -f "$file" ] && echo "有呢" || echo "没有"
#字符串比较，变量一定要加引号

#前后的空格不能忘
#建议变量加双引号，防止意外发生
#建议用双方括号，就不用转义了
#看看系统脚本怎么写比如more /etc/init.d/network
#变量是字符串双引号"$file1"，路径不加双引号/etc/services——————《**********************
#系统用的单方括号——————《**********************

-nt newer than 新
-ot old than 旧
-ef 前面是后面的硬链接则为真

[ -x /usr/sbin/rpc.mountd ] || exit 5
#如果不可执行则退出
#条件1 || 操作1 ；如果条件一不成立则执行操作1
[[ -x ./04.sh ]] || exit 5
./04.sh
#如果04可以执行则执行04.sh；如果04不能执行则直接退出不报错
[[ -x ./04.sh ]] && ./04.sh || exit 5
#跟上面一致

if [ -f "$file" ]; then
echo "有呢";
else
echo "没有";
fi
#等同上面

if [ -f "$file" ]; then echo "有呢"; else echo "没有"; fi
#等同上面

#########################################################——》案例一，单条件测试
file1=/etc/services
file2=/etc/rc.local
[[ -f "$file1" ]] && echo "$file1是文件" || echo "$file1不是文件"
#文件存在
#if [[ -f "$file1" ]]; then echo "$file1是文件"; else echo "$file1不是文件"; fi

[[ -f $file1 ]] && echo "$file1是文件" || echo "$file1不是文件"
#不加引号也OK
[ -f $file1 ] && echo "$file1是文件" || echo "$file1不是文件"
#一个方括号也OK
#[[ -f /etc/services ]] && echo "1" || echo "0"
#这样写是OK的
#[[ -f "/etc/services" ]] && echo "1" || echo "0"
#这样也OK

[[ -d "$file1" ]] && echo "$file1 是文件夹" || echo "$file1 不是文件夹"
#if [  ]; then echo "$file1 是文件夹"; else echo "$file1 不是文件夹"; fi

[[ -s "$file1" ]] && echo "$file1 存在且大小不为0" || echo "$file1不存在或者大小为0"
#if [ -s "$file1" ]; then echo "$file1 存在且大小不为0"; else echo "$file1不存在或者大小为0"; fi

[[ -e "$file1" ]] && echo "$file1 存在" || echo "$file1 不存在"
#if [[ -e "$file1" ]]; then echo "$file1 存在"; else echo "$file1 不存在"; fi

#########################################################——》案例一，多条件测试
#变量是双引号"$file1"，路径不加双引号/etc/services——————《**********************
#系统用的单方括号——————《**********************
#单引号不支持&& || ;单引号用-a -o 代替
#双中括号不能用-a -o

[[ -f "$file1" && -f "$file2" ]] && echo 1 || echo 0
#[ -f "$file1" && -f "$file2" ] && echo 1 || echo 0
#[[ -f "$file1" -a -f "$file2" ]] && echo 1 || echo 0
#两种错误；单引号不支持&&

[ -f "$file1" ] && [ -f "$file2" ] && echo 1 || echo 0
#分开也可以

[ -f "$file1" -a -f "$file2" ] && echo 1 || echo 0
#单引号用-a -o 代替

if [ -f "$file1" -a -f "$file2" ]; then echo 1; else echo 0; fi


##################################——》案例 -z -n
a=abc123
b=ab
[ -n "$a" ] && echo 1 || echo 0
#-n 字符串存在，字符串长度not zero
[ -z "$a" ] && echo 1 || echo 0
# -z字符串不存在，字符串长度为zero

[ -n "$a" -a -n "$aaa" ] && echo 1 || echo 0
#0
[ -n "$a" -o -n "$aaa" ] && echo 1 || echo 0
#1
if [ -n "$a" -a -n "$aaa" ]; then  echo 1; else echo 0; fi
#注意中英文的分号

[ "$a" == "$b" ] && echo 1 || echo 0
if [ "$a" != "$b" ]; then echo 1; else echo 0; fi

#[ "$a" -lt "$b" ] && echo 1 || echo 0
#错误，字符串排序，要加双中括号
[[ "$a" < "$b" ]] && echo 1 || echo 0
#sorts 排序在前？

