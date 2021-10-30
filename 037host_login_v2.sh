#!/bin/bash
awk '/Failed password for root/{print $11}' /var/log/secure | awk '{ip[$1]++}END{for(i in ip){print ip[i],i}}' | awk '$1>3{print "入侵" $1 "次\t","ip 为" $2}' | sort -r
