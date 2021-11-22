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

###########################################################################################################
usermod [-cdegGlsuLU] username
選項與參數：
-c  ：後面接帳號的說明，即 /etc/passwd 第五欄的說明欄，可以加入一些帳號的說明。
-d  ：後面接帳號的家目錄，即修改 /etc/passwd 的第六欄；
-e  ：後面接日期，格式是 YYYY-MM-DD 也就是在 /etc/shadow 內的第八個欄位資料啦！
-f  ：後面接天數，為 shadow 的第七欄位。
-g  ：後面接初始群組，修改 /etc/passwd 的第四個欄位，亦即是 GID 的欄位！
-G  ：後面接次要群組，修改這個使用者能夠支援的群組，修改的是 /etc/group 囉～
-a  ：與 -G 合用，可『增加次要群組的支援』而非『設定』喔！
-l  ：後面接帳號名稱。亦即是修改帳號名稱， /etc/passwd 的第一欄！
-s  ：後面接 Shell 的實際檔案，例如 /bin/bash 或 /bin/csh 等等。
-u  ：後面接 UID 數字啦！即 /etc/passwd 第三欄的資料；
-L  ：暫時將使用者的密碼凍結，讓他無法登入。其實僅改 /etc/shadow 的密碼欄。
-U  ：將 /etc/shadow 密碼欄的 ! 拿掉，解凍啦！

############################################################################################################
userdel [-r] username
選項與參數：
-r  ：連同使用者的家目錄也一起刪除

############################################################################################################
id [username]

############################################################################################################
df -hT /mnt
Filesystem     Type  Size  Used Avail Use% Mounted on
/dev/vda2      ext3  7.8G  5.8G  1.6G  79% /

finger [-s] username
選項與參數：
-s  ：僅列出使用者的帳號、全名、終端機代號與登入時間等等；
-m  ：列出與後面接的帳號相同者，而不是利用部分比對 (包括全名部分)

finger -s root
Login     Name       Tty      Idle  Login Time   Office     Office Phone   Host
root      root       pts/0          Nov 10 22:51                           (10.182.152.127)

finger root
Login: root           			Name: root
Directory: /root                    	Shell: /bin/bash
On since Wed Nov 10 22:51 (EST) on pts/0 from 10.182.152.127
   5 seconds idle
Mail last read Tue Jul 27 21:42 2021 (EDT)
No Plan.

Login：為使用者帳號，亦即 /etc/passwd 內的第一欄位；
Name：為全名，亦即 /etc/passwd 內的第五欄位(或稱為註解)；
Directory：就是家目錄了；
Shell：就是使用的 Shell 檔案所在；
Never logged in.：figner 還會調查使用者登入主機的情況喔！
No mail.：調查 /var/spool/mail 當中的信箱資料；
No Plan.：調查 ~vbird1/.plan 檔案，並將該檔案取出來說明！

echo "I will study Linux during this year." > ~/.plan
finger root

Login: root           			Name: root
Directory: /root                    	Shell: /bin/bash
On since Wed Nov 10 22:51 (EST) on pts/0 from 10.182.152.127
   1 second idle
Mail last read Tue Jul 27 21:42 2021 (EDT)
Plan:
I will study Linux during this year.
###################################################################################################################################
chfn
chfn [-foph] [帳號名]
選項與參數：
-f  ：後面接完整的大名；
-o  ：您辦公室的房間號碼；
-p  ：辦公室的電話號碼；
-h  ：家裡的電話號碼！

#chfn
Changing finger information for root.
Name [root]: root
Office []: huawei
Office Phone []: 123456
Home Phone []: 456123

Finger information changed.

#finger root
Login: root           			Name: root
Directory: /root                    	Shell: /bin/bash
Office: huawei, 123456			Home Phone: 456123
On since Wed Nov 10 22:51 (EST) on pts/0 from 10.182.152.127
Mail last read Tue Jul 27 21:42 2021 (EDT)
Plan:
I will study Linux during this year.

