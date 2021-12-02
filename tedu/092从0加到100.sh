#从0加到100
seq -s "+" 100 | bc
#5050

echo {1..100} | tr " " "+" | bc
#5050
#tr "旧" "新"

seq 100 | awk '{total+=$1}END{print total}'
#5050

seq 100 | tr "\n" "+" | sed s#\+\$#\\n#g | bc
#5050
#seq 100 | tr "\n" "+" 尾巴会多一个+，需要换成\n
#sed s#+$#\n#g
#+$加号结尾的都得转义一下 s#\+\$
#\n 也需要转义一下 \\n
#sed s#\+\$#\\n#g
