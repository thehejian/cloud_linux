#!/bin/bash
#调用函数得先创建好，才能调用
#可以外部执行先shell脚本，再调用shell中的函数
#脚本2中shell调用时不能用bash调用，得用source或.来执行有函数的脚本

##################################################################################################
cat > 128_01_function.sh << "eof"
#!/bin/bash
myfun() {
echo "0123456"
}
eof

############
cat > 128_02_function.sh << "eof"
#!/bin/bash
source 128_01_function.sh
#. ./128_01_function.sh 可以
#. 128_01_function.sh 可以
#这里不能用bash或者sh只能用.或source
#./128_01_function.sh也不行哈，相当于sh或者bash执行了
myfun
eof
bash 128_02_function.sh

##################################################################################################
cat > 128_03_function.sh << "eof"
#!/bin/bash
#echo -e "\033[31m 红色字 \033[0m" 
#echo -e "\033[32m 绿色字 \033[0m"
red=\\033[31m
green=\\033[32m
rest=\\033[0m

myred() {
  echo -e "$red$1$rest"
}
#$myword是被调用函数的变量，这样竟然也可以！
#mygrenn的$1 $2也可以读取
mygreen() {
  echo -e "$green$1$rest"
}
eof

############
cat > 128_04_function.sh << "eof"
#!/bin/bash
source 128_03_function.sh

read -p "请输入（成功 1|失败2）" myword

case $myword in
  成功 | 1)
  mygreen $myword
  ;;
  失败 | 2)
  myred $myword
  #后面跟的内容就是调用函数的$1
  ;;
  *)
  echo "Usage $0 content {成功 1|失败2}"
esac
eof
bash 128_04_function.sh

#################################################################################################################
[root@host-162-166-94-62 html]# rsync --daemon
[root@host-162-166-94-62 html]# ps -ef | grep -v grep | grep rsync
root     161772      1  0 07:13 ?        00:00:00 rsync --daemon
[root@host-162-166-94-62 html]# netstat -lnptu | grep rsync
tcp        0      0 0.0.0.0:873             0.0.0.0:*               LISTEN      161772/rsync        
tcp6       0      0 :::873                  :::*                    LISTEN      161772/rsync
[root@host-162-166-94-62 html]# ss -lnptu | grep rsync
tcp    LISTEN     0      5         *:873                   *:*                   users:(("rsync",pid=161772,fd=5))
tcp    LISTEN     0      5      [::]:873                [::]:*                   users:(("rsync",pid=161772,fd=6))
[root@host-162-166-94-62 html]# yum install -y lsof
[root@host-162-166-94-62 html]# lsof -i :873
COMMAND    PID USER   FD   TYPE    DEVICE SIZE/OFF NODE NAME
rsync   161772 root    5u  IPv4 171711325      0t0  TCP *:rsync (LISTEN)
rsync   161772 root    6u  IPv6 171711326      0t0  TCP *:rsync (LISTEN)










