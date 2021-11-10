#!/bin/bash
#通过查看安全日志/var/log/secure，找到密码输入错误超过3次的IP，并进行排序；
#awk '/Failed password for root/{a[$11]++}END{for(i in a){print "入侵 " a[i]" 次","\t IP为 " i}}' /nas/阿里云盘/001-脚本/043secure.log | sort -r
#awk '/Failed password for root/{a[$11]++}END{for(i in a){print "入侵 " a[i] " 次\t","IP为 " i}}' /var/log/secure | sort -r

x=$(awk '/Failed password for root/{ip[$11]++}END{for(i in ip){print ip[i]","i}}' /var/log/secure | sort -r -n)
#sort -n 以数字格式排序，默认是以文本格式
#变量x是一个ip组（访问超过3次，从大到小排序）
#awk的语法格式 /XX/找到XX这一行；
#{YY}逐行执行/var/log/secure文件，执行命令为YY；
#sort -r 从大到小执行
#$11 行为ssh访问者的IP

for i in $x
do
	ip=${i#*,};
	#shanchu qianmian
	ipn=${i%,*};
	#shanchu houmian
	[ $ipn -gt 3 ] && echo "告警！IP $ip 密码输入错误
done
