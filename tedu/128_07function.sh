source /etc/init.d/functions
myps () {
  ps -ef | grep -v grep | grep rsync &> /dev/null
}
start () {
    myps
    if [ $? -gt 0 ]; then
        rsync --daemon && action "启动成功" /bin/true
    else
        action "已启动" /bin/true
    fi
}
#用大于0判断是OK的；
stop () {
    myps
    if [ $? -gt 0 ]; then
     action "已关闭" /bin/true 
    else
      pkill rsync
      action "关闭成功" /bin/true 
    fi
}
restart () {
    pkill rsync
    sleep 2
    rsync --daemon
    [ $? -eq 0 ] && action "重启成功" /bin/true || action "重启失败" /bin/false
}
