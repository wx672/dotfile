#!/bin/bash

# This little script is for calculating the sqrt() of [42,99].
# The results will be used for ... you know it.

echo -e "Orig 10xsqrt() Final"

for((i=20;i<40;i++))
do 
	echo -en "$i   "
	j=$(echo "scale=2;sqrt($i)*10" | bc)
	echo -en "$j   "
	k=$(echo "scale=2;$j*0.8 + $i*0.2" | bc)
	echo -en "$k  |  "

	m=$(($i+20))
 
 	echo -en "$m   "
 	n=$(echo "scale=2;sqrt($m)*10" | bc)
 	echo -en "$n   "
	o=$(echo "scale=2;$n*0.8 + $m*0.2" | bc)
	echo -en "$o  |  "

	x=$(($m+20))
 
 	echo -en "$x   "
 	y=$(echo "scale=2;sqrt($x)*10" | bc)
 	echo -en "$y   "
	z=$(echo "scale=2;$y*0.8 + $x*0.2" | bc)
	echo -en "$z  |  "
	
	a=$(($x+20))
 
 	echo -en "$a   "
 	b=$(echo "scale=2;sqrt($a)*10" | bc)
 	echo -en "$b   "
	c=$(echo "scale=2;$b*0.8 + $a*0.2" | bc)
	echo "$c"
done
