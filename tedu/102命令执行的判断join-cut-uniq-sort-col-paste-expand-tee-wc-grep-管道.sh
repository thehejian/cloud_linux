#!/bin/bash
cmd;cmd
#不考虑相关性的连续执行
#sync; sync; shutdown -h now

cmd1 && cmd2
#当#?为0（执行成功），才执行cmd2

cmd1 || cmd3
#当#?不为0（执行失败），才执行cmd2

#管道命令
#管道命令仅会处理标准输出，对于标准错误输出会与易忽略
#管道命令必须要能够接受来自前一个命令的的数据成为标准输入继续处理才行

######################################——》cut
path=$PATH
echo "$path" | cut -d ":" -f 5,12
-d 分隔符
-f 取第几个
#使用类似 echo "$path" | awk -F [:] '{print $5}'
#echo "$path" | awk -F ":" '{print $5}'

export | cut -c 12-
#-c 12- 取第12个字串之后的所有，包含第12字串

export | cut -c 12-20
#取12-20字串

######################################——》grep
echo "$path" | grep -o "bin" -i 
#-E --extended-regexp 扩展的正则表达式
#-i 忽略文件中的大小写区别
#-v 反转匹配感，选择不匹配的行
#-n 输出行号；在其输入文件中使用从 1 开始的行号为每一行输出添加前缀
#-o --only-matching 只打印匹配行的匹配（非空）部分，每个这样的部分在单独的输出行上

######################################——》排序 sort wc uniq
sort 
#-f 忽略大小写的差异，例如A 与a 视为编码相同
#-b --ignore-leading-blanks忽略前导空格
#-M  --month-sort 月份排序
#-n 使用『纯数字』进行排序(预设是以文字型态来排序的)
#-r 反向排序
#-u 就是uniq ，相同的资料中，仅出现一行代表
#-t 分隔符号，预设是用[tab] 键来分隔
#-k 以那个区间(field) 来进行排序的意思

cat /etc/passwd | sort -t ":" -k 3 -n
#以：为分割，第3块，按照数字排序
#cat /etc/passwd | awk -F ":" '{print $3}' | sort -n
#这个不行啊，只能实现显示内容的排序啊

last | cut -d " " -f 1 | sort
#-d 分隔符
#-f 取第几个

last | cut -d " " -f 1 | uniq -c | sort -r -n
#cut -d " " -f 1 以空格作为间隔，取第1个
#uniq不显示重复的 -c并计数
#sort -r -n 倒叙，按数字排序

cat /var/log/secure | awk -F "]:" '/Failed password/{print $2}' | awk -F "from" '{print $2}' | awk '{print $1}' | uniq -c | sort -n
#密码错误的ssh登录IP

########################——》wc
#########################################################——》wc
#-l  ：僅列出行；
#-w  ：僅列出多少字(英文單字)；
#-m  ：多少字元；

last | grep [a-zA-Z0-9] | egrep -v "wtmp|reboot|unknown" | wc -l
#157
#grep [a-zA-Z0-9]去掉空白行
######################################——》双向重导向

last | tee last.txt | cut -d " " -f 1
#输出文件，并屏幕显示
#屏幕显示的内容继续执行，保存的文件不改变

#####################################——》字符串转换命令tr col join paste expend
tr [-ds] SET1 ...
選項與參數：
-d  ：刪除訊息當中的 SET1 這個字串；
-s  ：取代掉重複的字元！

last | tr [a-z] [A-Z]
cat /etc/passwd | tr -d ":"
#删除所有：

ol [-xb]
選項與參數：
-x  ：將 tab 鍵轉換成對等的空白鍵
cat -A /etc/man_db.conf 
cat /etc/man_db.conf | col -x | cat -A | more

#########################################################——》join [-ti12] file1 file2
選項與參數：
-t  ：join 預設以空白字元分隔資料，並且比對『第一個欄位』的資料，
      如果兩個檔案相同，則將兩筆資料聯成一行，且第一個欄位放在第一個！
-i  ：忽略大小寫的差異；
-1  ：這個是數字的 1 ，代表『第一個檔案要用那個欄位來分析』的意思；
-2  ：代表『第二個檔案要用那個欄位來分析』的意思。

head -n 3 /etc/passwd /etc/shadow
/etc/passwd /etc/shadow | head -n 3
#冒号分割，相同的隐藏
join -t ':' /etc/passwd /etc/shadow | head -n 3 | awk -F ":" '{print $1,$8}'
#只看用户名和密码
join -t ':' -1 4 /etc/passwd -2 3 /etc/group | head -n 3
#-t ':' 以：分割
#-1 4 /etc/passwd 分析第一个文件的第四位
#-2 3 /etc/group 分析第二个文件的第三位
join -t ':' -1 4 /etc/passwd -2 3 /etc/group | head -n 3 | awk -F ":" '{print $8,$1}'
#显示用户名和UID
join -t ':' -1 4 /etc/passwd -2 3 /etc/group | head -n 3 | awk -F ":" '{print $8,$1}'

