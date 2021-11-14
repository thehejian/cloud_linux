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























