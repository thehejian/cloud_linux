#!/bin/bash
#while 条件成立时执行，不成立时就退出
#until 条件成立时退出，不成立时才执行

##########################################——》while
cat > 120_while_1.sh << "eof"
#!/bin/bash
read -p "input " a 
while [ "$a" != "yes" -a "$a" != "YES" ]
do
  echo -e "你丫只能输入这两个(yes|YES)";
  sleep 1;
done
echo -e "\n 你选对了"
eof
bash 120_while_1.sh

##########################################——》until
cat > 120_until_1.sh << "eof"
#!/bin/bash
read -p "input " a 
#!/bin/bash
until [ "$a" == "yes" -a "$a" == "YES" ]
do
  echo -e "\n你丫只能输入这两个(yes|YES)";
  sleep 1;
done
echo -e "\n 你选对了"
eof
bash 120_until_1.sh

##########################################——》0加到100(1)
cat > 120_0-100.sh << "eof"
#!/bin/bash
a=0
b=0
while [ $a -lt 100 ]
do
  a=$((a+1))
  b=$((b+a))
done
echo "$b"
eof
bash 120_0-100.sh















