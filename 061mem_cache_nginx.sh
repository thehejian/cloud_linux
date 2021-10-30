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
