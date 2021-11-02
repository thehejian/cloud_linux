#!/bin/bash

#本脚本实现 安卓设备和其他设备访问相同URL时，可以跳转到不同页面
#解决中文乱码

#nginx重写
#/abc 跳转 到 /nas
sed -i '30a \
        rewrite /abc /nas redirect;' /usr/local/nginx/conf/nginx.conf
sed -i '31d' /usr/local/nginx/conf/nginx.conf

#http 重写跳转到 https
sed -i '30a \
        rewrite ^/ https://1.116.26.230; redirect' /usr/local/nginx/conf/nginx.conf
sed -i '31d' /usr/local/nginx/conf/nginx.conf

#跳转到新页面，并保存网站后面的条件内容
sed -i '30a \
        rewrite ^/(.*) https://1.116.26.230/$1;' /usr/local/nginx/conf/nginx.conf
sed -i '31d' /usr/local/nginx/conf/nginx.conf
#上面这些都是练习，用完已经用sed 删除了
#################################################################################################上面的都是练习，不用实际配置
#######################################日志格式配置
#日志格式
sed -i '7a \
    log_format  main  $remote_addr - $remote_user [$time_local] "$request"  \
                      $status $body_bytes_sent "$http_referer"  \
                      "$http_user_agent" "$http_x_forwarded_for";' /usr/local/nginx/conf/nginx.conf
# $remote_addr 远端（客户端）地址（ip）
# $remote_user [$time_local] 远端用户名（IP）和用户的时间
# "$request" 客户端请求
# $status $body_bytes_sent "$http_referer" 状态（200、302） 请求内容的大小（字节） 推荐（从哪里过来，不如通过百度搜索调过来的）
# $http_user_agent 客户端代理（Linux、Android、Windows）
# $http_x_forwarded_for 浏览器版本（Chrome、curl） 
#每一行都没放'但是可以正常使用，不影响，如果用不了使用下面的内容
    #log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
    #                  '$status $body_bytes_sent "$http_referer" '
    #                  '"$http_user_agent" "$http_x_forwarded_for"';

#######################################Android的跳转的html页面
#创建Android的html文件
mkdir -p /usr/local/nginx/html/android/
touch /usr/local/nginx/html/android/android.html
echo "this is android index" /usr/local/nginx/html/android/android.html

#######################################Android的nginx配置，重定向
#安卓设备的内容重写
sed -i '33a \
        if ($http_user_agent ~* Android){ \
            rewrite ^/(.*) /android/$1; \
        } ' /usr/local/nginx/conf/nginx.conf
#不能加 redirect ,不然无限重写;*代表不区分大小写
#~* 正则匹配且不区分大小写
# rewrite old new [opt]
# [opt] last 不再读其他rewrite
#	break 不再读其他语句，请求结束
#	redirect 临时重定向
#	permament 永久重定向

#安卓重写的交互形式，用sed删除
sed -i '34,36d' /usr/local/nginx/conf/nginx.conf

#######################################中文乱码解决
#之前操作有误，导致中文乱码，重新加charset utf-8
sed -i '34a \
        charset utf-8;' /usr/local/nginx/conf/nginx.conf
#重启nginx
systemctl reload nginx
systemctl status nginx
