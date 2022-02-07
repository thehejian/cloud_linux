#!/bin/bash

#这个脚本是对接github和同步数据到github的origin仓库；首次创建、克隆等
#参考 https://blog.csdn.net/majinggogogo/article/details/81152938

#设置邮箱变量
mail=745544752@qq.com

#安装git
yum -y install git

#########################################################################################——》创建公钥
ssh-keygen -t ed25519 -C "$mail"

#########################################################################################——》复制公钥到github
#需要把公钥粘贴到github上；https://github.com/settings/keys
#github可以添加多个公钥

#########################################################################################——》测试能否连接github
ssh -T git@github.com
#测试能否连接github

#########################——》用来区分用户，单人使用可不关注
git config --global user.name "thehejian"
git config --global user.email "745544752@qq.com"
#配置 名称 和 邮箱

#########################——》场景一：本地克隆
mkdir -p ~/cloud_linux
cd ~/cloud_linux
git clone git@github.com:thehejian/cloud_linux.git

#########################——》场景二：本地创建文件，并上传到github的origin仓库
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

git add --all
#暂存全部

git commit -m "first commit"
#提交所有变更到本地仓库

git branch -M main
#创建主分支为main

git remote add origin git@github.com:thehejian/cloud_linux.git
#git remote add origin https://github.com/thehejian/cloud_linux.git
#连接git的origin仓库
#HTTPS无法访问，用git吧

git push -u origin main
#提交所有变更到github
#第一次加上 -u 

#########################——》场景三：日常操作
#请参考脚本000upgate_git.sh
bash 000upgate_git.sh
