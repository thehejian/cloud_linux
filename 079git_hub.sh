#!/bin/bash

mail=745544752@qq.com
ssh-keygen -t ed25519 -C "$mail"

rm -rf /cloudnas/cloudnas/CloudDrive/阿里云盘/001-脚本/id_ed25519.pub
cp /root/.ssh/id_ed25519.pub /cloudnas/cloudnas/CloudDrive/阿里云盘/001-脚本/
#jiang gongyao fuzhi dao nginx de html mulu;

#cankao
#https://blog.csdn.net/majinggogogo/article/details/81152938

ssh -T git@github.com
#ceshi nengfou lianjie

git config --global user.name "thehejian"
git config --global user.email "745544752@qq.com"


cd /nas/001-脚本

#git remote rm origin
echo "# cloud_linux" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/thehejian/cloud_linux.git
git push -u origin main
#diyici jia -u



