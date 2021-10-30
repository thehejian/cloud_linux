#!/bin/bash

att = $(who | wc -l)

[ $att -ge 2 ] && echo "服务器被攻击了" | mail -s test root

#crontab -e

#*/2 * * * * bash /nas/阿里云盘/001-脚本/010.serverattack.sh
