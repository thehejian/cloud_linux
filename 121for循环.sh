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

