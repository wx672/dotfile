#!/bin/sh

SRC="/usr/local/share/texmf/"
DST="/usr/local/src/wx672texmf/usr/local/share/texmf"

EXFROM="${SRC}.gitignore"

YN=yes
printf "Dry run?[%s]" "$YN"
read -r YN
: "${YN:=yes }"
case $YN in
	[nN]|[nN][oO]) 
		rsync -avlh --delete -f'- .git/' --exclude-from=${EXFROM} $SRC $DST
		;;	         
	*) 		         
		rsync -avlh --delete -f'- .git/' --exclude-from=${EXFROM} --dry-run $SRC $DST
		;;
esac

