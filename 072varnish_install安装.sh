#!/bin/bash

#安装依赖
yum -y install gcc readline-devel
yum -y install ncurses-devel
yum -y install pcre-devel
yum -y install python-docutils

#添加不登录的用户名
useradd -s /sbin/nologin vaenish

#创建安装路径
mkdir -p /usr/local/varnish
cd /usr/local/varnish

#下载安装包
wget https://varnish-cache.org/_downloads/varnish-5.2.1.tgz

#解压
tar -xf varnish-5.2.1.tgz

#进入文件夹
cd varnish-5.2.1

#测试存在的特性，检测依赖
./configure
#make编译 && make install安装
make && make install

#复制创建配置文件
cp /usr/local/varnish/varnish-5.2.1/etc/example.vcl /usr/local/etc/default.vcl

nginx -s stop

varnishd -f /usr/local/etc/default.vcl
#默认缓存到内存

#varnishd -s malloc,128M
#内存缓存128MB

#varnishd -s file,/var/lib/varnish_storage.bin,1G
#使用硬盘缓存 

#varnishlog
#看日志; 详细
#实时显示

#varnishncsc
#类似nginx日志; 实时显示

#varnashadmin
#交互式

#ban req.url ~ .*
#ban req.url ~ c.html
#清理缓存

ss -lnptu | grep 80
curl 1.116.26.230 

