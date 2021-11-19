#!/bin/bash
echo -e "\nwget -t 1 --timeout=1 http://10.243.232.63"
wget -t 1 -T 1 http://10.243.232.63 &> /dev/null
[ $? -eq 0 ] && echo -e "\nwebserver nginx/apache is UP" || echo -e "\nwebserver nginx/apache is DOWN"
#-T timeout -T 1 或者 --timeout=1 每次的超时时间为1s，默认还是会无线重复
#-t 1 只执行1次


#下面两个配置无所谓
#-q quiet (no output)
#--spider don't download anything
