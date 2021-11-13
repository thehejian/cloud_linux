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

















