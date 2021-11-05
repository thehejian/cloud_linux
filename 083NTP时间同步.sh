#!/bin/bash
#目的，跟服务器时间同步；
#network time Protocol 网络时间协议
#分层设计，层级越多，延迟越大；层数总数在15层内
#SC结构

yum -y install chrony
#配置文件 /etc/chrony.conf 和 /etc/chrony.keys

rpm -ql chrony
#查看软件的所有目录

rpm -qc chrony
#查看软件的所有配置文件
#rpm或者yum安装的才行；源码安装的不行；
