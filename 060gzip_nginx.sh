#!/bin/bash

sed -i '7a \
     gzip on; \
     gzip_min_length 1000; \
     gzip_comp_level 4; \
     gzip_types text/plain text/css application/javascript application/x-javascript;' /usr/local/nginx/conf/nginx.conf

#gzip_min_length 1000 ;xiao wenjian bu yasuo
#mime_type /usr/local/nginx/conf/mime.types



systemctl reload nginx
