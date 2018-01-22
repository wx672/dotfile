#!/bin/bash

SM="/usr/games/sm -n Purisa -f Green -b LightGray "
DAY='See you next time!'
NIGHT='Good night!'

case "$1" in
	[dD][aA][yY]) $SM $DAY
		;;
	[nN][iI][gG][hH][tT]) $SM $NIGHT
		;;
	*) echo "Usage: $0 day|night"
		;;
esac
