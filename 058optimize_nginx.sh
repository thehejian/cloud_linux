#!/bin/bash

lscpu
#chakan CPU hexinshu

sed -i 's/worker_processes  1/worker_processes  1/g' /usr/local/nginx/conf/nginx.conf
#gaicheng he CPU hexin shu yizhi ; ps -ef | grep nginx keyi chakan 

sed -i 's/worker_connections  1024;/worker_connections  65535;/g' /usr/local/nginx/conf/nginx.conf
#jisuanji zuida duankouhao 65535

ulimit -a
#chankan xianzhi

#ulimit -Hn 100000
#-n wenjian shu -Hard, buneng chaoyue ,yunfuwu wufa peizhi

ulimit -Sn 1000
#-n wenjian -Soft jinggaozhi, chaoguo keyi shiyong
#linshi guize

sed -i 's/root soft nofile 100001/root soft nofile 100002/g' /etc/security/limits.conf
sed -i 's/root hard nofile 100002/root hard nofile 100003/g' /etc/security/limits.conf
#yongjiu shengxiao
#gaiwan xuyao chongqi

sed -i '7a \                            
    client_header_buffer_size 1k; \
    large_client_header_buffers 4 4k;' /usr/local/nginx/conf/nginx.conf
#moren 1k; zuida 4ge 4K; shezhi bao tou huancun daxiao

sed -i '49a \                           
        location ~* \.(jpg|jpeg|gif|png|css|js|ico|xml)$ { \
            expires 30d; \
        } ' /usr/local/nginx/conf/nginx.conf
#huancu 30 tian ~* zhengze pipei buqufen daxiaoxie
#304 chongdingxiang 


systemctl reload nginx




yum install -y httpd-tools
ab -n 2000 -c 2000 http://1.116.26.230/
#-client ren
#-number fangwen liang

#ceshi si xunhuan
#while :
#do
#    echo a
#done
