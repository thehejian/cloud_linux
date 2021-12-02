#!/bin/bash

######################################——》w
[root@host-162-166-94-62 html]# w
 20:02:05 up 13:05,  3 users,  load average: 0.16, 0.15, 0.14
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
root     pts/0    10.182.152.127   07:17    5.00s  0.10s  0.00s w
root     tty1                      07:02   12:59m  0.00s  0.00s -bash
hejian   pts/1    10.182.152.127   20:02    3.00s  0.00s  0.00s -bash


######################################——》who
[root@host-162-166-94-62 html]# who
root     pts/0        2021-12-01 07:17 (10.182.152.127)
root     tty1         2021-12-01 07:02
hejian   pts/1        2021-12-01 20:02 (10.182.152.127)

######################################——》lastlog
[root@host-162-166-94-62 html]# lastlog
Username         Port     From             Latest
root             pts/0    10.182.152.127   Wed Dec  1 07:17:01 -0500 2021
bin                                        **Never logged in**
daemon                                     **Never logged in**
adm                                        **Never logged in**
lp                                         **Never logged in**
sync                                       **Never logged in**
shutdown                                   **Never logged in**
halt                                       **Never logged in**
mail                                       **Never logged in**
operator                                   **Never logged in**
games                                      **Never logged in**
ftp                                        **Never logged in**
nobody                                     **Never logged in**
systemd-network                            **Never logged in**
dbus                                       **Never logged in**
polkitd                                    **Never logged in**
postfix                                    **Never logged in**
chrony                                     **Never logged in**
sshd                                       **Never logged in**
tcpdump                                    **Never logged in**
apache                                     **Never logged in**
tss                                        **Never logged in**
test             pts/2                     Tue Jul 27 21:38:25 -0400 2021
nginx                                      **Never logged in**
dockerroot                                 **Never logged in**
kube                                       **Never logged in**
etcd                                       **Never logged in**
named                                      **Never logged in**
hejian           pts/1    10.182.152.127   Wed Dec  1 20:02:02 -0500 2021

######################################——》write
[root@host-162-166-94-62 html]# write hejian pts/1
hi,neng
#打断其他操作者，直接通信
[root@host-162-166-94-62 html]# mesg n
[root@host-162-166-94-62 html]# mesg 
is n
#嫌麻烦可以关掉消息提醒
[hejian@host-162-166-94-62 ~]$ write root pt/0
write: root is not logged in on pt/0

######################################——》wall
#广播，给自己也发送
[root@host-162-166-94-62 html]# wall "I will shutdown linux 1min"

Broadcast message from root@host-162-166-94-62 (pts/0) (Wed Dec  1 20:20:50 2021):

I will shutdown linux 1min

######################################——》mail
#地址：/var/spool/mail






































