#!/bin/bash

#git 方法

yum -y install git-daemon
#不需要ssh
sed -i 's#--base-path=/var/lib/git#--base-path=/var/git#g' /usr/lib/systemd/system/git@.service

systemctl start git.socket
systemctl enable git.socket
systemctl status git.socket

##################################################客户端
cd~
#rm -rf project
#xuyao shoudong qiehuan mulu

git clone git://1.116.26.230/project
#git方法获取，好像需要私钥和证书配合，github是这样
#ssh方法获取：git clone root@1.116.26.230:/var/git/project
