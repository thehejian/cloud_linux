#!/bin/bash
######################——》变量输入
read -p "请输入变量名称" name -t 5
#[-p prompt] 输入
#[-t timeout] 超时时间
#可以接多个参数

######################——》条件测试
##三种方法
#test<测试表达式>
#[<测试表达式>]
#[[测试表达式]]

#一和二是相同的，三是扩展的
#[[]]中可以使用通配符等进行匹配
#&& || < > 可以用在[[]]中，其他不能用[] （转义后可以）
#对于整数的数字运算，也可以使用(())


###########——》test
test -f file && echo "true" || echo "false"
#false

test ! -f file && echo "true" || echo "false"
#ture
######################################——》字符串操作符
#字符串判断要加引号
#[[ -n "STRING" ]]
#the length of STRING is nonzero
#字符串长度不是0输出为真；字符串存在为真；

#[[ -z "STRING" ]]
#the length of STRING is zero
#字符串长度是0（zero）为真；字符串不存在为真；

#[[ "字符串1" ==  "字符串2" ]]
#[[ "字符串1" !=  "字符串2" ]]

[[ -n "$hejian" ]] && echo 0 || echo 1
#1
#需要加引号
######################################——》文件操作符
#文件判断不见""
#-e 是否(文件或者目录)存在 exist
#-d 是否为目录 directory
#-f 是否为文件 file
#-s 文件非空

#-r 是否可读 read
#-w 是否可写 write
#-x 是否可执行 executable

#-h -L 是否为链接文件 link
#-c 是否字符设备 
#-b 是否块设备
#f1 -nt f2 f1比f2新，则为真 newer then
#f1 -ot f2 f1比f2旧，则为真 older then

###########——》[]
[ -f file ] && echo "true" || echo "false"
#前后都必须加空格，不然报错
#-bash: [-f: command not found
#false

[ ! -f file ] && echo "true" || echo "false"
#-bash: [: missing `]'
#false
#前后必须加空格，报错了


###########——》[[]]
#支持 && ||
[[ -f file && -d path ]] && echo true || echo false
#后面没加空格-bash: [-f: command not found
#false

[ -f file ] && [ -d path ] && echo true || echo false
#-f前面，最后面没加空格 -bash: [-f: command not found

[ -f file -a -d path ] && echo true || echo false
#-bash: [-f: command not found
#false
#-a -o and or

