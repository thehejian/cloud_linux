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

######################################——》cut
path=$PATH
echo "$path" | cut -d ":" -f 5,12
-d 分隔符
-f 取第几个
#使用类似 echo "$path" | awk -F [:] '{print $5}'
#echo "$path" | awk -F ":" '{print $5}'

export | cut -c 12-
#-c 12- 取第12个字串之后的所有，包含第12字串

export | cut -c 12-20
#取12-20字串

######################################——》grep
echo "$path" | grep -o "bin" -i 
#-E --extended-regexp 扩展的正则表达式
#-i 忽略文件中的大小写区别
#-v 反转匹配感，选择不匹配的行
#-n 输出行号；在其输入文件中使用从 1 开始的行号为每一行输出添加前缀
#-o --only-matching 只打印匹配行的匹配（非空）部分，每个这样的部分在单独的输出行上

######################################——》排序 sort wc uniq
sort 
#-f
#-b --ignore-leading-blanks忽略前导空格
#-M  --month-sort 月份排序
#-n
#-r
#-u
#-t
#-k







