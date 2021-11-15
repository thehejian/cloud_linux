#!/bin/bash

#设置访问密码、开启目录访问、https设置

#vim /usr/local/nginx/conf/nginx.conf
#/usr/local/nginx/html/

mydate=date +'%Y%m%d'
cp /usr/local/nginx/conf/nginx.conf /usr/local/nginx/conf/nginx.conf.$mydate.bak
#备份conf文件

egrep -v '^$|^.*#' /usr/local/nginx/conf/nginx.conf.bak > /usr/local/nginx/conf/nginx.conf
#空白行和注释的去掉

####################################################################################################————》设置访问密码
sed -i '12a \
        auth_basic "input password"; \
        auth_basic_user_file "/usr/local/nginx/pass";' /usr/local/nginx/conf/nginx.conf

#设置auth_basic
#设置auth_basic_user_file

#密码功能需要安装--with-http_ssl_module
yum install -y httpd-tools

#echo "input password"
#htpasswd -c /usr/local/nginx/pass hejian
#交互方式设置，不方便
touch /usr/local/nginx/pass
htpasswd -b /usr/local/nginx/pass hejian 123456
#非交互方式设置htpass的密码文件

####################################################################################################————》开启访问目录
sed -i '12a \
        autoindex on; \
        charset utf-8;' /usr/local/nginx/conf/nginx.conf
#开启访问目录

sed -i '/server_name/s/localhost/www.hejian.com/g' /usr/local/nginx/conf/nginx.conf
#修改虚拟主机名称

echo "1.116.26.230 www.hejian.com" >> /etc/hosts
#host添加域名解析

####################################################################################################————》https设置

##################step1创建私钥
openssl genrsa > /usr/local/nginx/conf/cert.key 
#generate private key
#创建私钥

##################step2创建公钥（证书）（通过私钥创建）
openssl req -new -x509 -key /usr/local/nginx/conf/cert.key  > /usr/local/nginx/conf/cert.pem 
#generate public key (certificate) 
#创建公钥（证书）

   server {
        listen       443 ssl;
        server_name  localhost;
        charset utf-8;
        autoindex on;      
        ssl_certificate      cert.pem;
        ssl_certificate_key  cert.key;
        ssl_session_cache    shared:SSL:1m;
        ssl_session_timeout  5m;
        ssl_ciphers  HIGH:!aNULL:!MD5;
        ssl_prefer_server_ciphers  on;
        location / {
            root   html;
            index  index.html index.htm;
        } 
        }
# 上面的文件复制到  /usr/local/nginx/conf/nginx.conf 下，第9行开始；sed用法搞不定

killall -9 nginx
#nginx进程杀掉后再重启
systemctl restart nginx
systemctl status nginx

