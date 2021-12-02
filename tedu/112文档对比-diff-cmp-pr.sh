#!/bin/bash
diff [-bBi] from-file to-file
選項與參數：
from-file ：一個檔名，作為原始比對檔案的檔名；
to-file   ：一個檔名，作為目的比對檔案的檔名；
注意，from-file 或 to-file 可以 - 取代，那個 - 代表『Standard input』之意。

-b  ：忽略一行當中，僅有多個空白的差異(例如 "about me" 與 "about     me" 視為相同
-B  ：忽略空白行的差異。
-i  ：忽略大小寫的不同。

cat /etc/passwd | sed -e '4d' -e '6c no six' > 112diff_passwd.txt 
cp /etc/passwd 112diff_passwd_old.txt

diff 112diff_passwd_old.txt 112diff_passwd.txt 
4d3
#左邊第四行被刪除 (d) 掉了，基準是右邊的第三行
< adm:x:3:4:adm:/var/adm:/sbin/nologin
#這邊列出左邊(<)檔案被刪除的那一行內容
6c5
#左边第6行被替换，基准是右边第5行
< sync:x:5:0:sync:/sbin:/bin/sync
#左邊(<)檔案第六行內容
---
> no six
#<==右邊(>)檔案第五行內容

diff /etc/init.d/ /etc/iscsi/
#也可以对比文件夹
Only in /etc/init.d/: functions
Only in /etc/iscsi/: initiatorname.iscsi
Only in /etc/iscsi/: iscsid.conf
Only in /etc/init.d/: netconsole
Only in /etc/init.d/: network
Only in /etc/init.d/: README

#####################################################——》cmp
cmp [-l] file1 file2
選項與參數：
-l  ：將所有的不同點的位元組處都列出來。因為 cmp 預設僅會輸出第一個發現的不同點。

範例一：用 cmp 比較一下 passwd.old 及 passwd.new
[dmtsai@study testpw]$ cmp passwd.old passwd.new
passwd.old passwd.new differ: char 106, line 4
#第一個發現的不同點在第四行，而且位元組數是在第 106 個位元組處

cmp -l 112diff_passwd_old.txt 112diff_passwd.txt
#列出全部不同

##################################################——》pr
pr /etc/man_db.conf


2014-06-10 05:35                 /etc/man_db.conf                 Page 1


#
#
# This file is used by the man-db package to configure the man and cat paths.
# It is also used to provide a manpath for those without one by examining
# configure script.























