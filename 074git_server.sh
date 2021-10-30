#!/bin/bash

#Installing:
# git                                         x86_64                            1.8.3.1-23.el7_8                              base                            4.4 M
#Installing for dependencies:
# perl-Error                                  noarch                            1:0.17020-2.el7                               base                             32 k
# perl-Git                                    noarch                            1.8.3.1-23.el7_8                              base                             56 k
# perl-TermReadKey                            x86_64                            2.30-20.el7                                   base                             31 k

yum -y install git

mkdir -p /var/git

git init /var/git/project --bare
#--bare luo; kong cangku
#init chuangjian cangku

ls /var/git/project

##########----->1 ssh
#moren SSH fuwu
#xuyao shuru root mima
#git clone root@1.116.26.230:/var/git/project
#cankao 002ssh_copy_id.sh

##########------>2 git
#yum -y install git-daemon
#read server
#buxuyao ssh
sed -i 's#--base-path=/var/lib/git#--base-path=/var/git#g' /usr/lib/systemd/system/git@.service

#gitinit--bare/var/git/base_git

#systemctl start git.socket
#systemctl enable git.socket
#systemctl status git.socket

#change to client
#cd ~
#xuyao shoudong qiehuai mulu

#git clone git://1.116.26.230/base_git

##########------>3 http
#zhidu only read
#yum -y install httpd gitweb

#sed -i '11a \
#$projectroot="/var/git"' /etc/gitweb.conf

#git init --bare /var/git/base_http

#systemctl start httpd
#systemctl enable httpd
#systemctl status httpd

#change to client

#liulanqiu dakai 1.116.26.230/git




