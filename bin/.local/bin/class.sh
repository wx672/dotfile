#!/bin/bash

cmdchk sm mpv amixer || exit 127
SM="/usr/games/sm -n Purisa -f Green -b LightGray "
BELL="/usr/local/share/sound/school-over.webm"
END='Bye!'
BREAK='Take a rest...'

VIDEO=(/usr/local/share/sound/v/)
# n=${#VIDEO[@]} # get the length of array ${VIDEO[@]}
# V="${VIDEO[RANDOM % n]}" # get a random array element

VINC='for v in 40 50 60 70 80 90 100; do amixer set Master $v\%; sleep 1; done'
VMAX='amixer set Master 100\%'

case "$1" in
	[sS][tT][aA][rR][tT]) parallel ::: "$VINC" "mpv --no-resume-playback $BELL"
				  ;;
	[eE][nN][dD]) parallel ::: "$VINC" "mpv --no-resume-playback $BELL" "$SM $END"
				  ;;
	[bB][rR][eE][aA][kK]) parallel ::: "$VMAX" "mpv --no-resume-playback --shuffle --volume=100 --volume-max=1000 $VIDEO"
		;;
	*) echo "Usage: $0 start|end|break"
		;;
esac
