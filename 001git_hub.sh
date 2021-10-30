#!/bin/bash

mail=745544752@qq.com
ssh-keygen -t ed25519 -C "$mail"

cp /root/.ssh/id_ed25519.pub /cloudnas/cloudnas/CloudDrive/阿里云盘/001-脚本/
#将公钥复制到 nginx 的 html 目录下;
#详细请参考 002ssh_copy_id.sh
#参考
#https://blog.csdn.net/majinggogogo/article/details/81152938

ssh -T git@github.com
#测试能否连接github

git config --global user.name "thehejian"
git config --global user.email "745544752@qq.com"
#配置 名称 和 邮箱

cd ~
#默认放到家目录
#不能放到云盘上，上传不了

#git remote rm origin
#仓库无法连接时，删除默认git仓库

echo "# cloud_linux" >> README.md
#创建项目描述

mkdir -p ~/cloud_linux
cd ~/cloud_linux
#创建文件夹

git init
#在当前目录（家目录）创建仓库

git add README.md
#git add .
#暂存，非必须

git commit -m "first commit"
#提交所有变更到本地仓库

git branch -M main
#创建主分支为main

git remote add origin git@github.com:thehejian/cloud_linux.git
#git remote add origin https://github.com/thehejian/cloud_linux.git
#HTTPS无法访问，用git吧

git push -u origin main
#提交所有变更到github
#第一次加上 -u 

#/nas/001-脚本 目录下有更新时
rm -rf ~/cloud_linux
#先删除家目录仓库下内容
cp /nas/001-脚本/* ~/cloud_linux/
#脚本复制到仓库
git commit -m "202110301327"
#提交变更到本地
git push origin main
#提交变更到github

#github有变更时
git pull origin main
#从github仓库的主分支获取全部变更
rm -rf /nas/001-脚本/* 
#删除 001-脚本 所有内容
cp ~/cloud_linux/* /nas/001-脚本/
#复制 本地仓库 内容 到 云盘 001-脚本 下





















