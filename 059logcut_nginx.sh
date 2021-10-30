#!/bin/bash

date=$(date +%Y%m%d)
logpath=/usr/local/nginx/logs

mv $logpath/access.log $logpath/access-$date.log
mv $logpath/error.log $logpath/error-$date.log 

kill -USR1 $(cat $logpath/nginx.pid)
#kiil -USR1 -> kill -10 ; guanbi hou zai chongqi
#kill -19 zanting; kill -18 huifu;

#cp  059logcut_nginx.sh /usr/local/nginx/logs/059logcut_nginx.sh

#crontab -e
#03 03 * * 5 $logpath/059logcut_nginx.sh
#jiaohu shi dingshi renwu

(crontab -l;echo "03 03 * * 5 $logpath/059logcut_nginx.sh > /dev/null 2>&1 ") | crontab
#meizhou zhou5 de 03:03 zhixing

crontab -l
#chankan shifou chenggong

#crontab -l | grep -v "059logcut_nginx.sh" | crontab
#shanchu dingshi renwu
