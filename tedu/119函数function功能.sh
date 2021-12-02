#!/bin/bash

###################################################——》改造case
cat > 119_01_funtion.sh << "eof"
#!/bin/bash
read -p "input (one|two|three) " a
function myprint() {
echo -n "你选择的是"
#加上 -n 可以不斷行繼續在同一行顯示
}
case "$a" in
"one")
myprint;echo "$a"
;;
"two")
myprint;echo "$a"
;;
"three")
myprint;echo "$a"
;;
*)
echo -e "只能是(one|two|three) \tbash $0"
;;
esac
eof
bash 119_01_funtion.sh

###################################################——》改造case2
cat > 119_02_funtion.sh << "eof"
#!/bin/bash
read -p "input (one|two|three) " a
function printit(){
	echo "Your choice is ${1}"   # 這個 $1 必須要參考底下指令的下達
}
case ${a} in
  "one")
	printit 1  # 請注意， printit 指令後面還有接參數！(这里的参数是给上面的 ${1}用的)
	;;
  "two")
	printit 呵呵
	;;
  "three")
	printit 3
	;;
  *)
	echo "Usage ${0} {one|two|three}"
	;;
esac
eof
bash 119_02_funtion.sh












