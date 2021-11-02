#!/bin/bash

#日志切割，按周期任务执行

date=$(date +%Y%m%d)
logpath=/usr/local/nginx/logs

mv $logpath/access.log $logpath/access-$date.log
mv $logpath/error.log $logpath/error-$date.log 

kill -USR1 $(cat $logpath/nginx.pid)
#kiil -USR1 -> kill -10 ; 关闭后再重启
#kill -19 暂停; kill -18 恢复;

/bin/cp -rf 059logcut_nginx日志切割.sh /usr/local/nginx/logs/059logcut_nginx日志切割.sh

#crontab -e
#03 03 * * 5 $logpath/059logcut_nginx.sh
#交互式定时任务

(crontab -l;echo "03 03 * * 5 $logpath/059logcut_nginx日志切割.sh > /dev/null 2>&1 ") | crontab
#非交互式任务
#每周五的03:03执行

crontab -l
#查看设置的定时任务

#crontab -l | grep -v "059logcut_nginx.sh" | crontab
#删除定时任务
