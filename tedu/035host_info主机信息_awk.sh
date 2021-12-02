#!/bin/bash

date +'%Y-%m-%d %H:%M:%S'
uptime | awk -F[,] '{print "CPU负载是 " $4,$5,$6}'
free -h | awk '/^Mem/{print "内存剩余 " $4}'
df -h | awk '/\/$/{print "根存储空间可用 " $4}'
ifconfig eth0 | awk -F[\(] '/RX packets/{print $2}' | awk -F[\)] '{print"网卡流入量 " $1}'
ifconfig eth0 | awk -F[\(] '/TX packets/{print $2}' | awk -F[\)] '{print"网卡流出量 " $1}'
#echo "安装包共 $(dpkg -l | wc -l) 个"
echo "安装包共 $(rpm -qa | wc -l) 个"
#echo "本机安装软件包数量 $(cat /etc/passwd | wc -l) 个"
awk 'END{print "本机安装软件包数量 " NR " 个"}' /etc/passwd
echo "当前登录人数 $(who | wc -l)"
echo "当前进程数 $(ps -ef | wc -l)"
#echo "当前进程数 $(ps aux | wc -l)"
