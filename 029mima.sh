#!/bin/bash

read -p "input name " name
useradd $name

read -p "input passwd " passwd
echo ${passwd:-123} | passwd --stdin $name

