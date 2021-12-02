#!/bin/bash

rf -rf /root/.ssh/id_rsa.pub
#remove old public key

yum install -y openssh
#install ssh server and client

#ssh client
ssh-keygen -t rsa

#ssh client upload to ssh server 
ssh-copy-id root@1.116.26.230
