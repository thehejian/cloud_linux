#!/bin/bash

#client duan

yum -y install git

#SSH mian mima
ssh-keygen -f /root/.ssh/id_rsa -N '' -y
#-f zhiding wenjian lujing
#-N '' zhiding mima weikong
#-y moren fugai zhiqian de mima
ssh-copy-id 1.116.26.230
#client mima chuan gei server

cd~

#git clone git://1.116.26.230/project
#git fangfa

git clone root@1.116.26.230:/var/git/project
#ssh fangfa
#fei jiaohu shi; kelong dao kehuduan
#zai ~ mulu xia chuangjian project

cd project

ls -a

git config --global user.email "hejianone@gmail.com"
git config --global user.name "hejian"

cat ~/.gitconfig
#zhengti moren peizhi 

cp /nas/001-脚本/074git. ~/project/

git status

#git add  074git.sh
git add .
#zancun suoyou

git commit -m "comment 20211028 19:52"
#tijiao dao bendi git

#git config --global push.default simple
git push
#tuisong dao fuwuqi duan
#fuwuqi kanbudao git push de wenjian

rm -rf ~/project
#shanchu kehuduan cangku

cd ~/

git clone root@1.116.26.230:/var/git/project
#cong fuwuqi chongxin xiazai

cd ~/project
#xuyao qiehuan dao project xia

git pull
#cong fuwuqi duan tongbu

git log

git log --oneline
#jingjian 

git reflog
#ling yizhong 
#kan xiugai ID

git reset 2668311
#huifu dao zhege shijian dian










