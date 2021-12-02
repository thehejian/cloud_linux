#!/bin/bash
#整数推荐 [ $a -eq $b ]
#字符串推荐 [ -n "$file" -a -n "$file1" ]

#整数的比较不加加双引号，加了也不会错
#双方括号必须前后空格，双小括号可以不空格
#双方括号加-lt也行
#双小括号可以用 < > == ;但那是不能用-lt
#小括号内甚至可以不加$

a=1
b=2
[ $a -eq $b ] && echo 1 || echo 0
#0
if [ $a -gt $b ]; then echo 1; else echo 0; fi
#0
[ $a -lt $b ] && echo 1 || echo 0
#1
#[[ $a -lt $b ]] && echo 1 || echo 0 也行
if [ $a -le $b ]; then echo 1; else echo 0; fi
#1
#小于等于

(( $a < $b )) && echo 1 || echo 0
#1
#正确，而且双小括号不加空格也可以
(( a < b )) && echo 1 || echo 0
#也可以哈，小括号内甚至可以不加$



(( $a -lt $b )) && echo 1 || echo 0
#-bash: ((: 1 -lt 2 : syntax error in expression (error token is "2 ")
#报错了
