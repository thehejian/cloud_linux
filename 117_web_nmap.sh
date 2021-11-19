echo -e "\nnmap 162.166.94.62 -p 80 | grep open | wc -l0"
[ $mynmap -eq 1 ] && echo -e "\nwebserver(nginx/apache) is UP" || echo -e "\nwebserver(nginx/apache) is DOWN"
#nmap 1.116.26.230 -p 80 
#$?不行哈
mynmap=$(nmap 162.166.94.62 -p 80 | grep open | wc -l)
#1
