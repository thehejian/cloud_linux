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

################################################################——》查看内存是否超100mb,发邮件
cd /root/sdc/

cat > 104mail_txt << "eof"
虚拟机内存超了
eof

#yum -y install sendmail

cat > 104mem_if.sh << "eof"
#!/bin/bash
mymem=$(free -m | grep "Mem" | awk '{print $4}')
#free -m 按照mb显示
#[ $mymem -le 100 ] && echo "chaole" || echo "ok"
#比较时，方括号中不会出现>=\<=
#数字判断，用-eq等
#字符判断，不能用-eq等，只能用==和！=
if [ $mymem -le 100 ]; then
mail -s "标题" hejian10@huawei.com < 104mail_txt;
#echo "test" | mail -s "mail_test" hejian10@huawei.com;
else
echo "ok"
fi
eof
bash 104mem_if.sh

( crontab -l; echo "*/3 * * * * /root/sdc/104mem_if.sh > /dev/null 2>&1" ) | crontab
#每3分钟执行

#添加一个crontab任务
( crontab -l; echo "*/1 * * * * /root/sdc/104mem_if.sh > /dev/null 2>&1" ) | crontab
#删除一个crontab任务
crontab -l | grep -v "104mem_if.sh" | crontab





