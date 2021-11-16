#!/bin/bash
for var in con1 con2 con3 ...
do
	程式段
done

#第一次迴圈時， $var 的內容為 con1 ；
#第二次迴圈時， $var 的內容為 con2 ；

######################################——》打印动物
cat > 121_animal_01.sh << "eof"
#!/bin/bash
#假設我有三種動物，分別是 dog, cat, elephant 三種
for i in dog cat elephant
do
    echo -e "\n你是$i"
done
eof
bash 121_animal_01.sh

######################################——》找参数
cat > 121_args_01.sh << "eof"
#帳號都是寫在 /etc/passwd 內的第一個欄位，你能不能透過管線命令的 cut 捉出單純的帳號名稱後，以 id 分別檢查使用者的識別碼與特殊參數呢
myname=$(cut -d ":" -f 1 /etc/passwd)
for i in $myname
do
    id "$i"
done
eof
bash 121_args_01.sh

######################################——》ping
cat > 121_ping.sh << "eof"
#偵測的網域是本機ping所在的 192.168.1.1~192.168.1.100
#2>&1  意思是把 标准错误输出 重定向到 标准输出.
#&>file  意思是把标准输出 和 标准错误输出 都重定向到文件file中
myip=10.243.232
for i in $(seq 1 100)
do
	ping $myip.$i -c 1 -w 1 &> /dev/null && result=0 || result=1
	[ $result -eq 0 ] && echo -e "$myip.$i ping成功成功成功成功！！" || echo -e "$myip.$i ping不通"
done
eof
bash 121_ping.sh

######################################——》ping 2.0
cat > 121_ping2.0.sh << "eof"
#!/bin/bash
for i in {1..100}
do
	ping -c 1 -w 1 10.243.232.$i &> /dev/null
	[ $? -eq 0 ] && echo -e "10.243.232.$i ping成功成功成功成功！！" || echo -e "10.243.232.$i ping不通"
done
eof
bash 121_ping2.0.sh










