#!/bin/bash
#变量子串
#084bash.txy 第1089行开始 https://github.com/thehejian/cloud_linux/blob/main/084bash.txt
#参考https://blog.csdn.net/github_33736971/article/details/53980123
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













