#！/bin/bash

dmtsai: $6 $M4IphgNP2TmlXaSS$B418YFroYxxmm ....:16559:5:60:7:5:16679:
这表示存在？ 先要注意的是 16559 是 2015/05/04 。所以 dmtsai 这个用户的密码相关含义是：

因为密码几乎不能单向计算（由明码密码，无法由密码反回密码计算），因此由上表的数据我们无法推算推导密码精确的密码明文（第二个栏位）；

这个你最近一次更动密码的日期是2015/05/04 (16559)；

再次修改密码的时间是5天以后，就是2015/05/09 以前dmtsai不能修改自己的密码；如果用户还是尝试更动的密码，系统也会出现这样的自己的信息：
您必须等待更长时间才能更改密码
passwd：身份验证令牌操作错误
中告诉我们：你必须要等待更久的时间才能够改变画面密码之意啦！

由于密码到期日期定义为 60 天后，亦即累计日代表数为： 16559+60=16619，经过计算得出此日数日期为 2015/07/03。 这表示：『用户必须在 2015/05 /09（前 5 天不能改）到 2015/07/03 之间的 60 天限制内去修改自己的密码，若 2015/07/03 还是没有变更密码时，该密码就通知过期了！

警告日期设为 7 天，亦即是密码过期的 7 天，在本例中则代表 2015/06/26 ~ 2015/07/03 这七天。如果用户一直没有更改密码，那么在这 7 天中，只要dmtsai登入系统就会发现如下消息：
警告：您的密码将在5 天后过期

如果该你已经到了 2015/07/03 都没有更改密码，那么密码就过期了。因为宽有天的限天数，所以 dmtsai 2015/07/08 前还可以使用旧密码登入。主机登入。时会出现强制更改密码的情况，画面有点像底下这样：
您需要立即更改密码（密码已过期）
警告：您的密码已过期。
您必须立即更改密码并重新登录！
更改密码的用户dmtsai。
更改密码为dmtsai
（当前）UNIX 密码：
如果你在 2015/07/08 以后尝试以 dmtsai 登入的话，那么就会出现如下的错误信息且无法使用系统的各项资源。登入，因为此时你的密码就失效啦！
您的帐户已过期；请联系您的系统管理员

如果用户在2015/07/03之前修改密码过了，那么第3个栏位的那个16559的天数就会跟着改变，所以，所有的限制日期也会跟着变动喔！^_^

用户如何动作，到了16679（大约是2015/09/01左右）该账号就失效了～

＃ ################################################# ############################################### #####
管理员：$1$5 f4EKtje $bA96TdSL3X3SSmgD .8Iho.:18951:0:99999:7:::
#第三栏
# mydate=$(date --date=2021/11/20 +%s)
# echo $((mydate/60/60/24+1))
# 18951
#第四位
#密码不可被更动的天数：(与第3名栏位相比)
#个场位记录了：这个第四个密码在最近一次被更改后还需要经过几天才能再被改变！如果是0的话，随时可以显示密码的英文。
#第五位
#密码位需要修改的天数：（与第3个栏相比）
#指定在最近一次更改密码后，在多少天数内需要重新更改这个密码才行。像上面的 9999（计算为 273 年）的话，一起表示，呵呵，密码的变更没有强制之意
#第六位
#密码需要更改期限前的警告天数：(与第5栏相比位)
#当你的密码有效期限快要到的时候（第5个栏位），系统会参考这个栏位的设定，发出『警告』给这个用户，提醒他『再过n你的密码过期了』 ，请尽快设定你的密码！』，如上面的例子，则是天之密码之内的7个，系统会警告该用户。
#第七位
#密码过期后的用户宽限时间（密码失效日）：（与第5名栏位相比）
#密码有效日期为『更新日期(第3栏位)』+『修改日期(第3栏位)』，过了该有效期后用户还没有更新密码，那该密码有效日期过了。该密码你还可以进行其他工作，包括登入系统获得重击。如果你一旦登录密码过期了，那当你进入系统时，系统会强制要求你必须重装密码才能登入继续使用，就是日期特性。
#第八位
#你失效日期：
#这个日期跟第三个栏位一样，都是1970年以来的总日数设定。 这个栏位表示：这个你在这个栏位规定的日期，以后将无法再使用就是『失败了』 』，这时候那个你的密码是否已经过期，『！』你的账户位都可以再使用，应该是在『收费服务』的系统中，你通常不能再指定一个日期让该账户再使用使用啦！
#第九位
#保留：
#一个栏位是剩余的，看以后有没有新功能加入。

#########################################################################################
authconfig --test | grep hash
#password hashing algorithm is md5
#加密方式位md5

##########################################################################################
#群组
群組名稱：
就是群組名稱啦！同樣用來給人類使用的，基本上需要與第三欄位的 GID 對應。

群組密碼：
通常不需要設定，這個設定通常是給『群組管理員』使用的，目前很少有這個機會設定群組管理員啦！ 同樣的，密碼已經移動到 /etc/gshadow 去，因此這個欄位只會存在一個『x』而已；

