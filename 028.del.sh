#!/bin/bash

for i in `ls *.txt`
do
	x=${i%.txt*}
	mv $i $x.doc
done

