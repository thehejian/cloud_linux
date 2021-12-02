#!/bin/bash
source /etc/init.d/functions
read -p "请输入指令 (start | 1)(stop | 2)(restart | 3) " mycmd
source 128_07function.sh
case "$mycmd" in
    start | 1)   
    start
    ;;
    stop | 2)
    stop
    ;;
    restart | 3)
    restart
    ;;
    *)
    action "Usage: $0 {(start | 1)(stop | 2)(restart | 3)}" /bin/false
    ;;
esac