GID：
就是群組的 ID 啊。我們 /etc/passwd 第四個欄位使用的 GID 對應的群組名，就是由這裡對應出來的！

此群組支援的帳號名稱：
我們知道一個帳號可以加入多個群組，那某個帳號想要加入此群組時，將該帳號填入這個欄位即可。 舉例來說，如果我想要讓 dmtsai 與 alex 也加入 root 這個群組，那麼在第一行的最後面加上『dmtsai,alex』，注意不要有空格， 使成為『 root:x:0:dmtsai,alex 』就可以囉～

useradd -u 1002 -g hejian hejian
ll -d /home/hejian
#drwx------ 2 hejian hejian 4096 Oct 31 11:33 /home/hejian
grep hejian /etc/passwd /etc/shadow /etc/group
/etc/passwd:hejian:x:1002:1002::/home/hejian:/bin/bash
/etc/shadow:hejian:$1$6/OFk1bK$DE8tXOW5o8iAc1Gg7wVCD.:18931:0:99999:7:::
/etc/group:hejian:x:1002:

##################################################################——》创建系统账号
useradd -r hejian_r
#不会主动创建家目录
ll -d /home/hejian_r
ls: cannot access /home/hejian_r: No such file or directory
grep hejian_r /etc/passwd /etc/shadow /etc/group
/etc/passwd:hejian_r:x:991:989::/home/hejian_r:/bin/bash
/etc/shadow:hejian_r:!!:18952::::::
/etc/group:hejian_r:x:989:

useradd -D
GROUP=100 <==預設的群組
HOME=/home  <==預設的家目錄所在目錄
INACTIVE=-1 <==密碼失效日，在 shadow 內的第 7 欄
EXPIRE= <==帳號失效日，在 shadow 內的第 8 欄
#你可以直接設定帳號在哪個日期後就直接失效，而不理會密碼的問題。 通常不會設定此項目，但如果是付費的會員制系統，或許這個欄位可以設定喔！
#grep root /etc/shadow
#root:$1$YDGwpJct$OdStASaZVjqoyDk2L2EOO.:18892:0:99999:7:::
SHELL=/bin/bash <==預設的 shell
SKEL=/etc/skel  <==使用者家目錄的內容資料參考目錄
CREATE_MAIL_SPOOL=yes <==是否主動幫使用者建立郵件信箱(mailbox)
#ll /var/spool/mail/

egrep -v "^#|^$" /etc/login.defs
MAIL_DIR	/var/spool/mail <==使用者預設郵件信箱放置目錄
PASS_MAX_DAYS	99999   <==/etc/shadow 內的第 5 欄，多久需變更密碼日數
PASS_MIN_DAYS	0       <==/etc/shadow 內的第 4 欄，多久不可重新設定密碼日數
PASS_MIN_LEN    8       <==密碼最短的字元長度，已被 pam 模組取代，失去效用！
PASS_WARN_AGE	7       <==/etc/shadow 內的第 6 欄，過期前會警告的日數
UID_MIN                  1000   <==使用者最小的 UID，意即小於 1000 的 UID 為系統保留
UID_MAX                 60000    <==使用者能夠用的最大 UID
SYS_UID_MIN               201   <==保留給使用者自行設定的系統帳號最小值 UID
SYS_UID_MAX               999    <==保留給使用者自行設定的系統帳號最大值 UID
GID_MIN                  1000   <==使用者自訂群組的最小 GID，小於 1000 為系統保留
GID_MAX                 60000   <==使用者自訂群組的最大 GID
SYS_GID_MIN               201   <==保留給使用者自行設定的系統帳號最小值 GID
SYS_GID_MAX               999   <==保留給使用者自行設定的系統帳號最大值 GID
CREATE_HOME	yes     <==在不加 -M 及 -m 時，是否主動建立使用者家目錄？
UMASK           077     <==使用者家目錄建立的 umask ，因此權限會是 700
USERGROUPS_ENAB yes     <==使用 userdel 刪除時，是否會刪除初始群組
ENCRYPT_METHOD MD5      <==密碼加密的機制
MD5_CRYPT_ENAB yes      

#等同
cat /etc/default/useradd 
# useradd defaults file
GROUP=100
HOME=/home
INACTIVE=-1
EXPIRE=
SHELL=/bin/bash
SKEL=/etc/skel
CREATE_MAIL_SPOOL=yes

useradd [-u UID] [-g 初始群組] [-G 次要群組] [-mM]\
>  [-c 說明欄] [-d 家目錄絕對路徑] [-s shell] 使用者帳號名
選項與參數：
-u  ：後面接的是 UID ，是一組數字。直接指定一個特定的 UID 給這個帳號；
-g  ：後面接的那個群組名稱就是我們上面提到的 initial group 啦～
      該群組的 GID 會被放置到 /etc/passwd 的第四個欄位內。
-G  ：後面接的群組名稱則是這個帳號還可以加入的群組。
      這個選項與參數會修改 /etc/group 內的相關資料喔！
