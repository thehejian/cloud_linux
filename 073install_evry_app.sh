#!/bin/bash

app=git
version=2.33.1
path=/usr/local/$app/
appurl=https:/git.kernel.org/pub/scm/git/git.git/snapshot
#buyao app version de url; buyao /;

yum -y install gcc readline-devel
yum -y install ncurses-devel
yum -y install pcre-devel
yum -y install python-docutils
#varnish de yilai bao

useradd -s /sbin/nologin $app

mkdir -p $path
cd $path

wget $appurl/$app-$version.tar.gz

tar -xf $app-$version.tar.gz

cd $app-$version/

./configure

make && make install
