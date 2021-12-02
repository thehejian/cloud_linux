#!/bin/bash

#git的yum包和依赖包
#Installing:
# git      
#Installing for dependencies:
# perl-Error    
# perl-Git     
# perl-TermReadKey  

yum -y install git

#创建服务器端的git仓库
mkdir -p /var/git

git init /var/git/project --bare
#--bare 裸; 空仓库
#init 创建仓库

ls /var/git/project

################################################################################----->1 ssh
#默认SSH服务
#需要输入root密码
#git clone root@1.116.26.230:/var/git/project
#参考 002ssh_copy_id.sh

################################################################################------>2 git
#yum -y install git-daemon
#不需要ssh
sed -i 's#--base-path=/var/lib/git#--base-path=/var/git#g' /usr/lib/systemd/system/git@.service

#gitinit--bare/var/git/base_git

#systemctl start git.socket
#systemctl enable git.socket
#systemctl status git.socket

###################切换到客户端
#cd ~
#需要手动切换目录

#git clone git://1.116.26.230/base_git

################################################################################------>3 http
#只读
#yum -y install httpd gitweb

#sed -i '11a \
#$projectroot="/var/git"' /etc/gitweb.conf

#git init --bare /var/git/base_http

#systemctl start httpd
#systemctl enable httpd
#systemctl status httpd

###################切换到客户端

#浏览器打开 1.116.26.230/git
