#!/bin/bash

file=abc123
file1=efg456
num1=123
num2=456

[ -n "$file" ] && echo 1 || echo 0
if test -n "$file"; then echo 1; else echo 0; fi

[ "$file" -ne "$file1" ] && echo 1 || echo 0
#-bash: [: abc123: integer expression expected
#报错了
if test "$file" -ne "$file1"; then echo 1； else echo 0; fi
#-bash: [: abc123: integer expression expected
#报错了



[ $num1 -ne $num2 ] && echo 1 || echo 0
if test $num1 -ne $num2; then echo 1; else echo 0; fi 
