#!/bin/bash
#这是一个部署网易镜像centos源的脚本

date=$(date +%Y%m%d)

cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.$date.bak

#wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
#阿里
#wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.163.com/.help/CentOS7-Base-163.repo
#网易
sudo sed -e 's|^mirrorlist=|#mirrorlist=|g' \
         -e 's|^#baseurl=http://mirror.centos.org|baseurl=https://mirrors.tuna.tsinghua.edu.cn|g' \
         -i.bak \
         /etc/yum.repos.d/CentOS-*.repo
#清华


yum clean all
yum repolist

yum update -y && yum upgrade -y

echo "yum无法安装的可以去这个网址下载RPM包 https://pkgs.org/"

#(crontab -l;echo "03 03 * * 5 ~/cloud_linux/003centos的yum源.sh > /dev/null 2>&1 ") | crontab
#非交互式任务
#每周五的03:03执行

#sed -i '2,4d' /var/spool/cron/root
#shanchu buxuyao de jiaoben

#crontab -l
