#!/bin/bash
#方法 (())  let expr  bc $[]
#####################################——》(()) 最常用，效率最高
#echo $((a=1+2**5%3))

#((a=1+2**5%3)) | echo $a

#b=$((1+2**5%3))
#echo $b

#整数运算，包括0
#(()) 可以不加
#<<向左位移 >>向右位移
# ^ 位的取反
# ! 逻辑取反
# |位的或
# ~逻辑与???
# || 逻辑的OR
# && 逻辑的AND
# ?: 条件表达式
# ** 几次方 2**3
# 赋值 = += -= *= %= &= ^= <<= >>= |= 

echo $((3>2))
#1
#做判断，成立则为1；不成立则为0

mynum=100
echo $((mynum + 2))
#102

#####################################——》let
#看个错误的例子
i=2
i+=8
echo $i
#28

i=2
i=i+8
echo $i
#i+8

i=2
let i=i+8
echo $i
#10

#####################################——》expr
expr 2+2
#2+2
#必须要放空格

expr 2 + 2
#4

expr 4 * 5
#expr: syntax error
#特殊符号必须转义

expr 4 \* 5
20

i=0
i=$(expr $i + 1)
echo $i
#1
#比(())效率低

expr $[2+3*6]
#20
#使用方括号不需要加空格
#也不需要转义

hejian=12345
expr length $hejian
#5

hejian=123abc
expr substr $hejian 2 3
#23a
#类似下面的
echo "${hejian:2:3}"
#3ab
echo "${hejian:1:3}"
#23a

#####################################——》bc
#可以计算小数
#类似bash的处理
      
echo $((1+2+7.6))     
#错误
echo "1+2+7.6" | bc   
#9.6
expr 1 + 2 + 7.6 
#错误
echo "obase=16; 1" | bc  
#转换为16进制
seq -s "+" 100 | bc
#-s 把默认的 \n 换成 +
echo {1..100} | tr " " "+" | bc
#tr 替换
seq 100 | awk '{total+=$1}END{print total}' 
#awk方法

#####################################——》typeset
#内置命令
#效率高

typeset -i a=1 b=3
a=a+b
echo $a

#####################################——》S[]
#$[]不能计算小数点

echo $[2+3]
5
echo $[2+3.3]
-bash: 2+3.3: syntax error: invalid arithmetic operator (error token is ".3")


