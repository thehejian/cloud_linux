#!/bin/bash


read -p "shuru yao qidong de chengxu like: nginx " chengxu

if [ -e /usr/local/$chengxu ] ;then
	read -p "start(1) or stop(2) or restart(3) or status(4) " ng
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
			echo "$chengxu jincheng OK"
		else
			echo "$chengxu jincheng noOK"
		fi
		netstat -lntup | grep $chengxu --color
		[[ $? -eq 0 ]] && echo "$chengxu duankou OK" || echo "$chengxu duankou noOK";;
	*)
	        echo "gun";;
	esac
else
	echo "wokao meiyou zhege chengxu"
fi
