#!/bin/bash

#更换源库
#参考003一键部署centos源

#安装wget和curl
yum list installed | grep wget curl clash &> /dev/null
[ $? == 0 ] && exit 

yum install wget curl -y

echo '安装完记着 设置——网络——VPN——networkproxy——手动'
linux-设置代理和取消代理
设置代理：
 export http_proxy="http://172.0.0.1:7890"
 export https_proxy="https://172.0.0.1:7890"
取消代理：
unset http_proxy
unset https_proxy
如果想要使代理服务器永久生效，可以修改 /etc/profile文件 ，在profile 中添加或者删除。
alias clash="bash /etc/clash/clash.sh"
export clashdir="/etc/clash"
export all_proxy=http://127.0.0.1:7890
export ALL_PROXY=$all_proxy

#安装clashshell
export url='https://cdn.jsdelivr.net/gh/juewuy/ShellClash@master' && wget -q --no-check-certificate -O /tmp/install.sh $url/install.sh  && sh /tmp/install.sh && source /etc/profile &> /dev/null

#导入配置
https://gateway.subscribe.meirixin.com.cn/api/v1/client/subscribe?token=5576e36a45a6086179bdad543f7adeb9&flag=clash
#https://global.gateway.subscribe.flyint.top/api/v1/client/subscribe?token=5576e36a45a6086179bdad543f7adeb9&flag=clash

#设置——网络——VPN——networkproxy——手动
#http		172.0.0.1	7890
#https		172.0.0.1	7890
#socks主机 	172.0.0.1	7890
#忽略主机	localhost, 127.0.0.0/8, ::1


