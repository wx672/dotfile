#!/bin/sh

SRC="/usr/local/share/texmf/"
DST="/usr/local/src/wx672texmf-1.0/usr/local/share/texmf"

EX1=".git/"

YN=yes
printf "Dry run?[$YN]"
read YN
: ${YN:=yes }
case $YN in
	[nN]|[nN][oO]) 
		rsync --exclude-from="/usr/local/share/texmf/.gitignore" --exclude="- $EX1" -av --delete -l -h $SRC $DST
		;;
  *) 
    rsync --exclude-from="/usr/local/share/texmf/.gitignore" --exclude="- $EX1" -av --delete -l -h --dry-run $SRC $DST
    ;;
esac

