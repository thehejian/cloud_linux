#!/bin/bash
for var in con1 con2 con3 ...
do
	程式段
done
#第一次迴圈時， $var 的內容為 con1 ；
#第二次迴圈時， $var 的內容為 con2 ；

####——》for的第二种写法
for (( 初始值; 限制值; 執行步階 ))
do
	程式段
done
#初始值：某個變數在迴圈當中的起始值，直接以類似 i=1 設定好；
#限制值：當變數的值在這個限制值的範圍內，就繼續進行迴圈。例如 i<=100；
#執行步階：每作一次迴圈時，變數的變化量。例如 i=i+1。

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

######################################——》找权限
cat > 121_ll.sh << "eof"
#!/bin/bash
#使用者輸入某個目錄檔名， 然後我找出某目錄內的檔名的權限
read -p "请输入路径，像/etc " mypath
[ -z "$mypath" -o  ! -d "$mypath" ] && echo -e "\n滚，你丫没输入,bash $0"
#! -d不是目录
myls=$(ls -a "$mypath" 2> /dev/null)
#错误的输入不显示
for i in $myls
do
	perm=""
	#不停循环中，得把perm变量每次先清空，不然就会变成金字塔；
	[ -r "$mypath"/"$i" ] && perm="$perm读 "
	[ -w "$mypath"/"$i" ] && perm="$perm写 "
	[ -x "$mypath"/"$i" ] && perm="$perm执行 "
	echo -e "$mypath/$i拥有\t$perm 权限"
done
eof
bash 121_ll.sh

##################################################################——》找权限2.0
cat > 121_ll2.0.sh << "eof"
#!/bin/bash
read -p "Please input a directory: " dir
if [ "${dir}" == "" -o ! -d "${dir}" ]; then
	echo "The ${dir} is NOT exist in your system."
	exit 1
fi

# 2. 開始測試檔案囉～
filelist=$(ls ${dir})        # 列出所有在該目錄下的檔案名稱
for filename in ${filelist}
do
	perm=""
	test -r "${dir}/${filename}" && perm="${perm} readable"
	test -w "${dir}/${filename}" && perm="${perm} writable"
	test -x "${dir}/${filename}" && perm="${perm} executable"
	echo "The file ${dir}/${filename}'s permission is ${perm} "
done
eof
bash 121_ll2.0.sh

###################################################################——》1+n
cat > 121_for_jia.sh << "eof"
#!/bin/bash
for ((i=1; i<=100; i++))
do
	s=$((s+i));
done
echo -e "\n1加到100等于 $s"
eof
bash 121_for_jia.sh



















