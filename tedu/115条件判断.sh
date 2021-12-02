#!/bin/bash
######################################——》单个条件判断
if [ 條件判斷式 ]; then
	當條件判斷式成立時，可以進行的指令工作內容；
fi   <==將 if 反過來寫，就成為 fi 啦！結束 if 之意！

######################################——》多個條件判斷 
(if ... elif ... elif ... else) 分多種不同情況執行
if [ 條件判斷式一 ]; then
	當條件判斷式一成立時，可以進行的指令工作內容；
elif [ 條件判斷式二 ]; then
	當條件判斷式二成立時，可以進行的指令工作內容；
else
	當條件判斷式一與二均不成立時，可以進行的指令工作內容；
fi

#########################################——》参数输入
cat > 115if.sh << "eof"
#!/bin/bash
read -p "input y or n " myxy 
[ -z "$myxy" ] && echo "please input again" && exit
if [ "$myxy" == "x" -o "$myxy" == "X" ]; then
  echo -e "your choice is $myxy \n";
elif [ "$myxy" == 'y' -o "$myxy" == "Y" ]; then
  echo -e "your choice is $myxy \n"
else
  echo -e "gun!!! shit x or y \n"
fi
eof
bash 115if.sh

###########################################——》语句判断
cat > 115hello.sh << "eof"
#!/bin/bash
if [ "$1" == "hello" ]; then
echo -e "Hello, how are you ? \n"
#判斷 $1 是否為 hello，如果是的話，就顯示 "Hello, how are you ?"；
elif [ -z "$1" ]; then
echo -e "你丫没输入内容\t重新执行${0}文件哈\n";
#如果沒有加任何參數，就提示使用者必須要使用的參數下達法；
elif [ "$1" != "hello" ]; then
echo -e "只能输入hello哈 \t重新执行${0}文件哈\n";
#而如果加入的參數不是 hello ，就提醒使用者僅能使用 hello 為參數。
fi
eof
bash 115hello.sh hehe

cat > 115hello2.sh << "eof"
#!/bin/bash
if [ "${1}" == "hello" ]; then
	echo "Hello, how are you ?"
elif [ "${1}" == "" ]; then
	echo "You MUST input parameters, ex> {${0} someword}"
  #ex>这行他娘的没啥特殊含义
  
else
	echo "The only parameter is 'hello', ex> {${0} hello}"
fi
eof
bash 115hello2.sh hehe

#######################################################——》端口
80: WWW
22: ssh
21: ftp
25: mail
111: RPC(遠端程序呼叫)
631: CUPS(列印服務功能)

##########################################——》查看是否开启端口
cat > 115port.sh << "eof"
#!/bin/bash
myfile=115netstat.txt
netstat -lnptu > $myfile
mytest=$(grep ":80" "$myfile")
[ -n "$mytest" ] && echo -e "\n有www服务器，端口是80\n"
#[我草，方括号中的变量一定要加双引号不然报错]
grep ":22" "$myfile" > /dev/null 2>&1
if [ $? == 0 ]; then
	echo -e "有ssh服务器，端口是22\n"
fi
grep ":21" "$myfile" > /dev/null 2>&1
[ $? == 0 ] && echo -e "有ftp服务器，端口是21\n" || echo -e "没有ftp服务器\n"
mytest=$(grep ":25" "$myfile")
if [ "$mytest" != "" ]; then
	echo -e "有mail服务器，端口是25\n"
else
	echo -e "没有mail服务器\n"
fi
eof
bash 115port.sh

############################################################——》算截止时间
cat > 115date.sh << "eof"
#!/bin/bash
echo "计算未来预期时间距现在的天数"
read -p "请预期输入时间，格式参考 20221231 " dateori
echo "$dateori" | grep "[0-9]\{8\}" > /dev/null 2>&1
[ "$?" != "0" ] && echo -e "\n 格式不对哈，重新输入；重新执行 $0"

data_s_now=$(date +%s)
date_s_ori=$(date --date=$dateori +%s)
#预期时间和现在时间的秒数

date_s_last=$((date_s_ori-data_s_now))
#剩余秒数
date_d_last=$((date_s_last/60/60/24))
#剩余天数
date_y_last=$((date_d_last/365))
#剩余年
date_y_d_last=$((date_d_last%365))
#不足一年的天数
echo -e "\n剩余$date_y_last年,$date_y_d_last天 \n"

eof
bash 115date.sh






