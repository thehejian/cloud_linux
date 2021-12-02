#!/bin/bash
#判断 UID小于等于1000的用户数量

awk -F: '{if($3<=1000){i++}}END{print "UID小于等于1000的有 " i " 个"}' /etc/passwd
#{if($3<=1000){i++}} 批量执行；i自增；用来计数

awk -F: '{if($3>=1000){i++}}END{print"UID大于等于1000的有 " i " 个"}' /etc/passwd

awk -F: '{if($3<=1000){i++}else{j++}}END{print i,j}' /etc/passwd
#awk嵌套if函数

awk -F: '{if($7~/bash$/){i++}else{j++}}END{print "bash结尾的有 "i,"不是bash结尾的有 "j}' /etc/passwd
#$7~/bash$/ 第七列包含bash结尾的内容
#i++ 自加

#数组
awk 'BEGIN{a[0]=1;a[1]=10;print a[0],a[1]}'

awk 'BEGIN{a["abc"]=123; a[2]=abc; print a["abc"]}'
#结果123

awk 'BEGIN{a[98]=0;a[8]=11;a[6]=22;for(i in a){print i,a[i]}}'
#函数在BEGION中执行
#for(i in a)从小到大排数组的序号
#6 22
#8 11
#98 0

awk 'BEGIN{a[11]=44;a[22]=55;a[33]=66;for(i in a ){print i,a[i]}}'
#11 44
#22 55
#33 66

awk '{a[$1]++}END{for(i in a){print "第一列的"i,"出现"a[i]"次"}}' 041shuzu.txt
#设置数组a；a[$1],第一列值作为数组的序号；
#数组自增，实际是数组序号自增；计数第一列的值；
#for(i in a)从1到数组a的序号
#第一列的444 出现1次
#第一列的111 出现2次
#第一列的333 出现1次
#第一列的222 出现1次

awk '{a[$1]++}END{for(i in a){print "第一列的"i,"出现"a[i]"次"}}' 042ip_shuzu.txt
#第一列的1.116.26.230 出现6次
#第一列的1.116.26.23 出现1次

awk '{a[$9]++}END{for(i in a){print "IP为"i,"拒绝访问"a[i]"次","所有IP合计被访问"NR"次"}}' 044disco.log
#for(i in a) a就是数组的序号，就是IP
#$9 ip
#NR 多少行

awk '{ip[$1]++}END{for(i in ip){print "访问了"ip[i]"次","IP为"i}}' /usr/local/nginx/logs/access.log | sort -r
#ngix访问数的ip排序
#按照访问次数排名



