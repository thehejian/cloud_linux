#!/bin/bash
#[]中前后一级符号之间必须有空格；可以数字或字符串；不能用> < && || 等
#(())不关注是否有空格；只支持数字；变量的$符号也可以省略

if []; then
CMD;
fi
#基本格式
#一行写法
if []; then CMD; fi

if [ 8 -lt 10 ]; then 
  echo 1;
else
  echo0;
fi

if ((8<10)); then
  echo "1";
else
  echo "0";
fi

read -p "input num1 " a
read -p "input num2 " b
#read 不保存变量

a=1
b=3
if [ $a -gt $b ]; then
  echo "$a大于$b";
else
  echo "$a小于$b";
fi

a=1
b=3
if (($a>$b)); then
  echo "$a大于$b";
else
  echo "$a小于$b";
fi

read -p "输入两个数字，中间用空格隔开" a b
#12 13
if ((a>b)); then
  echo "$a大于$b";
else
  echo "$a小于$b";
fi
#read 不能命令行这样输入，会报错；.sh文件可以

((a>b)) && echo "$a大于$b" || echo "$a小于$b"

######################——》存在文件则输出，没有则新建后输出
if [ -e ~/test.sh ]; then
cat ~/test.sh;
else
echo "123" > ~/test.sh;
echo "新建文件 ~/test.sh";
cat ~/test.sh;
fi




