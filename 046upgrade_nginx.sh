#!/bin/bash

vision=1.12.2
#设置需要升级的版本

mkdir -p /usr/local/nginx
wget -O /usr/local/nginx/nginx-$vision.tar.gz http://nginx.org/download/nginx-$vision.tar.gz
cd /usr/local/nginx

tar -xf nginx-$vision.tar.gz

cd nginx-$vision

./configure \
        --prefix=/usr/local/nginx/ \
        --user=nginx \
        --group=nginx \
        --with-http_ssl_module
#配置

make
#Don't  makeinstall

mv /usr/local/nginx/sbin/nginx /usr/local/nginx/sbin/nginx.bak
#sbin下备份之前nginx的操作脚本

cp /usr/local/nginx/nginx-$vision/objs/nginx /usr/local/nginx/sbin/
#把make的新版本下/objs/nginx内容，复制到之前的根目录；
#其他的配置、html、日志等文件全部保持不变

killall nginx
#关闭之前nginx的所有进程
#kill -USR2 $(cat /usr/local/nginx/logs/nginx.pid)

nginx
#启动nginx
