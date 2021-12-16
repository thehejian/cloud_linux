#!/bin/bash

#这是一个安装cloudnas的脚本

################################################################--->Step1 安装docker

brew install --cask --appdir=/Applications docker

################################################################--->Step2 docker pull cloudnas
#下载安装 cloudnas
docker pull cloudnas/clouddrive

cd /Users/hejian
#设置安装目录，设置权限
mkdir -p cloudnas/cloudnas
mkdir -p cloudnas/config
mkdir -p cloudnas/media
mkdir -p nas
chmod -R 777 cloudnas

#启动docker
#https://blog.csdn.net/choubu2025/article/details/100655159
docker run -d \
      --name clouddrive \
      --restart unless-stopped \
      cloudnas/clouddrive


docker run -d \
      --name clouddrive \
      --restart unless-stopped \
      -v /Users/hejian/cloudnas/cloudnas:/CloudNAS:shared \
      -v /Users/hejian/cloudnas/config:/Config \
      -v /Users/hejian/cloudnas/media:/media:shared \
      --network host \
      --pid host\
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
