#!/bin/bash

#针对css等文件可以进行压缩
sed -i '7a \
     gzip on; \
     gzip_min_length 1000; \
     gzip_comp_level 4; \
     gzip_types text/plain text/css application/javascript application/x-javascript;' /usr/local/nginx/conf/nginx.conf

#gzip_min_length 1000 ;小于1000的不压缩
#mime_type /usr/local/nginx/conf/mime.types 全部文件格式的路径

systemctl reload nginx
