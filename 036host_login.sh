#!/bin/bash

#awk '/Failed password for root/{a[$11]++}END{for(i in a){print "入侵 " a[i]" 次","\t IP为 " i}}' /nas/阿里云盘/001-脚本/043secure.log | sort -r
#awk '/Failed password for root/{a[$11]++}END{for(i in a){print "入侵 " a[i] " 次\t","IP为 " i}}' /var/log/secure | sort -r

x=$(awk '/Failed password for root/{ip[$11]++}END{for(i in ip){print ip[i]","i}}' /var/log/secure | sort -r)

for i in $x
do
	ip=${i#*,};
	ipn=${i%,*};
	[ $ipn -gt 3 ] && echo "告警！IP $ip 密码输入错误 $ipn  次" | mail -s test root
done