grep root /etc/passwd
root:x:0:0:root,huawei,123456,456123:/root:/bin/bash
operator:x:11:0:operator:/root:/sbin/nologin
dockerroot:x:996:991:Docker User:/var/lib/docker:/sbin/nologin

#########################################################################################################################
chsh
chsh [-ls]
選項與參數：
-l  ：列出目前系統上面可用的 shell ，其實就是 /etc/shells 的內容！
-s  ：設定修改自己的 Shell 囉

[root@host-162-166-94-62 html]# chsh -l
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash
[root@host-162-166-94-62 html]# cat /etc/shells 
/bin/sh
/bin/bash
/usr/bin/sh
/usr/bin/bash

#########################################################################################################################
群组
 groupadd [-g gid] [-r] 群組名稱
選項與參數：
-g  ：後面接某個特定的 GID ，用來直接給予某個 GID ～
-r  ：建立系統群組啦！與 /etc/login.defs 內的 GID_MIN 有關。

[root@host-162-166-94-62 html]# groupadd group_test
[root@host-162-166-94-62 html]# grep group_test /etc/group /etc/gshadow
/etc/group:group_test:x:1001:
/etc/gshadow:group_test:!::

groupmod [-g gid] [-n group_name] 群組名
選項與參數：
-g  ：修改既有的 GID 數字；
-n  ：修改既有的群組名稱
[root@host-162-166-94-62 html]# groupmod -g 201 -n mygroup group_test
[root@host-162-166-94-62 html]# grep mygroup /etc/group /etc/gshadow
/etc/group:mygroup:x:201:
/etc/gshadow:mygroup:!::

groupdel [groupname]
[root@host-162-166-94-62 html]# groupdel mygroup

###############################################################################################################################
# 關於系統管理員(root)做的動作：
[root@study ~]# gpasswd groupname
[root@study ~]# gpasswd [-A user1,...] [-M user3,...] groupname
[root@study ~]# gpasswd [-rR] groupname
選項與參數：
    ：若沒有任何參數時，表示給予 groupname 一個密碼(/etc/gshadow)
-A  ：將 groupname 的主控權交由後面的使用者管理(該群組的管理員)
-M  ：將某些帳號加入這個群組當中！
-r  ：將 groupname 的密碼移除
-R  ：讓 groupname 的密碼欄失效

# 關於群組管理員(Group administrator)做的動作：
[someone@study ~]$ gpasswd [-ad] user groupname
選項與參數：
-a  ：將某位使用者加入到 groupname 這個群組當中！
-d  ：將某位使用者移除出 groupname 這個群組當中。

[root@host-162-166-94-62 html]# groupadd grouptest
[root@host-162-166-94-62 html]# gpasswd grouptest
Changing the password for group grouptest
New Password: 
Re-enter new password: 

[root@host-162-166-94-62 html]# useradd hejian
[root@host-162-166-94-62 html]# gpasswd -A hejian grouptest
[root@host-162-166-94-62 html]# grep grouptest /etc/group /etc/gshadow
/etc/group:grouptest:x:1001:
/etc/gshadow:grouptest:$6$Bf/7R/7jHOgl$OWbe35S9uIH6xCZQYMLbWsztWm8rO3j8Vh/7/0lwbtXehJAjdVrC37DQu4UE6bwfr7JzT5R5V/M8uRJfXKYqf/:hejian:

######################################################################################################
ACL
[root@host-162-166-94-62 html]# dmesg | grep -i acl
[    2.590442] systemd[1]: systemd 219 running in system mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYPTSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 -SECCOMP +BLKID +ELFUTILS +KMOD +IDN)

