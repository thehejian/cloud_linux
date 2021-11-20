#!/bin/bash

################################################——》比较大小
####判断条件，前后的空格，千万不能忘！！！！
#((a>b)) [ $a -gt $b ] [[ $a > $b ]]
#-eq 只能是整数哈

cat > 117_digit.sh << "eof"
#!/bin/bash
read -p "请输入两个数中间空格隔开 像： 3 7 " a b

if [ $a -gt $b ]; then
    echo -e "\n$a大与$b\n";
elif [ $a -lt $b ]; then
    echo -e "$a小与$b\n";
else
    echo -e "一样大\n";
fi
eof
bash 117_digit.sh

####################################——》判断数字1.0
cat > 117_panduan.sh << "eof"
#!/bin/bash
#不够严谨的方法，建议用方法二
read -p "input " a
mya1=$(echo "$a" | grep "[0-9]")
#判断数字
mya2=$(echo "$a" | grep "[a-zA-Z]")
#判断字母
#[ ${#mya1} -eq 0 ] && echo "纯字母" || echo "纯数字"
if [ ${#mya1} -eq 0 ]; then
echo "纯字串（特殊符号也算）";
elif [ ${#mya2} -eq 0 ]; then
echo "纯数字";
else
echo "不是纯数字或者纯字串";
fi
eof
bash 117_panduan.sh

####################################——》判断数字2.0
cat > 117_panduan_v2.0.sh << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "$a" | sed 's#[0-9]##g')
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v2.0.sh

####################################——》判断数字3.0
cat > 117_panduan_v3.0.sh << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "$a" | sed 's#[0-9]##g' | grep "")
#脱裤子放屁，多此一举
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v3.0.sh

####################################——》判断数字4.0
cat > 117_panduan_v4.0.sh << "eof"
#!/bin/bash
read -p "input " a
mynum=$(echo "${a//[0-9]/}")
#利用变量自身的替换来实现 
#[ ${#mynum} -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
[ -z $mynum ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字"
eof
bash 117_panduan_v4.0.sh


####################################——》判断数字5.0
cat > 117_panduan_v5.0.sh << "eof"
#!/bin/bash
#如果a长度不为0，把a中的非数字删除，跟原来的a判断；相等则为数字
read -p "input " a
mynum=$(echo "${a//[^0-9]/}")
[ -n "$a" -a "$a" == "$mynum" ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字" 
        #[ -z "$a" ] && echo "输入为空，请重新执行 $0" &&  exit
        #为空时退出
        #不能用;代表不论成功失败都执行下面的内容，会跳出循环
        #跟sed不同，记着最后没有/
        #mynum=$(echo "$a" | sed 's#[^0-9]##g')
        #[ "$a" == "$mynum" ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字" 
eof
bash 117_panduan_v5.0.sh

####################################——》判断数字6.0
#expr计算时，数字加字母expr计算会报错
cat > 117_panduan_v6.0.sh << "eof"
#!/bin/bash
read -p "input " num
expr $num + 1 &> /dev/null
#判断是不要写0，可能会有问题就写个2吧
#expr $num + 1 > /dev/null 2>&1
[ $? -eq 0 ] && echo -e "\n$a是纯数字" || echo -e "\n$a不是纯数字" 
eof
bash 117_panduan_v6.0.sh

####################################——》判断数字大小
cat > 117_panduan_daxiao.sh << "eof"
#!/bin/bash
read -p "input two num like:0 1 " a b
expr $a + $b + 1 > /dev/null 2>&1
#判断多个数字最好用这个办法
[ $? -ne  0 ] && echo -e "\n你丫输入的不是数字 bash $0" && exit
[ $a -gt $b ] && echo -e "\n$a大于$b" || echo -e "\n$a小于等于$b"
eof
bash 117_panduan_daxiao.sh

####################################——》判断数字大小v2.0
cat > 117_panduan_daxiaov2.0.sh << "eof"
#!/bin/bash
read -p "input two num like:0 1 " a b
expr $a + $b + 1 > /dev/null 2>&1
#判断多个数字最好用这个办法
[ $? -ne  0 ] && echo -e "\n你丫输入的不是数字 bash $0" && exit
[ $a -gt $b ] && echo -e "\n$a大于$b" || {
[ $a -lt $b ] && echo -e "\n$a小于$b" || echo -e "\n$a等于$b"
}
eof
bash 117_panduan_daxiaov2.0.sh

####################################——》判断数字大小v3.0
cat > 117_panduan_daxiaov3.0.sh << "eof"
#!/bin/bash
read -p "input two num like:0 1 " a b

#判断是否存在；
#[ -z "$a" -o -z "$b" ] && echo -e "\n你丫输入的内容不够，需要输入两个数字 bash $0" && exit
#字符判断，记着加双引号呀
#[ "$a" == "" -o "$b" == "" ] && echo -e "\n你丫输入的内容不够，需要输入两个数字 bash $0" && exit
[ ${#a} -eq 0 -o ${#b} -eq 0 ] && echo -e "\n你丫输入的内容不够，需要输入两个数字 bash $0" && exit

#判断多个数字
expr $a + $b + 2 > /dev/null 2>&1
[ $? -ne  0 ] && echo -e "\n你丫输入的不是数字 bash $0" && exit

if [ $a -gt $b ]; then
    echo -e "\n$a大于$b";
elif [ $a -lt $b ]; then
    echo -e "\n$a小于$b";
else    
    echo -e "\n$a等于$b";
fi
eof
bash 117_panduan_daxiaov3.0.sh

####################################——》判断httpd
cat > 117_panduan_nginx.sh << "eof"
#!/bin/bash
#如果httpd没启动，则启动
app=httpd
netstat -lnptu | grep "$app" &> /dev/null
#netstat -lnptu | grep $app > /dev/null 2>&1

#netstat -lnptu | grep "httpd" | awk -F "[:]+" '{print $2}'
#80
#awk -F "[:]+" 分隔符是空格加冒号

if [ $? -eq 0 ]; then
    echo -e "$app已经启动\n";
else
    echo -e "$app启动中..\n";
    systemctl start "$app";
    [ $? -eq 0 ] && echo -e "$app启动成功\n" || echo -e "$app启动失败\n" 
fi
eof
bash 117_panduan_nginx.sh

###bash -x 117_panduan_nginx.sh
+ app=httpd
+ netstat -lnptu
+ grep httpd
+ '[' 0 -eq 0 ']'
+ echo -e 'httpd已经启动\n'
httpd已经启动

####################################——》判断mariaDb
cat > 117_panduan_mariaDB.sh << "eof" 
#!/bin/bash
#mysql -u root -p '123456' > /dev/null 2>&1
#mysql -u root > /dev/null 2>&1
#mysql -u root -e -h 1.116.26.230  "show databases;" > /dev/null 2>&
#-h远程连接
#没设置密码，-p就省略掉吧
#得加个交互式命令，不然会卡死
mysql -u root -e "show databases;" > /dev/null 2>&1
[ $? -eq 0 ] && echo "mysql已启动" || {
echo "mysql没启动，你丫赶紧处理下，参考 systemctl start maridb"
systemctl start maridb
eof
bash 117_panduan_mariaDB.sh

####################################——》判断mariaDb——php脚本
cat > 117_panduan_mariaDB_php.php << "eof" 
<?php
$link_id = mysql_connect('localhost','root','') or mysql_error();
//'主机名','用户','密码'
if ($link_id){
    echo "mysql连接错误";
} else{
    echo mysql_error();
}
?>
eof
#php 117_panduan_mariaDB_php.php
/bin/cp -rf 117_panduan_mariaDB_php.php /usr/local/nginx/html/

####################################——》判断mariaDb——php脚本——优化二
cat > 117_panduan_mariaDB_phpv2.0.php << "eof"
<?php
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$e = "连接不通哈";
try { 
    $conn = new PDO("mysql:host=$servername;dbname=mysql;port=3306", $username, $password); 
    echo "mysql连接成功"; 
} 
catch(PDOException $e) 
{ 
    echo $e getMessage(); 
} 
?>
eof
#php 117_panduan_mariaDB_phpv2.0.php
/bin/cp -rf 117_panduan_mariaDB_phpv2.0.php /usr/local/nginx/html/
curl http://1.116.26.230/117_panduan_mariaDB_phpv2.0.php

####################################——》判断nginx
#########——》#namp
cat > 117_web_nmap.sh << "eof"
echo -e "\nnmap 162.166.94.62 -p 80 | grep open | wc -l0"
mynmap=$(nmap 162.166.94.62 -p 80 | grep open | wc -l)
[ $mynmap -eq 1 ] && echo -e "\nwebserver(nginx/apache) is UP" || echo -e "\nwebserver(nginx/apache) is DOWN"
#nmap 1.116.26.230 -p 80 
#$?不行哈
#1
eof
bash 117_web_nmap.sh

#########——》#curl
cat > 117_web_curl.sh << "eof"
echo -e "\ncurl --connect-timeout 1 -m 2 cur 10.234.232.63 &> /dev/null"
curl --connect-timeout 1 -m 2 cur 10.234.232.63 &> /dev/null
#连接超时时间用--connect-timeout参数来指定，数据传输的最大允许时间用-m参数来指定
[ $? -eq 0 ] && echo -e "\nwebserver(nginx/apache) is UP" || echo -e "\nwebserver(nginx/apache) is DOWN"


#mycurl=$(curl -o /dev/null -s -w "%{http_code}\n" 162.166.94.62)
#[ $mycurl -eq 200 ] && echo -e "\nwebserver(nginx/apache) is UP" || echo -e "\nwebserver(nginx/apache) is DOWN"
#curl -o /dev/null -s -w %"{http_code}\n" 10.243.232.63
#504
#200
#-o, --output FILE   Write output to <file> instead of stdout
#-s, --silent        Silent mode. Don't output anything
#不加-s的结果
#  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                 Dload  Upload   Total   Spent    Left  Speed
#100  1842  100  1842    0     0   603k      0 --:--:-- --:--:-- --:--:--  899k
#-w, --write-out FORMAT  What to output after completion
#-w "%{http_code}" 看返回码
#$?不能判断
eof
bash 117_web_curl.sh

#########——》#wget
cat > 117_web_wget.sh << "eof"
#!/bin/bash
echo -e "\nwget -t 1 --timeout=1 http://10.243.232.63"
wget -t 1 -T 1 http://10.243.232.63 &> /dev/null
[ $? -eq 0 ] && echo -e "\nwebserver nginx/apache is UP" || echo -e "\nwebserver nginx/apache is DOWN"
#-T timeout -T 1 或者 --timeout=1 每次的超时时间为1s，默认还是会无线重复
#-t 1 只执行1次


#下面两个配置无所谓
#-q quiet (no output)
#--spider don't download anything
eof
bash 117_web_wget.sh

#########——》#ps
cat > 117_web_ps.sh << "eof"
#!/bin/bash
echo -e "\nps -ef | grep nginx | grep -v grep"
ps -ef | grep nginx | grep -v grep &> /dev/null
[ $? -eq 0 ] && echo -e "\nwebserver nginx/apache is UP" || echo -e "\nwebserver nginx/apache is DOWN"
eof
bash 117_web_ps.sh

###############################################################——》#web2.0
cat > 117_web2.0.sh << "eof"
source /etc/init.d/functions
read -p "请输入命令，（start|stop）" mycmd
#调用本地函数库
if [ "$mycmd" == "start" ]; then 
    action "nginx is starting" /bin/true
elif [ "$mycmd" == "stop" ]; then    
    action "nginx is DOWN" /bin/false
else
    action "你丫只能输入（start|stop）bash $0" /bin/false
fi
eof
bash 117_web2.0.sh

###############################################################——》#检查站点目录是否修改v2.0
cat > 117_zhandian站点目录是否修改v2.0.sh << "eof"
#检查站点目录是否修改
mypath=/usr/local/nginx
mydate=$(date +%Y%m%d)
myfind=$(find $mypath -type f -name "*.conf")
#通过文件目录判断，不够严谨哈
rm -rf 117_log_nginx_"$mydate".txt
for i in $myfind
#遍历全部的配置文件
do
	#echo "$myfind" > 117_log_nginx_ori.txt
	echo "$myfind" > 117_log_nginx_"$mydate".txt
	#md5sum $i >> 117_md5sum_nginx_"$mydate".txt
done

source /etc/init.d/functions
mydiff=$(diff 117_log_nginx_"$mydate".txt 117_log_nginx_ori.txt)
[ -z "$mydiff" ] && action "$path配置没变化" /bin/true || {
	action "$path配置文件变化了" /bin/false
	echo -e "详情如下:\n$mydiff"
}
eof
bash 117_zhandian站点目录是否修改v2.0.sh


###############################################################——》#检查站点目录是否修改
cat > 117_zhandian站点目录是否修改.sh << "eof"
#检查站点目录是否修改
mypath=/usr/local/nginx
mydate=$(date +%Y%m%d)
myfind=$(find $mypath -type f -name "*.conf")
rm -rf 117_md5sum_nginx_"$mydate".txt
for i in $myfind
#遍历全部的配置文件
do
	md5sum $i >> 117_md5sum_nginx_"$mydate".txt
done

source /etc/init.d/functions
mydiff=$(diff 117_md5sum_nginx_"$mydate".txt 117_md5sum_nginx_ori.txt)
[ -z "$mydiff" ] && action "$path配置没变化" /bin/true || {
	action "$path配置文件变化了" /bin/false
	echo -e "详情如下:\n$mydiff"
}
eof
bash 117_zhandian站点目录是否修改.sh

################——》##建立默认文件,这一步在上一步之前
cat > 117_建立原始文件_path.sh << "eof"
#建立默认文件
mypath=/usr/local/nginx
myfind=$(find "$mypath" -type f -name "*.conf")
#rm -rf 117_zhandian站点目录是否修改_path.sh
for i in $myfind
#遍历全部的配置文件
do
	md5sum $i >> 117_md5sum_nginx_ori.txt
done
eof
bash 117_建立原始文件_path.sh













