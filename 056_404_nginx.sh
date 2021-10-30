#!/bin/bash
sed -i '33a \
        error_page  404 /404.html;' /usr/local/nginx/conf/nginx.conf

touch /usr/local/nginx/html/404.html

echo "404 Error" > /usr/local/nginx/html/404.html

systemctl reload nginx
systemctl status nginx
