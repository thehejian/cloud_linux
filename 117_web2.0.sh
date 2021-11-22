source /etc/init.d/functions
read -p "请输入命令，（start|stop）" mycmd
#调用本地函数库
if [ "$mycmd" == "start" ]; then 
    action "nginx is starting" /bin/true
elif [ "$mycmd" == "stop" ]; then    
    action "nginx is DOWN" /bin/false
else
    action "你丫只能输入（start|stop）bash $0" /bin/false
fi
