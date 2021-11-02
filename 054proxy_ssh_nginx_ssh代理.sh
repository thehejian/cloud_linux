#!/bin/bash

#代理为vmware的centos，远程连接1.116.26.230；客户端为vmware的ubuntu
# --with-stream 需要安装时，configure这个模块；参考045install_nginx

sed -i '/http {/i \
stream{ \
    upstream backup { \
        server 1.116.26.230:22; \
        #server 192.168.29.151:22; \
    }\
    server { \
        listen 2222; \
        proxy_pass backup; \
        proxy_timeout 3s; \
    } \
}' /usr/local/nginx/conf/nginx.conf

#整体配置在html上面
#代理服务器在vmware的centos192.168.29.154 
#ssh服务器在ubuntu192.168.29.151和1.116.26.230服务器
#proxy服务器得能访问ssh服务器；ssh服务器相互可以不通，ssh服务器可以访问不了proxy服务器；
#keyi shixian suoyou TCP/UDP de fuwu; xiang 3306/25/9000/22 dengdeng;

killall -9 nginx
systemctl restart nginx

echo "sshd: ALL" >> /etc/hosts.allow      
##允许所有ip主机均能连接本机
