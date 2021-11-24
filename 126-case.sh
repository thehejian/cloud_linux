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






















 b 
