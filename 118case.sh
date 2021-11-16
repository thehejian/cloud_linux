#!/bin/bash
case  $變數名稱 in   <==關鍵字為 case ，還有變數前有錢字號
  "第一個變數內容")   <==每個變數內容建議用雙引號括起來，關鍵字則為小括號 )
	程式段
	;;            <==每個類別結尾使用兩個連續的分號來處理！
  "第二個變數內容")
	程式段
	;;
  *)                  <==最後一個變數內容都會用 * 來代表所有其他值
	不包含第一個變數內容與第二個變數內容的其他程式執行段
	exit 1
	;;
esac                  <==最終的 case 結尾！『反過來寫』思考一下！

###############################################################——》case判断输入
cat > 118case_digit.sh << "eof"
#!/bin/bash
read -p "请输入内容 " a
case ${a} in
"hello")
echo -e "\nhi,how are you\n"
;;
"")
echo -e "你没有输入哈\t重新执行$0\n"
;;
*)
echo -e "只能输入hello\t重新执行$\n"
esac
eof
bash 118case_digit.sh

###############################################################——》case输入2
cat > 118_case2.sh << "eof"
#!/bin/bash
read -p "input like:(one|two|three) " a
case $a in
"one")
echo -e "\nyour input is $a"
;;
"two")
echo -e "\nyour input is $a"
;;
"three")
echo -e "\nyour input is $a"
;;
*)
echo -e "\nonly (one|two|three) bash $0"
;;
esac
eof
bash 118_case2.sh











