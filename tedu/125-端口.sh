#!/bin/bash

#telnet
echo -e "\n" | telnet 10.185.81.181 80 | grep Connected

#nmap
nmap 10.185.81.181 -p 80 | grep open
#80/tcp open  http

#nc
nc -z -w 2 10.185.81.181 80 && echo OK
#nc -v -z -w 2 10.185.81.181 80 &> /dev/null && echo OK
#OK
#-v 显示指令执行过程。不需要，可以不展示
#-z 使用0输入/输出模式，只在扫描通信端口时使用。不加耗时很长
#-w<超时秒数> 设置等待连线的时间。









