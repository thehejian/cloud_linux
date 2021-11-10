#!/bin/bash
awk '/Failed password for root/{print $11}' /var/log/secure | awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' | awk '$1>3{print "入侵" $1 "次\t","ip 为" $2}' | sort -r -n
#sort  -n以数字方式排序，默认为文本
#找到IP行
#awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}'
  #逐条执行ip，并自增计数；——》ip[i]是数组的序号，不是值——》进行自增统计；
  #i是上一个$11 ip
#awk '$1>3{print "入侵" $1 "次\t","ip 为" $2}——》$1是上一个数组的序号，$2是上一个IP
#sort -r 排倒叙
