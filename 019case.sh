#!/bin/bash

read -p "aa A bb * " input

case $input in
	aa|A)
		echo "aaaa";;
	bb)
		echo "bbbb";;
	*)
		echo "gungun";;
esac
