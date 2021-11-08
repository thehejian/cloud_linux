#!/bin/bash
[ -f "$file" ] && echo "有呢" || echo "没有"
#前后的空格不能忘
#建议变量加双引号，防止意外发生
#建议用双方括号，就不用转义了
#看看系统脚本怎么写比如more /etc/init.d/network
#变量是双引号"$file1"，路径不加双引号/etc/services——————《**********************
#系统用的单方括号——————《**********************

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
