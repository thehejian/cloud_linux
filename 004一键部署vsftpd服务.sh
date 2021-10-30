#!/bin/bash

#一键部署vsftpd服务

#x=先部署阿里云centos源
rm -rf /etc/yum.repos.d/*.repo
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum repolist
yum update -y && yum upgrade -y
#安装vsftfd
yum install -y vsftpd &> /dev/null
systemctl start vsftpd
systemctl enable vsftpd
systemctl status vsftpd


