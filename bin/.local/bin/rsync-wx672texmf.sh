#!/bin/sh

SRC="/usr/local/share/texmf/"
DST="/usr/local/src/wx672texmf/usr/local/share/texmf"

EXFROM="${SRC}.gitignore"
OPTS="-avlh --delete --exclude-from=${EXFROM} --exclude=- .git/"

YN=yes
printf "Dry run?[%s]" "$YN"
read -r YN
: "${YN:=yes }"
case $YN in
	[nN]|[nN][oO]) 
		rsync $OPTS $SRC $DST
		;;	         
	*) 		         
		rsync $OPTS --dry-run $SRC $DST
		;;
esac

