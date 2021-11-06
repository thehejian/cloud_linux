#!/bin/bash
path=/usr/local/nginx/html

#find $path -type f -name "*.tar.gz" -exec rm -rf {} \;
#风险巨大，如果路径不对就删除本地或根目录

find ${path:-/tmp} -type f -name "*.tar.gz" -exec rm -rf {} \;
#路径如果不对，就删除tmp缓存路径
#shell -x ;能看到执行的变量
