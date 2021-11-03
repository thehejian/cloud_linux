#!/bin/bash

#gonggong wangluo
#GRE PPTP L2TP+IPSec SSL
#cong nan dao yi
#cong anquan jiaodu zhenghao xiangfan

#client	eth3	201.1.2.10/24
#proxy eth0	192.168.4.5/24
#proxy eth3	201.1.2.5/24

#xuyao zai kvm shangmian gao
####--->client
#setip
#eth3
#201.1.2.10/24

####--->proxy
#setip
#eth3
#192.168.4.5/24


###########################################################################################################################---->GRE
#window moren buzhichi GRE
#client he proxy dou xuyao anzhuang 
#liangge linux zhijian; buqufen client he server
#neihe zhichi gongneng; buxuyao anzhuang ruanjian
#linux neihe shi mokuaihua sheji

###################---->chakan shifou anzhuang gre mokuai(centos)
lsmod
lsmod | grep ip_gre

modprobe ip_gre
lsmod | grep ip_gre

modinfo ip_gre
#chakan ip_gre xinxi

find /lib/modules/3.10.0-1160.45.1.el7.x86_64/kernel/ -name "*.ko.*" | wc -l
#2503 ge mokuai

#rmmod ip_gre
#xiezai ip_gre mokuai

##################---->chuangjian suidao
#xuyao guanbi fanghuoqiang
ip tunnel add tun0 mode gre \
remote 1.116.26.230 local 192.168.29.154
#centos 192.168.29.154 -----> zuiwei client
#tengxunyun 1.116.26.230 ----> zuiwei yuanduan
#ubuntu 192.168.29.151
#ip tunnel add chuangjian suidao; mingcheng wei tun0
#mode wei gre
#zai client; local gen benji IP; remote gen duiduan IP
#ip tunnel help; shiyong shuoming

##################---->jihuo suidao
#ip a s
#ipconfig
#chakan suoyou wangka xinxi
#chakan tun0 wangka
#chuangjian peer lianjie
#bi ip link show geng xiangxi

ip link show
ip link set tun0 up
#kaiqi tun0 suidao
#iplinkset tun0 down
ip link show

##################---->wei suidao pei IP
ip addr add 10.10.10.10/24 peer 10.10.10.5/24 \
dev tun0
#remote 10.10.10.10/24
#local 10.10.10.5/24

ip a s tun0
#chakan tun0 de ip

##################---->qiehuan dao duiduan(1.116.26.230) chongxinzhixing
modprobe ip_gre
ip tunnel add tun0 mode gre \
remote 192.168.29.154 local 1.116.26.230
ip link set tun0 up
ip addr add 10.10.10.5/24 peer 10.10.10.10/24 \
dev tun0
ip a s tun0

##################---->guanbi fanghuoqiang
echo "1" > /proc/sys/net/ipv4/ip_forward
#kaiqi luyou zhuanfa
#linux fuwuqi biancheng luyouqi
#ruan luyou
firewall-cmd --set-default-zone=trusted

###########################################################################################################################---->PPTP
#zhichi windows
#windows wangka jia qiaojie






