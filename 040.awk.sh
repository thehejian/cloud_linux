#!/bin/bash
#panduan ID<= 1000 de yonghu shuliang
awk -F: '{if($3<=1000){i++}}END{print "UID  xiaoyu huo dengyu 1000 de you " i " ge"}' /etc/passwd

awk -F: '{if($3>=1000){i++}}END{print"UID dayudengyu 1000 de you " i " ge"}' /etc/passwd

awk -F: '{if($3<=1000){i++}else{j++}}END{print i,j}' /etc/passwd

awk -F: '{if($7~/bash$/){i++}else{j++}}END{print i,j}' /etc/passwd

echo "shuzhu"

awk 'BEGIN{a[0]=1;a[1]=10;print a[0],a[1]}'

awk 'BEGIN{a["abc"]=123; a[2]=abc; print a["abc"]}'

awk 'BEGIN{a[98]=0;a[8]=11;a[6]=22;for(i in a){print i,a[i]}}'

awk 'BEGIN{a[11]=11;a[22]=22;a[33]=33;for(i in a ){print i,a[i]}}' 

awk '{a[$1]++}END{for(i in a){print i,a[i]}}' 041shuzu.txt

awk '{a[$1]++}END{for(i in a){print i,a[i]}}' 042ip_shuzu.txt

#awk '{a[$9]++}END{for(i in a){print i,a[i],NR}}' 044disco.log

awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' /var/log/nginx/access.log | sort -r

uptime | awk '{print "CPU负载是 " $8,$9,$10}'
free -h | awk '/^内存/{print "内存剩余 " $4}'
df -h | awk '/\/$/{print "根存储空间可用 " $4}'
ifconfig ens33 | awk '/RX packets/{print "网卡ens33流入量 " $5/10^6 "MB"}'
ifconfig ens33 | awk '/TX packets/{print "网卡ens33流出量 " $5/10^6 "MB"}'
echo "安装包共 $(dpkg -l | wc -l) 个"
#echo "安装包共 $(rpm -qa | wc -l) 个"
#echo "本机安装软件包数量 $(cat /etc/passwd | wc -l) 个"
awk 'END{print "本机安装软件包数量 " NR " 个"}' /etc/passwd
echo "当前登录人数 $(who | wc -l)"
echo "当前进程数 $(ps -ef | wc -l)"
#echo "当前进程数 $(ps aux | wc -l)"

