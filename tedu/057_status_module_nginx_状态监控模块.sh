#!/bin/bash

#pv page view
#uv user view

sed -i '42a \
        location /status { \
            stub_status on; \
            #allow IP; \
            #deny IP; \
        }' /usr/local/nginx/conf/nginx.conf


systemctl reload nginx

# Active connection -> 当前连接数 (并发数)
# Server accepts -> 接受连接次数
# server handled -> 处理了多少次; 一般建立多少次，处理多少次
# server requests -> 请求次数

#reading -> 当前读包数
#writing -> 回应的数据包数
#waiting -> 请求等待数

# 3次握手建立连接(syn , syn+ack ,ack) ,4次断开
# 1次连接多次请求，不断开; 手动关闭浏览器才断开 