setfacl [-bkRd] [{-m|-x} acl參數] 目標檔名
選項與參數：
-m ：設定後續的 acl 參數給檔案使用，不可與 -x 合用；
-x ：刪除後續的 acl 參數，不可與 -m 合用；
-b ：移除『所有的』 ACL 設定參數；
-k ：移除『預設的』 ACL 參數，關於所謂的『預設』參數於後續範例中介紹；
-R ：遞迴設定 acl ，亦即包括次目錄都會被設定起來；
-d ：設定『預設 acl 參數』的意思！只對目錄有效，在該目錄新建的資料會引用此預設值



# 1. 針對特定使用者的方式：
# 設定規範：『 u:[使用者帳號列表]:[rwx] 』，例如針對 vbird1 的權限規範 rx ：

[root@host-162-166-94-62 html]# touch acl_test; ll acl_test
-rw-r--r-- 1 root root 0 Nov 22 03:06 acl_test

[root@host-162-166-94-62 html]# setfacl -m u:root:rx acl_test; ll acl_test 
-rw-r-xr--+ 1 root root 0 Nov 22 03:06 acl_test

[root@host-162-166-94-62 html]# setfacl -m u::rwx acl_test; ll acl_test 
-rwxr-xr--+ 1 root root 0 Nov 22 03:06 acl_test
# 設定值中的 u 後面無使用者列表，代表設定該檔案擁有者，所以上面顯示 root 的權限成為 rwx 了！

getfacl filename
選項與參數：
getfacl 的選項幾乎與 setfacl 相同！所以鳥哥這裡就免去了選項的說明啊！

#-m mask 有效權限 (effective permission)
[root@host-162-166-94-62 html]# getfacl acl_test 
# file: acl_test
# owner: root
# group: root
user::rwx   #setfacl -m u::rwx acl_test
user:root:r-x     #setfacl -m u:root:rx acl_test      有效權限 (effective permission)
group::r--
mask::r-x
other::r--

#-g 组权限
[root@host-162-166-94-62 html]# setfacl -m g:grouptest:rx acl_test ; ll acl_test ; getfacl acl_test 
-rwxr-xr--+ 1 root root 0 Nov 22 03:06 acl_test
# file: acl_test
# owner: root
# group: root
user::rwx
user:root:r-x
group::r--
group:grouptest:r-x     #setfacl -m g:grouptest:rx acl_test
mask::r-x
other::r--

[root@host-162-166-94-62 html]# setfacl -m u:hejian:rx acl_test ; ll acl_test ; getfacl acl_test 
-rwxr-xr--+ 1 root root 0 Nov 22 03:06 acl_test
# file: acl_test
# owner: root
# group: root
user::rwx
user:root:r-x
user:hejian:r-x   #setfacl -m u:hejian:rx acl_test
group::r--
group:grouptest:r-x
mask::r-x
other::r--

[root@host-162-166-94-62 html]# setfacl -m m:r acl_test ; getfacl acl_test 
# file: acl_test
# owner: root
# group: root
user::rwx
user:root:r-x			#effective:r--    <==hejian+mask均存在者，僅有 r 而已，x 不會生效
user:hejian:r-x			#effective:r--
group::r--
group:grouptest:r-x		#effective:r--
mask::r--
other::r--
#默认將 mask 設定為 rwx 

###########################################################################################
針對預設權限的設定方式：
# 設定規範：『 d:[ug]:使用者列表:[rwx] 』

[root@host-162-166-94-62 html]# mkdir acl_test ; getfacl acl_test
# file: acl_test
# owner: root
# group: root
user::rwx
group::r-x
other::r-x

[root@host-162-166-94-62 html]# setfacl -m d:u:hejian:rx acl_test/ ; getfacl acl_test/
# file: acl_test/
# owner: root
# group: root
user::rwx
group::r-x
other::r-x
default:user::rwx
default:user:hejian:r-x #新增权限
default:group::r-x
default:mask::r-x
default:other::r-x

