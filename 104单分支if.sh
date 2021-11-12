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
file=~/test.sh
cat > tmp.txt << "104eof"
hehehe
hehehe
104eof

if [ -e "$file" ]; then
cat $file;
else
cat tmp.txt > $file;
cat $file;
fi

rm -rf tmp.txt;
#不能这样搞，放在循环中会出错
#最好搞个暂存文件，后面再删了,删除临时文件放循环外面吧；





