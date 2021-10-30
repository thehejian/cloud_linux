#!/bin/bash

yum -y install rpm-build

#Installed:
#  rpm-build.x86_64 0:4.11.3-46.el7_9                                                                                                                              

#Dependency Installed:
#  dwz.x86_64 0:0.11-3.el7               patch.x86_64 0:2.7.1-12.el7_7                   perl-Thread-Queue.noarch 0:3.02-2.el7  perl-srpm-macros.noarch 0:1-8.el7 
#  python-srpm-macros.noarch 0:3-34.el7  redhat-rpm-config.noarch 0:9.1.0-88.el7.centos

rpmbuild -ba XXX.spec

ls ~/rpmbuild/

#BUILD  BUILDROOT  RPMS  SOURCES  SPECS  SRPMS
