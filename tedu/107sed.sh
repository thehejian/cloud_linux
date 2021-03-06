#!/bin/bash
#sed 不要用双引号，单引号中有特殊字符用\转义
#用双引号会莫名其妙引入变量
#遇到单引号套单引号，换成其他符号比如~，（这个~符号基本不用）后面再整体换的；
 
sed [-nefr] [動作]
選項與參數：
-n  ：只显示處理的那一行(或者動作)才會被列出來。默认是显示全部再加处理的那一行
-e  ：直接在指令列模式上進行 sed 的動作編輯；
-f  ：直接將 sed 的動作寫在一個檔案內， -f filename 則可以執行 filename 內的 sed 動作；
-r  ：sed 的動作支援的是延伸型正規表示法的語法。(預設是基礎正規表示法語法)
-i  ：直接修改讀取的檔案內容，而不是由螢幕輸出。

動作說明：  [n1[,n2]]function
n1, n2 ：不見得會存在，一般代表『選擇進行動作的行數』，舉例來說，如果我的動作
         是需要在 10 到 20 行之間進行的，則『 10,20[動作行為] 』
         
function 有底下這些咚咚：
a   ：新增， a 的後面可以接字串，而這些字串會在新的一行出現(目前的下一行)～
i   ：插入， i 的後面可以接字串，而這些字串會在新的一行出現(目前的上一行)；
c   ：取代， c 的後面可以接字串，這些字串可以取代 n1,n2 之間的行！
d   ：刪除，因為是刪除啊，所以 d 後面通常不接任何咚咚；
p   ：列印，亦即將某個選擇的資料印出。通常 p 會與參數 sed -n 一起運作～
s   ：取代，可以直接進行取代的工作哩！通常這個 s 的動作可以搭配正規表示法！
      例如 1,20s/old/new/g 就是啦！ 
############################################——》显示某些行
nl /etc/passwd | sed  '2,5p'
#显示2,5行和全部
#显示的是原先的序号
nl /etc/passwd | sed -n '2,5p'
#只显示2,5行
###########################################——》删除行
nl /etc/passwd | sed '2,5d'
#删除2,5行，显示其他
##########################################——》在行后加内容
nl 105regular_express.txt | sed '2a 12345\
789'
#规范写法，第一行有 'XXX ；最后一行有XXX'
##########################################——》整行替换
nl 105regular_express.txt | sed '1,26c 12345\
789'
#1,26行被整个替换

#########################################——》子串替换
sed 's/要被取代的字串/新的字串/g'
ifconfig eth0 | grep "inet " | sed 's/^.*inet//g' | sed 's/netmask.*$//g'
#ifconfig eth0 | grep "inet " | sed 's/^.*inet//g' | sed 's/netmask*$//g'
#底下这个代表netmask出现0次及以上;会显示全部内容
#netmask.*代表netmask出现1次及以上

ifconfig eth0 | grep "inet " | sed 's/^.*inet //g' | sed 's/netmask.*$//g'

ifconfig eth0 | grep "inet " | awk -F " " '{print $2}'

myip=$(ifconfig eth0 | grep "inet ")
echo "${myip%%netmask*255}" | sed 's/[[a-z]]*//g' | sed 's/[[:blank:]]//g'
#%%变量字符串中没有^$没有首字母和结尾字母，这玩意儿只能正则用

ifconfig eth0 | grep "inet " | sed 's/.*inet//g' | sed 's/netmask.*//g' | sed 's/[[:blank:]]//g'
#ifconfig eth0 | grep "inet " | sed 's/^.*inet//g' | sed 's/netmask.*$//g' | sed 's/[[:blank:]]//g'
#这种场景$和^好像可以省略掉

cat /etc/man_db.conf | grep "MAN" | grep -v "^#"
cat /etc/man_db.conf | grep "MAN" | sed 's/^#//g'

cat /etc/man_db.conf | grep "MAN" | grep -v '#.*'
cat /etc/man_db.conf | grep "MAN" | sed 's/#.*//g'
cat /etc/man_db.conf | grep "MAN" | sed 's/#.*//g' | sed '/^$/d'
cat /etc/man_db.conf | grep "MAN" | sed '/#.*/d'


cat /etc/man_db.conf | sed -n '/MAN/p' | sed '/^#/d'
cat /etc/man_db.conf | grep "MAN" | grep -v "^#"

tail -n 8 105regular_express.txt | sed 's/./!/g'
#不是想要的结果，这个.代表所以字符，会把所以内容改成！
tail -n 8 105regular_express.txt | sed 's/.$/!/g'
#不是想要的内容，会把所有结尾的内容改成!
tail -n 8 105regular_express.txt | sed 's/$/!/g'
#不是想要的内容，会给所有结尾额外再加！

tail -n 8 105regular_express.txt | sed 's/\./!/g'
#转义后代表把所有的.换成！，不管是不是结尾
tail -n 8 105regular_express.txt | sed 's/.$/!/g'
#代表只替换结尾处的.

sed '$a 98764554' 105regular_express.txt
#sed '^i 98764554' 105regular_express.txt
#首行木有，就是1
sed '1i 98764554' 105regular_express.txt

















