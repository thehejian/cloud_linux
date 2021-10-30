#!/bin/bash

read -p "qing shuru chengxu mingcheng like: nginx-1.12.1 " chengxu
if [ -e $chengxu ] ; then
	echo "chongxin shuru"
	exit
fi

mkdir -p /home/$chengxu
cd /home/$chengxu

read -p "qingshuru ruanjian xiazai dizhi (wget) (.tar.gz) like: http://nginx.org/download/nginx-1.12.1.tar.gz  " wangzhi
if [ -e $wangzhi ] ; then
        echo "chongxin shuru"
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
