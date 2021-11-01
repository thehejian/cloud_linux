#! /bin/bash

#显示这台机器的用户名和密码（加密处理后的）（bash结尾的）；

#从用户名文件（/etc/passwd）把用户名（第一列）找出来；
#把找出来的用户名作为变量（用户名），在for循环中找到密码（加密密码）路径（/etc/shadow）下的对应行；

user=$(awk -F[:] '/bash$/{print $1}' /etc/passwd)
#-F [:] 按照方括号中的内容间隔，支持多选；默认不写为空格
#找到bash结尾的用户名

for i in $user
#逐个找出bash结尾用户名，并作为变量；逐个查找
do
	grep ^$i /etc/shadow | awk -F[:] '{print $1" ----> "$2}'
#找到/etc/shadow中的对应的用户名
#$1是密码文件中对应的用户名；（/etc/shadow）
#$2是密码文件中对应的密码；（加密密码）（/etc/shadow）
#awk放在管道后面
done
