#!/bin/bash

#proxy配置
[root@host-162-166-94-62 ~]# vim /etc/profile
export http_proxy="http://hwx430973:Hjian!7455447@proxyhk.huawei.com:8080/"
export https_proxy=“https://hwx430973:Hjian!7455447@proxyhk.huawei.com:8080/”
export no_proxy="localhost,127.0.0.1,*.huawei.com,10.0.0.0/24,10.185.81.181,162.166.94.62"
[root@host-162-166-94-62 ~]# source /etc/profile

#查看proxy配置
[root@host-162-166-94-62 ~]# echo $https_proxy
[root@host-162-166-94-62 ~]# echo $http_proxy

#DNS配置
[root@host-162-166-94-62 ~]# vim /etc/resolv.conf
options attempts:1
options timeout:1
search huawei.com
nameserver 10.129.54.129
nameserver 10.129.54.128
nameserver 10.98.48.153

#配置yum源
[root@host-162-166-94-62 yum.repos.d]# vim /etc/yum.conf
proxy=http://hwx430973:Hjian!7455447@proxyhk.huawei.com:8080
# 跳过https证书验证
sslverify=0

#wget代理配置
[root@host-162-166-94-62 yum.repos.d]# vim /etc/wgetrc
http_proxy=http://hwx430973:Hjian!7455447@proxyhk.huawei.com:8080
ftp_proxy=http://hwx430973:Hjian!7455447@proxyhk.huawei.com:8080














