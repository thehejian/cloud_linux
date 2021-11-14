#!/bin/bash
檔案類型
-e	該『檔名』是否存在？(常用)
-f	該『檔名』是否存在且為檔案(file)？(常用)
-d	該『檔名』是否存在且為目錄(directory)？(常用)
-b	該『檔名』是否存在且為一個 block device 裝置？
-c	該『檔名』是否存在且為一個 character device 裝置？
-S	該『檔名』是否存在且為一個 Socket 檔案？
-p	該『檔名』是否存在且為一個 FIFO (pipe) 檔案？
-L	該『檔名』是否存在且為一個連結檔？

檔案權限
-r	偵測該檔名是否存在且具有『可讀』的權限？
-w	偵測該檔名是否存在且具有『可寫』的權限？
-x	偵測該檔名是否存在且具有『可執行』的權限？
-u	偵測該檔名是否存在且具有『SUID』的屬性？
-g	偵測該檔名是否存在且具有『SGID』的屬性？
-k	偵測該檔名是否存在且具有『Sticky bit』的屬性？
-s	偵測該檔名是否存在且為『非空白檔案』？

檔案之間比較
-nt	(newer than)判斷 file1 是否比 file2 新
-ot	(older than)判斷 file1 是否比 file2 舊
-ef	判斷 file1 與 file2 是否為同一檔案，可用在判斷 hard link 的判定上。 主要意義在判定，兩個檔案是否均指向同一個 inode 哩！

整數判定
#########################这些玩意儿只能进行整数判断，涉及字符串时，必须使用==这些
-eq	兩數值相等 (equal)
-ne	兩數值不等 (not equal)
-gt	n1 大於 n2 (greater than)
-lt	n1 小於 n2 (less than)
-ge	n1 大於等於 n2 (greater than or equal)
-le	n1 小於等於 n2 (less than or equal)

字串的判断
test -z string	判定字串是否為 0 ？若 string 為空字串，則為 true
test -n string	判定字串是否非為 0 ？若 string 為空字串，則為 false。
註： -n 亦可省略
test str1 == str2	判定 str1 是否等於 str2 ，若相等，則回傳 true
test str1 != str2	判定 str1 是否不等於 str2 ，若相等，則回傳 false

多重條件
-a	(and)兩狀況同時成立！例如 test -r file -a -x file，則 file 同時具有 r 與 x 權限時，才回傳 true。
-o	(or)兩狀況任何一個成立！例如 test -r file -o -x file，則 file 具有 r 或 x 權限時，就可回傳 true。
!	反相狀態，如 test ! -x file ，當 file 不具有 x 時，回傳 true

变量的参数
$# ：    代表後接的參數『個數』，以上表為例這裡顯示為『 4 』；
"$@" ：  代表『 "$1" "$2" "$3" "$4" 』之意，每個變數是獨立的(用雙引號括起來)；
"$*" ：  代表『 "$1c$2c$3c$4" 』，其中 c 為分隔字元，預設為空白鍵， 所以本例中代表『 "$1 $2 $3 $4" 』之意。
$0:      代表的是文档的名称

test -e /etc && echo 1 || echo 0

cat > 114test_file.sh << "eof"
#!/bin/bash
# 1. 讓使用者輸入檔名，並且判斷使用者是否真的有輸入字串？
read -p "请输入文件名称" filename
test -z "$filename" && exit 0
# 2. 判斷檔案是否存在？若不存在則顯示訊息並結束腳本
test ! -e "$filename" && echo "文件不存在哈" && exit 0
# 3. 開始判斷檔案類型與屬性
test -r "$filename" && fileperm="可读"
test -w "$filename" && fileperm="可修改"
test -x "$filename" && fileperm="可执行"

test -f "$filename" && filetype="这是个普通文件"
test -d "$filename" && filetype="这是个文件夹"
# 4. 開始輸出資訊！
echo -e "$filename的文件类型是$filetype \n$filename的权限是$fileperm"
#-e代表支持\n等
eof
bash 114test_file.sh

###################################################——》中括号
在中括號 [] 內的每個元件都需要有空白鍵來分隔；
在中括號內的變數，最好都以雙引號括號起來；
在中括號內的常數，最好都以單或雙引號括號起來。

############################################——》显示文件
cat > 114cmd.sh << "eof"
#當執行一個程式的時候，這個程式會讓使用者選擇 Y 或 N ，
read -p "请输入是否执行y or n " mycmd
#如果使用者輸入 Y 或 y 時，就顯示『 OK, continue 』
[ "$mycmd" == "Y" -o "$mycmd" == "y" ] && echo -e "OK, continue\n"
#这里不能用-eq，不知道什么原因；-eq只能用于整数，不能用于
#如果使用者輸入 n 或 N 時，就顯示『 Oh, interrupt ！』
[ "$mycmd" == "N" -o "$mycmd" == "n" ] && echo -e "Oh, interrupt ！\n"
#如果不是 Y/y/N/n 之內的其他字元，就顯示『 I don't know what your choice is 』
#[ "$mycmd" != "Y" -o "$mycmd" != "y"  -o "$mycmd" != "N" -o "$mycmd" != "n" ] && echo -e "I don't know what your choice is\n"
echo -e "I don't know what your choice is\n"
eof
bash 114cmd.sh

file /etc/init.d/network 
#/etc/init.d/network: Bourne-Again shell script, ASCII text executable

#################################################——》参数判断
cat > 114args.sh << "eof"
#!/bin/bash
#程式的檔名為何？
echo -e "\n文档名称为$0\n"
#共有幾個參數？
echo -e "共有参数$#个\n"
#若參數的個數小於 2 則告知使用者參數數量太少
[ $# -lt 2 ] && echo -e "参数太少，只有$#个\n"
#全部的參數內容為何？
echo -e "全部参数为$@\n"
#第一個參數為何？
echo -e "第一个参数为$1\n"
#第二個參數為何
echo -e "第二个参数为$2\n"
eof
bash 114args.sh a 

#################################################——》参数偏移shift
cat > 114.shift.sh << "eof"
#!/bin/bash
echo -e "\n原本，参数\t\t $@ \n"
shift
echo -e "第一次偏移，参数\t $@ \n"
shift
echo -e "第二次偏移，参数\t $@ \n"
eof
bash 114.shift.sh 1 2 3 4 5 6



