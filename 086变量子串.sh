#!/bin/bash
#变量子串
#084bash.txy 第1089行开始 https://github.com/thehejian/cloud_linux/blob/main/084bash.txt
#参考https://blog.csdn.net/github_33736971/article/details/53980123
#######################################################################################################################——》普通用法
####################################################################——》字符串长度
str=abc123
${#str}
#6
#返回字符串的长度

####################################################################——》字符串截取
${str:1}
#bc123
#从第1位之后开始，不包含第1个
#数字符号从0开始


${str:0:3}
#abc
#从开始输出3个

####################################################################——》删除
str1=abcABC123abcABC123
echo ${str1#a*A}
#BC123abcABC123
#从头开始删除，最短匹配

echo ${str1##a*A}
#BC123
#从头开始删除，最长匹配

echo ${str1%A*3}
#abcABC123abc
#从尾巴开始删除，匹配最短
echo ${str1%%A*3}
#abc
#从尾巴开始删除，匹配最长

####################################################################——》替换
NAME="I am a student student"

echo ${NAME//student/teacher}
#I am a teacher teacher
#// 替换全部的student
#旧的换新的

echo ${NAME/#student/teacher}
echo ${NAME/student/teacher}
#替换开头
#这两个结果一样
#I am a student student
#因为开头的不是student，所以无法匹配

echo ${NAME/#I am a/teacher}
echo ${NAME/I am a/teacher}
#替换开头
#这两个结果一样
#teacher student student
#开头匹配到并替换

echo ${NAME/%student/teacher}
#替换结尾
#I am a student teacher
#%从尾部替换，成功

echo ${NAME/%I am /teacher}
#替换结尾
#I am a student student
#尾部没有，所以无法替换

#######################################################################################################################——》扩展用法
result=${test:-word}
echo $result
#test变量不存在时，result变量等于word，存在时等于test；不影响test
#执行过程中变量赋值，不影响变量值

unset result 
unset test
result=${test:=word}
echo $result
echo $test
#test变量不存在时，result变量等于word，并且把test值也变成word；
#为变量直接赋值
#word
#word

echo ${result:?"变量没定义哈"}
#-bash: result: 变量没定义哈
#变量不存在时，输出提示内容；并退出

result=123
echo ${result:+"有变量呢"}
#判断是否有变量
#有变量则输出"有变量呢"，没有变量则输入空；