#########################################################——》paste
paste [-d] file1 file2
選項與參數：
-d  ：後面可以接分隔字元。預設是以 [tab] 來分隔的！
-   ：如果 file 部分寫成 - ，表示來自 standard input 的資料的意思。
paste -d ":" /etc/passwd /etc/shadow | head -n 3
#root:x:0:0:root:/root:/bin/bash:root:$6$dnKRK5s9yINu5IFT$EN8wAeyzbGwFqH8kFnJFevwGahgP4Hyp2CFoM9eRlGLwIR1xLyp/.dVtahsRDI.b.V4Gp6L6J0BihKDU6CNO90::0:99999:7:::

#########################################################——》expand
expand [-t] file
選項與參數：
-t  ：後面可以接數字。一般來說，一個 tab 按鍵可以用 8 個空白鍵取代。
      我們也可以自行定義一個 [tab] 按鍵代表多少個字元呢！
grep "^MANPATH" /etc/man_db.conf | head -n 3 | cat -A
#MANPATH_MAP^I/bin^I^I^I/usr/share/man$
#有tab展示成^I
grep "^MANPATH" /etc/man_db.conf | head -n 3 | expand -t 9 | cat -A
MANPATH_MAP       /bin                       /usr/share/man$
#没有tab的展示，把tab转换为空格了

#########################################################——》分割，split
split [-bl] file PREFIX
選項與參數：
-b  ：後面可接欲分割成的檔案大小，可加單位，例如 b, k, m 等；
-l  ：以行數來進行分割。
PREFIX ：代表前置字元的意思，可作為分割檔案的前導文字。

split -b 300k services service_split_
#分割成300k的文件
ls service_split_*
#service_split_aa  service_split_ab  service_split_ac

cat service_split_* >> new_service
#将3个新文件进行合并

ls -al / | split -l 10 - lsroot
#查看根目录，并每隔10行分割，并创建新文件

wc -l lsroot*
#  10 lsrootaa
#  10 lsrootab
#  10 lsrootac
#   3 lsrootad
#  33 total
###################################——》参数代换，xargs
#作用：解决不支持管道的命令
#
xargs [-0epn] command
#x 乘号；args arguments（参数）
選項與參數：
-0  ：如果輸入的 stdin 含有特殊字元，例如 `, \, 空白鍵等等字元時，這個 -0 參數
      可以將他還原成一般字元。這個參數可以用於特殊狀態喔！
-e  ：這個是 EOF (end of file) 的意思。後面可以接一個字串，當 xargs 分析到這個字串時，
      就會停止繼續工作！
-p  ：在執行每個指令的 argument 時，都會詢問使用者的意思；
-n  ：後面接次數，每次 command 指令執行時，要使用幾個參數的意思。

id $(cut -d ":" -f 1 /etc/passwd | head -3)
#id: extra operand ‘bin’
#报错，无法看 UID和GID
#id不支持多个参数

cut -d ":" -f 1 /etc/passwd | head -3 | id
#uid=0(root) gid=0(root) groups=0(root)
#id不是管道命令，不支持这样书写

cut -d ":" -f 1 /etc/passwd | head -n 3 | xargs id
#id: extra operand ‘bin’
#报错，id不支持多个参数的执行

head -n 3 /etc/passwd | cut -d ":" -f 1 | xargs -n 1 id
#uid=0(root) gid=0(root) groups=0(root)
#uid=1(bin) gid=1(bin) groups=1(bin)
#uid=2(daemon) gid=2(daemon) groups=2(daemon)
#正确，每次执行一个参数分三次执行
head -n 3 /etc/passwd | awk -F ":" '{print $1}' | xargs -n 1 id
#正确，同上
head -n 3 /etc/passwd | awk -F ":" '{print $1}' | xargs -n 1 -p id
#正确，-p 没步骤都询问
#id root ?...y
id bin ?...uid=0(root) gid=0(root) groups=0(root)
y
uid=1(bin) gid=1(bin) groups=1(bin)
id daemon ?...y
uid=2(daemon) gid=2(daemon) groups=2(daemon)

head /etc/passwd | cut -d ":" -f 1 | xargs -n 1 -e"sync" id
#执行到 sync就不执行，sync行不会被执行
#-e"sync 之间不能有空格


#################################——》关于减号
tar -cvf - /home | tar -xvf - -C /tmp/homeback
#把/home打包 提取到新目录到新目录
#-减号代表管道前面的输出
-c, --create 创建新存档
-v, --verbose 详细列出已处理的文件
-f, --file=ARCHIVE 使用归档文件或设备 ARCHIVE
-cvf 打包新文件
-x, --extract, --get 从存档中提取文件
-xvf 提取文件
-C, --directory=DIR 切换到目录 DIR
      
   



