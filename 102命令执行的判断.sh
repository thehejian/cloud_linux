#!/bin/bash
cmd;cmd
#不考虑相关性的连续执行
#sync; sync; shutdown -h now

cmd1 && cmd2
#当#?为0（执行成功），才执行cmd2

cmd1 || cmd3
#当#?不为0（执行失败），才执行cmd2

#管道命令
#管道命令仅会处理标准输出，对于标准错误输出会与易忽略
#管道命令必须要能够接受来自前一个命令的的数据成为标准输入继续处理才行

path=$PATH
echo "$path" | cut -d ":" -f 5
-d 分隔符
-f 取第几个
#使用类似 echo "$path" | awk -F [:] '{print $5}'
#echo "$path" | awk -F ":" '{print $5}'




