#!/bin/bash

sed -i '7a \                           
    open_file_cache max=2000 inactive=20s; \
    open_file_cache_valid 60s; \
    open_file_cache_min_uses 5; \
    open_file_cache_errors off;' /usr/local/nginx/conf/nginx.conf

#open_file_cache max=2000; fuwuqi zuida huancun 2000ge wenjian jubing
#inactive=20s; fei huodong shijian 20s
#open_file_cache_min_uses 5; fangwen 5 ci yishang fangdao neicun
#open_file_cache_errors off; guanbi huancun baocuo

nginx -s reload

#buffer（缓冲）是为了提高内存和硬盘（或其他I/0设备）之间的数据交换的速度而设计的。

#cache（缓存）是为了提高cpu和内存之间的数据交换速度而设计，也就是平常见到的一级缓存、二级缓存、三级缓存（也叫内存缓存）
