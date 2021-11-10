#!/bin/bash

echo "Hello 10.185.81.181" > /etc/motd
#展示登录信息

cat -n /etc/profile
#系统的整体文件，不要动

cat -n .bash_profile
#用户的个人设置

cat -n /etc/profile.d/*.sh
#被 /etc/profile 文件调用

cat -n /etc/locale.conf 
#LANG="en_US.UTF-8" 
#语系

cat -n /usr/share/bash-completion/completions/*
#命令补齐，文件名补齐

cat ~/.bashrc
#偏好设置，比如alias

source
#读取环境配置文件

source ~/.bashrc
#读取bash环境的配置

cat /etc/man_db.conf
#man帮助文档的调用路径

cat -n ~/.bash_history
#历史命令

cat -n ~/.bash_logout
#注销bash后做的操作

##########################——》终端的环境设置
stty -a
#列出所有的stty参数
#speed 38400 baud; rows 42; columns 168; line = 0;
intr = ^C; quit = ^\; erase = ^?; kill = ^U; eof = ^D; eol = <undef>; eol2 = <undef>; swtch = <undef>; start = ^Q; stop = ^S; susp = ^Z; rprnt = ^R; werase = ^W;
lnext = ^V; flush = ^O; min = 1; time = 0;
-parenb -parodd -cmspar cs8 -hupcl -cstopb cread -clocal -crtscts
-ignbrk -brkint -ignpar -parmrk -inpck -istrip -inlcr -igncr icrnl ixon -ixoff -iuclc -ixany -imaxbel -iutf8
opost -olcuc -ocrnl onlcr -onocr -onlret -ofill -ofdel nl0 cr0 tab0 bs0 vt0 ff0
isig icanon iexten echo echoe echok -echonl -noflsh -xcase -tostop -echoprt echoctl echoke
# ^C intr interrupt 中断、终止
# ^\ quit  
# eof = ^D end of file 结束输入
# erase = ^? 向后删除字符
# kill = ^U 删除命令行的所有文字

########################################——》通配符和特殊符号
*    代表『 0 个到无穷多个』任意字元            
？   代表『一定有一个』任意字元
[]   同样代表『一定有一个在括号内』的字元(非任意字元)。例如[abcd] 代表『一定有一个字元， 可能是a, b, c, d 这四个任何一个』           
[-]  若有减号在中括号内时，代表『在编码顺序内的所有字元』。例如[0-9] 代表 0 到9 之间的所有数字，因为数字的语系编码是连续的！
[^ ] 若中括号内的第一个字元为指数符号(^) ，那表示『反向选择』，例如[^abc] 代表 一定有一个字元，只要是非a, b, c 的其他字元就接受的意思。

ll -d /etc/cron*
ll -d /etc/?????
ll -d /etc/*[0-9]*
#通配符匹配时，中括号千万不能加空格
ll -d /etc/[^A-Z]*
#所有不是大写字母开头的内容

#注解符号：这个最常被使用在script 当中，视为说明！在后的资料均不执行
\ 转义；将『特殊字元或万用字元』还原成一般字元
|   pipe管道 分隔两个管线命令的界定
; 连续指令下达分隔符号：连续性命令的界定(注意！与管线命令并不相同)
~使用者的家目录
$ 	取用变数前置字元：亦即是变数之前需要加的变数取代值
&工作控制(job control)：将指令变成后台执行
！逻辑运算意义上的『非』 not 的意思！
/目录符号：路径分隔的符号
> >>资料流重导向：输出导向，分别是『取代』与『累加』
< << 资料流重导向：输入导向
'' 单引号，不具有变数置换的功能($ 变为纯文字)
"" 具有变数置换的功能！($ 可保留相关功能)
``两个『 ` 』中间为可以先执行的指令，亦可使用$( )
() 中间为子shell的集合
{} 中间为命令区块的组合

#####################数据重定向
#标准输入 stdin 代码0 使用< <<
#标准输出 stdout 代码为1 使用 > >>
#标准错误输出 stderr 代码为2 使用 2> 2>>


#标准输出 > 时，如果没有，则会自动创建文件；如果文件有，则会覆盖
ll /abc 2>error.txt
cat error.txt
#ls: cannot access /abc: No such file or directory

find /home -name ".bashrc" > right.txt 2> error.txt
cat right.txt
cat error.txt
#标准输出和标准错误输出分别重定向到对应的文件了

###################——》垃圾桶黑洞 /dev/null
find /home -name ".bashrc" 2> /dev/null
#标准错误输出被丢弃

find /home -name ".bashrc" > all.txt 2>1&
find /home -name ".bashrc" &> all.txt
#正确错误结果放一起

#使用 eof 可以不用输入 ^D
cat > 001.txt << "eof"
> this is
> ok
> eof
