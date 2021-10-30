#!/bin/bash
#这是一个部署网易镜像centos源的脚本

date=$(date +%Y%m%d)

cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.$date.bak

#wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo

yum clean all
yum repolist

yum update -y && yum upgrade -y

