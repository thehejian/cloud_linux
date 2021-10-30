#!/bin/bash

for i in $(ls /etc/*.conf)
do
	md5sum $i >> 049original_conf.txt
done
