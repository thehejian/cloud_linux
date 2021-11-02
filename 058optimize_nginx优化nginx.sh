#!/bin/bash

#####################################################################----------》修改工作进程数
lscpu
#查看CPU核心数

sed -i 's/worker_processes  1/worker_processes  1/g' /usr/local/nginx/conf/nginx.conf
#改成和CPU核心数一致 ; 
#ps -ef | grep nginx 可以查看 

#####################################################################----------》修改连接数
sed -i 's/worker_connections  1024;/worker_connections  65535;/g' /usr/local/nginx/conf/nginx.conf
#计算机最大端口数 65535

ulimit -a
#查看计算机的各类限制；
#################################################################################################################################################————》限制详情（上）
#限制core文件的大小(core file size):指定为0,将不会产生core文件。对于产生的core文件，使用gdb –core corefile.name来观察
#core file size (blocks, -c) 0
#限制进程使用数据段的大小(data seg size)： 会影响程序调用brk(系统调用)和sbrk(库函数)。调用malloc时，如果发现vm不够了就会用brk去内核申请。单位为kb
#data seg size (kbytes, -d) unlimited
#进程优先级的限制:这个值只对普通用户起作用,对超级用户不起作用。 测试如下nice -n -11 ls /tmp
#scheduling priority (-e) 0
#限制进程产生的文件大小(file size)硬限制控制软限制,软限制来限制用户对资源的使用
#file size (blocks, -f) unlimited
#针对所有用户,表示可以被挂起/阻塞的最大信号数量
pending signals (-i) 1032188
#内存锁定值的限制:只对普通用户起作用,对超级用户不起作用,”CAP_IPC_LOCK” 将数据锁定到物理内存可以避免数据的换入/换出,即避免swap
#锁定内存的动作由mlock()函数来完成
#max locked memory (kbytes, -l) 64
#驻留内存的限制在很多系统里也没有作用.
#max memory size (kbytes, -m) unlimited
#进程打开文件的限制(open files)
#open files (-n) 1024
#不能改变,只能是8*512(bytes),也就是4096个字节.
#pipe size (512 bytes, -p) 8
#可以创建使用POSIX消息队列的最大值,单位为bytes.(POSIX message queues).如消息队列不够用，会报错：Cannot allocate memory.是一种IPC
#POSIX message queues (bytes, -q) 819200
#限制程序实时优先级的范围,只针对普通用户。
#real-time priority (-r) 0
#限制进程使用堆栈段的大小,会出现堆栈不够用的情况
#stack size (kbytes, -s) 10240
#程序占用CPU的时间,单位是秒.程序占用CPU时间超过这个时间，会被kill掉
#cpu time (seconds, -t) unlimited
#限制程序可以fork的进程数,只对普通用户有效
#max user processes (-u) 1024
#限制进程使用虚拟内存的大小
#virtual memory (kbytes, -v) unlimited
#文件锁的限制只在2.4内核之前有用.
#file locks (-x) unlimited
#################################################################################################################################################————》限制详情（下）

#####################################################################----------》系统中，修改文件数的软硬限制
#ulimit -Hn 100000
#-n 文件数硬限制 -Hard, 不能超越 ,腾讯云主机无法这样配置
###################----------》临时修改，并立即生效
ulimit -Sn 1000
#-n 文件数软限制 -Soft 警告, 超越可以使用
#临时修改，立即生效
###################----------》永久修改，重启后才生效
sed -i 's/root soft nofile 100001/root soft nofile 100002/g' /etc/security/limits.conf
sed -i 's/root hard nofile 100002/root hard nofile 100003/g' /etc/security/limits.conf
#永久修改，重启后才生效

#####################################################################----------》nginx配置文件，配置缓存
##############----------》包缓存区设置
sed -i '7a \                            
    client_header_buffer_size 1k; \
    large_client_header_buffers 4 4k;' /usr/local/nginx/conf/nginx.conf
#buffer缓冲区默认 1k; 最大 4个 4K; 
#设置包头的缓存区大小
##############----------》不同文件类型，设置缓存时间
sed -i '49a \                           
        location ~* \.(jpg|jpeg|gif|png|css|js|ico|xml)$ { \
            expires 30d; \
        } ' /usr/local/nginx/conf/nginx.conf
#缓存30天 
#~* 正则匹配，不区分大小写
#304 重定向 

systemctl reload nginx

#####################################################################----------》http工具攻击web服务器
yum install -y httpd-tools
ab -n 2000 -c 2000 http://1.116.26.230/
#-client 人
#-number 访问量

#死循环，boom
#while :
#do
#    echo a
#done
