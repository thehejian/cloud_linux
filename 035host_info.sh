#!/bin/bash

while :
do
date
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
sleep 20
clear
done
