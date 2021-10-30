#!/bin/bash

#这是一个意见部署阿里云centos源的脚本
rm -rf /etc/yum.repos.d/*
cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo https://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum repolist
yum update -y && yum upgrade -y

#卸载docker
yum autoremove docker -y

#安装docker
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

#启动docker 设置开机启动 查看docker状态
systemctl start docker
systemctl enable docker
systemctl status docker

#下载安装 cloudnas
docker pull cloudnas/clouddrive

#设置安装目录，设置权限

mkdir -p /cloudnas/cloudnas
mkdir -p /cloudnas/config
mkdir -p /cloudnas/media
mkdir -p /nas
chmod 777 -R /cloudnas

#启动docker
docker run -d \
      --name clouddrive \
      --restart unless-stopped \
      --env FuseUID=root --env FuseGID=root\
      -v /cloudnas/cloudnas:/CloudNAS:shared \
      -v /cloudnas/config:/Config \
      -v /cloudnas/media:/media:shared \
      -p 9798:9798 \
     --privileged \
     --device /dev/fuse:/dev/fuse \
     cloudnas/clouddrive

#设置超链接
ln -s /cloudnas/cloudnas/CloudDrive/阿里云盘 /nas
