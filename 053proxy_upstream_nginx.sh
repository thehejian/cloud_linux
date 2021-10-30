#!/bin/bash

sed -i  '9a \
    upstream webserver{ \
        server 1.116.26.230:80; \
	server 192.168.29.151:80; \
    }' /usr/local/nginx/conf/nginx.conf
#整体配置
#代理proxy服务器在vmware的centos192.168.29.154 
#web服务器在ubuntu192.168.29.151和tencent1.116.26.230服务器
#proxy服务器得能访问web服务器；web服务器相互可以不通，web服务器可以访问不了proxy服务器；

sed -i '39a \
            proxy_pass http://webserver;' /usr/local/nginx/conf/nginx.conf
#80端口转发配置
#在location /下面

sed -i 's/server 1.116.26.230:80;/server 1.116.26.230:80 weight=2 max_fails=1 fail_timeout=30;/g' /usr/local/nginx/conf/nginx.conf
#设置权重，1.116.26.230的权重是2/3
#max_fail,最大失败次数
#fail_timeout 失败超时时间，s
#down 1.116.26.230 down 标记服务器关机，不参与集群调度

sed  -i '/upstream webserver/a \
        ip_hash;' /usr/local/nginx/conf/nginx.conf
#ip_hash 不同设备访问不同浏览器

systemctl reload nginx
