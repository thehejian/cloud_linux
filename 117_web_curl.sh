echo -e "\ncurl -o /dev/null -s -w "%{http_code}\n" 162.166.94.62"
mycurl=$(curl -o /dev/null -s -w "%{http_code}\n" 162.166.94.62)
[ $mycurl -eq 200 ] && echo -e "\nwebserver(nginx/apache) is UP" || echo -e "\nwebserver(nginx/apache) is DOWN"
#curl -o /dev/null -s -w %"{http_code}\n" 10.243.232.63
#504
#200
#-o, --output FILE   Write output to <file> instead of stdout
#-s, --silent        Silent mode. Don't output anything
#不加-s的结果
#  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
#                                 Dload  Upload   Total   Spent    Left  Speed
#100  1842  100  1842    0     0   603k      0 --:--:-- --:--:-- --:--:--  899k
#-w, --write-out FORMAT  What to output after completion
#-w "%{http_code}" 看返回码
#$?不能判断
