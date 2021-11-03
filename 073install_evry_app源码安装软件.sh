#!/bin/bash

app=git
version=2.33.1
path=/usr/local/$app/
appurl=https:/git.kernel.org/pub/scm/git/git.git/snapshot
#不带版本的url; 不要/;

yum -y install gcc readline-devel
yum -y install ncurses-devel
yum -y install pcre-devel
yum -y install python-docutils
#varnish 的依赖包

#创建不登录的用户
useradd -s /sbin/nologin $app

mkdir -p $path
cd $path

wget $appurl/$app-$version.tar.gz

tar -xf $app-$version.tar.gz

cd $app-$version/

#测试存在的特性，检测依赖
./configure

#编译和安装
make && make install
