#!/bin/bash

#客户端

yum -y install git

###################################################################SSH免密码配置
ssh-keygen -f /root/.ssh/id_rsa -N '' -y
#-f 指定文件路径
#-N '' 指定密码为空
#-y 强制覆盖之前的密码

ssh-copy-id 1.116.26.230
#客户端的证书（公钥）传给服务器端

cd~
#git clone git://1.116.26.230/project
#克隆服务器端的仓库

git clone root@1.116.26.230:/var/git/project
#ssh访问
#非交互式;克隆到客户端
#在~目录下创建项目

cd ~/project

ls -a

git config --global user.email "hejianone@gmail.com"
git config --global user.name "hejian"
#需要提前设置email和用户名，用以区分

cat ~/.gitconfig
#这个项目的默认配置 

git status
#查看当前项目的状态

#git add  074git.sh
git add --all
#暂存所有数据

git commit -m "comment 20211028 19:52"
#提交变更到本地

#git config --global push.default simple
git push
#推送变更到服务器端

#rm -rf ~/project
#客户端删除项目

cd ~/

git clone root@1.116.26.230:/var/git/project
#从服务器重新克隆项目

cd ~/project
#需要切换到项目目录下

git pull
#从服务器端同步仓库的内容

git log

git log --oneline
#简单

git reflog
#看修改ID

git reset 2668311
#恢复到这个分支下
