#!/bin/bash
 sh [-nvx] scripts.sh
選項與參數：
-n  ：不要執行 script，僅查詢語法的問題；
-v  ：再執行 sccript 前，先將 scripts 的內容輸出到螢幕上；
-x  ：將使用到的 script 內容顯示到螢幕上，這是很有用的參數！

########################################################################——》112who.sh
cat > 112_001_who.sh << "eof"
#!/bin/bash
#1. 你目前的身份 (用 whoami ) 2. 你目前所在的目錄 (用 pwd)
echo -e "\n你的身份是$(whoami)";
echo -e "\n你目前所在的目錄$(pwd)";
eof
bash 112_001_who.sh

########################################################################——》過生日,不会呀####
cat > 112_002_guoshengri.sh << "eof"
#!/bin/bash
#你還有幾天可以過生日
read -p "Pleas input your birthday (MMDD, ex> 0709): " bir
now=`date +%m%d`
if [ "$bir" == "$now" ]; then
echo "Happy Birthday to you!!!"
elif [ "$bir" -gt "$now" ]; then
year=`date +%Y`
total_d=$(($((`date --date="$year$bir" +%s`-`date +%s`))/60/60/24))
echo "Your birthday will be $total_d later"
else
year=$((`date +%Y`+1))
total_d=$(($((`date --date="$year$bir" +%s`-`date +%s`))/60/60/24))
echo "Your birthday will be $total_d later"
fi
eof
bash 112_002_guoshengri.sh

########################################################################——》加数字
cat > 112_003_jiashuzi.sh << "eof"
#!/bin/bash
read -p "iput num " num
#for i in `seq 1 $num`
for ((i=1; i<=num; i++))
#双小括号中可以不加$
do
s=$((i+s));
done
echo -e "\n总和是$s"
eof
bash 112_003_jiashuzi.sh



