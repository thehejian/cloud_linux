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

##################---->开启转发。关闭防火墙
echo "1" > /proc/sys/net/ipv4/ip_forward
#开启路由转发
#linux 变成路由器
#软路由

firewall-cmd --set-default-zone=trusted
关闭防火墙

###########################################################################################################################---->PPTP
##############################################################################################---->PPTP之服务器端配置
#zhichi windows
#windows wangka jia qiaojie
#mkdir -p /usr/local/pptpd
#cd /usr/local/pptpd
#wget -O /usr/local/pptpd/pptpd-1.4.0.tar.gz https://fossies.org/linux/misc/pptpd-1.4.0.tar.gz
#wget https://sourceforge.net/projects/poptop/files/pptpd/pptpd-1.3.4/pptpd-1.3.4.tar.gz/download

#tar -xf pptpd-1.3.4.tar.gz
#cd pptpd-1.3.4

#./configure
#make
#make install

yum install -y ppp pptpd

###################################---->PPTP 配置文件1
sed -i '2a \
localip 1.116.26.230 \
remoteip 192.168.29.154 ' /etc/pptpd.conf
#localip 1.116.26.230 服务器端，本地
#remoteip 192.168.29.154 远端，给客户端的ip

###################################---->PPTP 配置文件2
sed -i '2a \
#require-mppe-128 \
ms-dns 8.8.8.8' /etc/ppp/option.pptpd
#作用，给客户端配dns域名解析服务器
#require-mppe-128 默认已打开，默认128位加密
#ms-dns 8.8.8.8 需要打开，默认被注释

#sed -i 's/name pptpd/name hejian_pptpd/g' /etc/ppp/option.pptpd
#改pptpt的名称
#可以不改

###################################---->PPTP 配置文件3
#配置用户名密码
sed -i ' \
hejian    *    123456    *' /etc/ppp/chap-secrets
#hejian(用户名)    *（服务器标识，所有）（pptpt的名称，上一个配置 hejian_pptpd）    123456（密码）    *（客户端，所有）
#支持创建多个账户

###################################---->开启转发。关闭防火墙
echo "1" > /proc/sys/net/ipv4/ip_forward
#开启路由转发
#linux 变成路由器
#软路由

firewall-cmd --set-default-zone=trusted
关闭防火墙

###################################---->翻墙设置，非必选
iptables -t nat -A POSTROUTING -s 192.168.29.0/24 \
-j ANAT --to-source 1.116.26.230
#nat配置

###################################---->启动服务
systemctl start pptpd
systemctl enable pptpd
systemctl status pptpd

##############################################################################################---->PPTP之客户器端配置
#windows桥接



