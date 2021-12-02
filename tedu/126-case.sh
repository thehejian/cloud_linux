#!/bin/bash

#if更常用；case全部可以转变为case

case "" in
  1|2) CMD1
  ;;
  3|4) CMD2
  ;;
  *) CMD3
esac
##############################################################################输入数字的判断
cat > 126_shuzi.sh << "eof"
#!/bin/bash
#输入数字的判断
read -p "input num " num
source /etc/init.d/functions
case $num in
  1) action "$num" /bin/true
  ;;
  2) action "$num" /bin/true
  ;;
  [3-9] | 10) action "$num" /bin/true
  #不知道为啥不行[3-10]很奇怪代表的意思是3-1 或者 3-0
  ;;
  *) action "数字要小于10 Usage $0" /bin/false
  ;;
esac
eof
bash 126_shuzi.sh

##############################################################################
cat > 126_02_文字颜色.sh << "eof"
#!/bin/bash

#echo -e "\033[31m 红色字 \033[0m" 
#echo -e "\033[32m 绿色字 \033[0m" 
#echo -e "\033[33m 黄色字 \033[0m" 

myred=\\033[31m
mygreen=\\033[32m
myyellow=\\033[33m
rest=\\033[0m

read -p "请输入内容(成功 1 |失败 2 |待定 3 ) " myword
case "$myword" in
  1 | 成功)
  echo -e "$mygreen $myword$rest"
  ;;
  2 | 失败)
  echo -e "$myred$myword$rest"
  ;;
  *)
  echo -e "$myyellow$myword$rest"
  ;;
esac
eof
bash 126_02_文字颜色.sh

















 b 