-M  ：強制！不要建立使用者家目錄！(系統帳號預設值)
-m  ：強制！要建立使用者家目錄！(一般帳號預設值)
-c  ：這個就是 /etc/passwd 的第五欄的說明內容啦～可以隨便我們設定的啦～
-d  ：指定某個目錄成為家目錄，而不要使用預設值。務必使用絕對路徑！
-r  ：建立一個系統的帳號，這個帳號的 UID 會有限制 (參考 /etc/login.defs)
-s  ：後面接一個 shell ，若沒有指定則預設是 /bin/bash 的啦～
-e  ：後面接一個日期，格式為『YYYY-MM-DD』此項目可寫入 shadow 第八欄位，
      亦即帳號失效日的設定項目囉；
-f  ：後面接 shadow 的第七欄位項目，指定密碼是否會失效。0為立刻失效，
      -1 為永遠不失效(密碼只會過期而強制於登入時重新設定而已。)
#####################################################################################################——》passwd
 passwd [--stdin] [帳號名稱]  <==所有人均可使用來改自己的密碼
[root@study ~]# passwd [-l] [-u] [--stdin] [-S] \
>  [-n 日數] [-x 日數] [-w 日數] [-i 日數] 帳號 <==root 功能
選項與參數：
--stdin ：可以透過來自前一個管線的資料，作為密碼輸入，對 shell script 有幫助！
-l  ：是 Lock 的意思，會將 /etc/shadow 第二欄最前面加上 ! 使密碼失效；
-u  ：與 -l 相對，是 Unlock 的意思！
-S  ：列出密碼相關參數，亦即 shadow 檔案內的大部分資訊。
-n  ：後面接天數，shadow 的第 4 欄位，多久不可修改密碼天數
-x  ：後面接天數，shadow 的第 5 欄位，多久內必須要更動密碼
-w  ：後面接天數，shadow 的第 6 欄位，密碼過期前的警告天數
-i  ：後面接天數，shadow 的第 7 欄位，密碼失效天數


echo "123456" | passwd --stdin hejian
#Changing password for user hejian.
#passwd: all authentication tokens updated successfully.

passwd -S
passwd -S hejian
#hejian PS 2021-11-21 0 99999 7 -1 (Password set, MD5 crypt.)
# 上面說明密碼建立時間 (2021-11-21)、0 最小天數、99999 變更天數、7 警告日數與密碼不會失效 (-1)

#密碼使具有 60 天變更、密碼過期 10 天後帳號失效的設定
passwd -x 60 -i 10 hejian
#Adjusting aging data for user hejian.
#passwd: Success
passwd -S hejian
hejian PS 2021-11-21 0 60 7 10 (Password set, MD5 crypt.)
grep hejian /etc/shadow 
#hejian:$1$h405qXDy$1/B9s9Q2XGTN4OksKhZD91:18952:0:60:7:10::

passwd -l hejian
#Locking password for user hejian.
#passwd: Success
passwd -S hejian
#hejian LK 2021-11-21 0 60 7 10 (Password locked.)
#锁定，无法登陆

passwd -u hejian
#Unlocking password for user hejian.
#passwd: Success
passwd -S hejian
#hejian PS 2021-11-21 0 60 7 10 (Password set, MD5 crypt.)
#解锁，恢复登录

##########################################################################################################——》chage
chage [-ldEImMW] 帳號名
選項與參數：
-l ：列出該帳號的詳細密碼參數；
-d ：後面接日期，修改 shadow 第三欄位(最近一次更改密碼的日期)，格式 YYYY-MM-DD
-E ：後面接日期，修改 shadow 第八欄位(帳號失效日)，格式 YYYY-MM-DD
-I ：後面接天數，修改 shadow 第七欄位(密碼失效日期)
-m ：後面接天數，修改 shadow 第四欄位(密碼最短保留天數)
-M ：後面接天數，修改 shadow 第五欄位(密碼多久需要進行變更)
-W ：後面接天數，修改 shadow 第六欄位(密碼過期前警告日期)

chage -l hejian
Last password change					: Nov 21, 2021
Password expires					: Jan 20, 2022
Password inactive					: Jan 30, 2022
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 60
Number of days of warning before password expires	: 7

useradd hejian_chage
echo "123456" | passwd --stdin hejian_chage
#Changing password for user hejian_chage.
#passwd: all authentication tokens updated successfully.

chage -l hejian_chage 
Last password change					: Nov 21, 2021
Password expires					: never
Password inactive					: never
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 7

chage -d 0 hejian_chage
#把密码失效时间改为1970年，所有登录时，必须修改密码

chage -l hejian_chage
Last password change					: password must be changed
Password expires					: password must be changed
Password inactive					: password must be changed
Account expires						: never
Minimum number of days between password change		: 0
Maximum number of days between password change		: 99999
Number of days of warning before password expires	: 7

ssh hejian_chage@txy
hejian_chage@txy's password:
You are required to change your password immediately (root enforced)
Last login: Sun Nov 21 11:05:20 2021
WARNING: Your password has expired.
You must change your password now and login again!
Changing password for user hejian_chage.
Changing password for hejian_chage.
(current) UNIX password:
#修改完密码会被踢出，需要重新登录























