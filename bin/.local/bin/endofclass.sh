#!/bin/bash

SM="/usr/games/sm -n Purisa -f Green -b LightGray "
DAY='Bye!'
NIGHT='Good night!'
BREAK='Take a rest...'
BELL="/usr/local/share/sound/school-over.webm"
REST="/usr/local/share/sound/Feather-theme.webm"
VUP='for v in 40 50 60 70 80 90 100; do amixer set Master $v\%; sleep 1; done'
VON='amixer set Master 100\%'

case "$1" in
	[dD][aA][yY]) parallel ::: "$VUP" "mpv $BELL" "$SM $DAY"
		;;
	[nN][iI][gG][hH][tT]) parallel ::: "$VUP" "mpv $BELL" "$SM $NIGHT"
		;;
	[bB][rR][eE][aA][kK]) parallel ::: "$VON" "mpv --volume=100 $REST" "$SM $BREAK"
		;;
	*) echo "Usage: $0 day|night|break"
		;;
esac