[root@host-162-166-94-62 html]# cd acl_test/ ; mkdir -p test001 ; getfacl test001
# file: test001
# owner: root
# group: root
user::rwx
user:hejian:r-x
group::r-x
mask::r-x
other::r-x
default:user::rwx
default:user:hejian:r-x
default:group::r-x
default:mask::r-x
default:other::r-x
#setfacl -m d:u:hejian:rx acl_test/ 
#子目录全部继承

#########################################################################################################试用者身份切换
su
su [-lm] [-c 指令] [username]
選項與參數：
-   ：單純使用 - 如『 su - 』代表使用 login-shell 的變數檔案讀取方式來登入系統；
      若使用者名稱沒有加上去，則代表切換為 root 的身份。
-l  ：與 - 類似，但後面需要加欲切換的使用者帳號！也是 login-shell 的方式。
-m  ：-m 與 -p 是一樣的，表示『使用目前的環境設定，而不讀取新使用者的設定檔』
-c  ：僅進行一次指令，所以 -c 後面可以加上指令喔！


[hejian@host-162-166-94-62 html]$ id
uid=1001(hejian) gid=1002(hejian) groups=1002(hejian)
[hejian@host-162-166-94-62 html]$ su -
Password: 
Last login: Mon Nov 22 03:45:17 EST 2021 on pts/0
[root@host-162-166-94-62 ~]# 
[root@host-162-166-94-62 ~]# su - hejian
Last login: Mon Nov 22 03:46:32 EST 2021 on pts/0
[hejian@host-162-166-94-62 ~]$ 

[hejian@host-162-166-94-62 ~]$ su
# non-login shell 的方式，這種方式很多原本的變數不會被改變
Password: 
[root@host-162-166-94-62 hejian]# id
uid=0(root) gid=0(root) groups=0(root)
[root@host-162-166-94-62 hejian]# env | grep -i "user"
USER=hejian
XDG_RUNTIME_DIR=/run/user/1001

[root@host-162-166-94-62 hejian]# su -
Last login: Mon Nov 22 04:07:16 EST 2021 on pts/1
[root@host-162-166-94-62 ~]# id
uid=0(root) gid=0(root) groups=0(root)
[root@host-162-166-94-62 ~]# env | grep -i "user"
USER=root
#su - 会切换身份

[root@host-162-166-94-62 ~]# exit
[hejian@host-162-166-94-62 ~]$ head -n 3 /etc/shadow
head: cannot open ‘/etc/shadow’ for reading: Permission denied

[hejian@host-162-166-94-62 ~]$ su - -c "head -n 3 /etc/shadow"
Password: 
root:$6$dnKRK5s9yINu5IFT$EN8wAeyzbGwFqH8kFnJFevwGahgP4Hyp2CFoM9eRlGLwIR1xLyp/.dVtahsRDI.b.V4Gp6L6J0BihKDU6CNO90::0:99999:7:::
bin:*:17110:0:99999:7:::
daemon:*:17110:0:99999:7:::
[hejian@host-162-166-94-62 ~]$
#-c 临时执行一次

sudo [-b] [-u 新使用者帳號]
選項與參數：
-b  ：將後續的指令放到背景中讓系統自行執行，而不與目前的 shell 產生影響
-u  ：後面可以接欲切換的使用者，若無此項則代表切換身份為 root 。

############################################################################visudo
visudo
....(前面省略)....
root    ALL=(ALL)       ALL  <==找到這一行，大約在 98 行左右
『使用者帳號』：系統的哪個帳號可以使用 sudo 這個指令的意思；
『登入者的來源主機名稱』：當這個帳號由哪部主機連線到本 Linux 主機，意思是這個帳號可能是由哪一部網路主機連線過來的， 這個設定值可以指定用戶端電腦(信任的來源的意思)。預設值 root 可來自任何一部網路主機
『(可切換的身份)』：這個帳號可以切換成什麼身份來下達後續的指令，預設 root 可以切換成任何人；
『可下達的指令』：可用該身份下達什麼指令？這個指令請務必使用絕對路徑撰寫。 預設 root 可以切換任何身份且進行任何指令之意












































































































