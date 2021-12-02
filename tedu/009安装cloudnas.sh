#!/bin/bash

#这是一个安装cloudnas的脚本

################################################################--->Step1 安装docker
#yum源参考003一键安装centos

#卸载docker
yum autoremove docker -y

#官方curl安装docker
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun

#启动docker 设置开机启动 查看docker状态
systemctl start docker
systemctl enable docker
systemctl status docker

################################################################--->Step2 docker pull cloudnas
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
#--restart unless-stopped 开机重启？
#--env FuseUID=root --env FuseGID=root 设置root权限？
#-v /cloudnas/cloudnas:/CloudNAS:shared 映射到本地盘
#--privileged ？？
#--device /dev/fuse:/dev/fuse ？？

#设置超链接
ln -s /cloudnas/cloudnas/CloudDrive/阿里云盘 /nas
