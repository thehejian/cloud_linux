#!/bin/bash
read -p -e "input y or n \n" myxy 
[ -z "$myxy" ] && echo "please input again" && exit
if [ "$myxy" == "x" -o "$myxy" == "X" ]; then
  echo -e "your choice is $myxy \n";
elif [ "$myxy" == 'y' -o "$myxy" == "Y" ]; then
  echo -e "your choice is $myxy \n"
else
  echo -e "gun!!! shit x or y \n"
fi
