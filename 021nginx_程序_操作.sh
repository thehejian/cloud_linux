#!/bin/bash

#程序操作执行

read -p "请输入需要启动的程序，像: nginx " chengxu

if [ -e /usr/local/$chengxu ] ;then
	read -p "start(1|st) or stop(2) or restart(3|re|rest) or status(4|stat|sta) " ng
	case $ng in
	start|st|1)
        	/usr/local/$chengxu/sbin/$chengxu ;;
	stop|2)
	        /usr/local/$chengxu/sbin/$chengxu -s stop ;;
	restart|rest|re|3)
		/usr/local/$chengxu/sbin/nginx -s stop
		/usr/local/$chengxu/sbin/nginx ;;
	status|sta|stat|4)
		ps -ef | grep $chengxu --color
		if [ $? -eq 0 ] ; then
		##？是否执行成功；
			echo "$chengxu 进程OK"
		else
			echo "$chengxu 进程没启动"
		fi
		netstat -lntup | grep $chengxu --color
		[[ $? -eq 0 ]] && echo "$chengxu 端口OK" || echo "$chengxu 端口没找到";;
		#三元表达式，跟上面查进程意思一样
	*)
	        echo "滚蛋，按照提示的输入操作";;
	esac
else
	echo "我草，没有这个程序"
fi
