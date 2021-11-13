#!/bin/bash
awk '條件類型1{動作1} 條件類型2{動作2} ...' filename
NF	每一行 ($0) 擁有的欄位總數                ——》有多少列
NR	目前 awk 所處理的是『第幾行』資料         ——》有多少行
FS	目前的分隔字元，預設是空白鍵              ——》分割符
####################################################################
#awk 的指令間隔：所有 awk 的動作，亦即在 {} 內的動作，如果有需要多個指令輔助時，可利用分號『;』間隔， 或者直接以 [Enter] 按鍵來隔開每個指令
#邏輯運算當中，如果是『等於』的情況，則務必使用兩個等號『==』！
#格式化輸出時，在 printf 的格式設定當中，務必加上 \n ，才能進行分行！
####與 bash shell 的變數不同，在 awk 當中，變數可以直接使用，不需加上 $ 符號。

last -n 5 | grep -Ev "^$|wtmp" | awk '{print $1"\t"$3}'
last -n 5 | grep -Ev "^$|wtmp" | awk '{print "第"NR"行""\t" $1,$3}'
last -n 5 | grep -Ev "^$|wtmp" | awk '{print "第"NR"行""\t" $1FS$3}'

last -n 5 | grep -Ev "^$|wtmp" | awk '{print "第"NR"行""\t" $1FS$3 "\t" "共分割"NF"块" "\t" "分割符 是(默认为空格)"FS}'

cat /etc/passwd | awk -F ":" '$3<10{print $1,$3}'
cat /etc/passwd | awk '{FS=":"}$3<10{print $1,$3}'
#'$3<10{print $1,$3} 不能加 //;这个是代表找到某一行
#区别-F是所有awk都用；放里面是只有这一个循环用；
#-F 变成：，后面输出时的逗号依旧代表的是默认的FS为空格

cat > 110awk.txt << "eof"
Name    1st     2nd     3th
VBird   23000   24000   25000
DMTsai  21000   20000   23000
Bird2   43000   42000   41000
eof
cat 110awk.txt

cat 110awk.txt | awk 'NR==1{print $1"\t" $2"\t" $3"\t" $4"\t" "total"}\
NR>=2{total=$1+$2+$3+$4}\
NR>=2{print $1"\t" $2"\t" $3"\t" $4"\t" total}'

cat 110awk.txt | 
awk 'NR==1{printf "%10s %10s %10s %10s %10s\n",$1,$2,$3,$4,"total"}
NR>=2{total = $2 + $3 + $4
printf "%10s %10d %10d %10d %10.2f\n", $1, $2, $3, $4, total}'
#千万不能放\


cat 110awk.txt | 
awk 'NR==1{printf "%10s %10s %10s %10s %10s\n",$1,$2,$3,$4,"Total" }
NR>=2{total = $2 + $3 + $4
printf "%10s %10d %10d %10d %10.2f\n", $1, $2, $3, $4, total}'

cat 110awk.txt |
awk 'NR==1{printf "%10s %10s %10s %10s %10s\n" ,$1,$2,$3,$4,"total"}
NR>=2{total=$2+$3+$4
printf "%10s %10d %10d %10d %10.2f\n" ,$1,$2,$3,$4,total}'






