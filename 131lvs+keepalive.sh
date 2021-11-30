#/bin/bash
#proxy1 用keepalive生成VIP
#proxy2
#proxy是主备部署、浮动IP
#proxy要安装keepalive（对外提供浮动IP）；高可用，配置优先级防止proxy坏掉，并对web进行安全检查
#proxy要安装ipvsadm调用内核的lvs功能；
#实际可以不安装，只是为了看结果；

#web1 lo:0 为vip 
#web2
#web是集群部署，由lvs的proxy进行负载分担；然后DR模式直接发包给client（回环lo：0为vip）

#proxy 1
yum -y install ipvsadm keepalived
ipvsadm -Ln
ipvsadm -C

cat > /etc/keepalived/keepalived.conf << "eof"
! Configuration File for keepalived

global_defs {
   notification_email {
     acassen@firewall.loc       #设置收件人邮箱
     failover@firewall.loc
     sysadmin@firewall.loc
   }
   notification_email_from Alexandre.Cassen@firewall.loc        #设置发件人邮箱
   smtp_server 192.168.200.1    #定义邮件服务器
   smtp_connect_timeout 30
   router_id lvs        #设置路由ID号，两台proxy（lvs）服务器要一致    （需要修改）
   vrrp_skip_check_adv_addr
   vrrp_strict
   vrrp_garp_interval 0
   vrrp_gna_interval 0
}

vrrp_instance VI_1 {
    state MASTER        #主服务器为MASTER   备份为BACKUP       （需要修改）
    interface eth0      #定义网络接口        centos7需要改成ens33        （需要修改）
    virtual_router_id 50        #VRID，虚拟路由器ID；两台proxy（lvs）服务器要一致    （需要修改）
    priority 100        #优先级 备份小于100 99        （需要修改）
    advert_int 1
    authentication {
        auth_type PASS
        auth_pass 1111  #密码    虚拟路由器ID；两台proxy（lvs）服务器要一致
    }
    virtual_ipaddress { #这是vip 浮动IP    lvs（proxy）的虚拟机IP        webserver的回环lo：0 IP     （需要修改）
        192.168.4.15
    }
}
#上面实现的是一个功能，设置VIP      浮动IP的功能（可以给多个服务器配置，按照优先级将浮动IP跟lvs服务器匹配；）
#验证方式：router_id lvs、virtual_router_id 50、 auth_pass 1111      路由ID（路由下是不是可以多个虚拟路由）和虚拟机路由ID和密码
#缺lvs（虚拟机路由）和健康检查功能；

#相当于ipvsadm -A 
#可以实现多个集群
virtual_server 192.168.4.15 80 {    #ipvsadm -A 192.168.4.15:80 -t -s wrr
    delay_loop 6
    lb_algo rr  #轮询    调度算法
    lb_kind NAT #NAT   调度类型
    #persistence_timeout 50    #需要注释掉，保持连接；客户端在一定时间内访问的是同一台服务器  (需要修改)
    protocol TCP        #-t TCP协议

    real_server 1.116.26.230 80 {   #ipvsadm -a 192.168.4.15:80 -r 1.116.26.230 -w 1 -m （需要修改）
        weight 1
        SSL_GET {       #健康检查功能，重要      （需要修改）
        #类型有3中
                #TCP_CHECK
                #HTTP_GET
                        #ping（能ping通IP，服务（apache）如果关了则检查不出来）
                        #curl（网页能否打开；缺点；网页如果被篡改，则无法检查出来）
                        #md5sum方式
                                myurl=1.116.26.230
                                mytxt=$(curl "$myurl" | md5sum)
                                [ "mytxt" == "myori_index" ] && echo "网页OK" || echo "网页被篡改了"
                                #myori_index是原始网页的MD5sum值
                #SSL_GET
            url {
              path /
              digest ff20ad2481f97b1754ef3e12ecd3a9cc
            }
            url {
              path /mrtg/
              digest 9b3a0c85a887a256d6939da88aabd8cd
            }
            connect_timeout 3
            nb_get_retry 3
            delay_before_retry 3
        }
    }
}

eof
