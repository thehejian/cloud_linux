#!/bin/bash
echo -e "\nwget -T 10 -q --spider http://162.166.94.62"
wget -T 10 -q --spider http://162.166.94.62
[ $? -eq 0 ] && echo -e "\nwebserver nginx/apache is UP" || echo -e "\nwebserver nginx/apache is DOWN"
#-T timeout
#-q quiet (no output)
#--spider don't download anything
