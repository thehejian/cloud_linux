#!/bin/bash
#目的，跟服务器时间同步；
#服务器最外侧需要联网；客户端可以不上内网；
#闰秒时，提前关闭NTP服务器，防止出错；
#network time Protocol 网络时间协议
#分层设计，层级越多，延迟越大；Stratum层数总数在15层内
#SC结构
##########################################################################################################################################——》服务器端
#################################——》安装ntp
yum -y install chrony
#配置文件 /etc/chrony.conf 和 /etc/chrony.keys

rpm -ql chrony
#查看软件的所有目录

rpm -qc chrony
#查看软件的所有配置文件
#rpm或者yum安装的才行；源码安装的不行；
#################################——》修改配置文件 
#sed -i '/server/s/server ntpupdate.tencent.com iburst/server ntpupdate.tencent.com iburst/g' /etc/chrony.conf
#ntpupdate.tencent.com 获取这个网址的时间
#iburst 时间不一致时，立即获取

sed -i '/#allow/s/#allow 192.168.0.0/16/allow 192.168.0.0/16/g' /etc/chrony.conf
#allow 开启后就变成服务器端了
#支持多行
#deny 192.168.0.3 阻止

sed -i '/#local stratum 10/s/#local stratum 10/local stratum 10/g' /etc/chrony.conf
#stratum 层级，建议不超过15层

cat -n /etc/chrony.conf

#################################——》重启ntp
systemctl restart chronyd
systemctl enable chronyd
systemctl status chronyd
ss -lnptu | grep chronyd

##########################################################################################################################################——》客户器端
#################################——》安装ntp
yum -y install chrony
#################################——》修改配置文件
sed -i '/server/s/server ntpupdate.tencent.com iburst/1.116.26.230 iburst/g' /etc/chrony.conf

#date -s "19:25"
#改系统时间

date
#查看时间












