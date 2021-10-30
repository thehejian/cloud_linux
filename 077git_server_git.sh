#!/bin/bash
#################################################
#git fangfa

yum -y install git-daemon
#read server
#buxuyao ssh
sed -i 's#--base-path=/var/lib/git#--base-path=/var/git#g' /usr/lib/systemd/system/git@.service

systemctl start git.socket
systemctl enable git.socket
systemctl status git.socket

#change to client
cd~
#rm -rf project
#xuyao shoudong qiehuan mulu

git clone git://1.116.26.230/project
