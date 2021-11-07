#!/bin/bash

read -p "请输入app名称，像: nginx-1.12.1 " chengxu
if [ -e $chengxu ] ; then
#-e 是否存在
	echo "没输入，重新执行吧，拜拜"
	exit
fi
#文件测试
#-e 是否存在
#-d 是否为目录
#-f 是否为文件
#-r 是否可读
#-w 是否可写
#-x 是否可执行
#-L 符号连接
#-c 是否字符设备
#-b 是否块设备
#-s 文件非空

mkdir -p /home/$chengxu
cd /home/$chengxu

read -p "请输入软件下载地址，像: http://nginx.org/download/nginx-1.12.1.tar.gz  " wangzhi
if [ -e $wangzhi ] ; then
        echo "没输入，重新执行吧"
        exit
fi

wget $wangzhi
tar -xzvf $chengxu.tar.gz

#read -p " qing shuru yilaibao like:(gcc openssl) " yilaibao
#if [ -e $yilaibao ] ; then
#	echo "chongxin shuru"
#	exit
#fi

#yum install -y $yilaibao

cd /home/$chengxu/$chengxu

./configure
make
make install

#sed -i s/" 80;"/" 8081;"/g /usr/local/$chengxu/conf/$chengxu.conf

#/usr/local/$chengxu/sbin/$chengxu
