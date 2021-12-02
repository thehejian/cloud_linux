#!/bin/bash
#查看本机的：当前时间、CPU负载、内存容量、存储空间、网卡流入量、网卡流出量、安装软件包数量、用户数、当前登录人数、当前进程数
#每20s执行一次

wangka=eth0
#设置网卡名称为变量

while :
do
echo "当前时间  $(date +'%Y-%m-%d %H:%M:%S') "

uptime | awk -F[,] '{print "CPU负载是 " $4,$5,$6}'
# 平均负载量：最近1分钟、5分钟、15分钟系统

free -h | awk '/^内存/{print "内存剩余 " $4}'

df -h | awk '/\/$/{print "根存储空间可用 " $4}'

ifconfig $wangka | awk '/RX packets/{print "网卡流入 " $5/10^6 "MB"}'
#网卡流入量

ifconfig $wangka | awk '/TX packets/{print "网卡流出 " $5/10^6 "MB"}'
#网卡流出量

#echo "安装包共 $(dpkg -l | wc -l) 个"
echo "安装包共 $(rpm -qa | wc -l) 个"

#echo "本机用户数 $(cat /etc/passwd | wc -l) 个"
awk 'END{print "本机用户数 " NR " 个"}' /etc/passwd

echo "当前登录人数 $(who | wc -l)"

echo "当前进程数 $(ps -ef | wc -l)"
#echo "当前进程数 $(ps aux | wc -l)"

sleep 20
clear
done
