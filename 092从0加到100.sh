#从0加到100
seq -s "+" 100 | bc
#5050

echo {1..100} | tr " " "+" | bc
#5050
#tr "旧" "新"

seq 100 | awk '{total+=$1}END{print total}'
5050
