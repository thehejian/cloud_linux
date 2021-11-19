#!/bin/bash
echo -e "\nps -ef | grep nginx | grep -v grep"
ps -ef | grep nginx | grep -v grep &> /dev/null
[ $? -eq 0 ] && echo -e "\nwebserver nginx/apache is UP" || echo -e "\nwebserver nginx/apache is DOWN"
