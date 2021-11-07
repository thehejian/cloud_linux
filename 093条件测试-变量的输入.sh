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

#-n STRING
#the length of STRING is nonzero
#是否是数字

#-z STRING
#the length of STRING is zero
#是否存在

#-e 是否存在
#-d 是否为目录
#-f 是否为文件
#-r 是否可读
#-w 是否可写
#-x 是否可执行
#-L 符号连接
#-c 是否字符设备
#-b 是否块设备
#-s 文件非空
