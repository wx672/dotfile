#!/bin/bash

usage() {
    cat <<EOF
Batch generating courseworks.

Usage: $0 [-h] [-d dir] [-p "name pattern"] [-t "title string"] [-T "242501"] csvfile

-d direcotry holding old 20*.org files (default './')
-p filename pattern (default "^20", e.g. 20241152001.org)
-t TITLE string (default '《操作系统原理》实验报告')
-T School term (e.g. 242501)
-h help

csvfile - Should be the same as the one imported into Moodle.
EOF

exit "${1:-0}"
}

[[ "$1" ]] || usage 1
	
# defaults
PATN="^20"
TEMPLATE_DIR="/home/wx672/Documents/rsync/swfu/coursework-template/130"
TITLE="《操作系统原理》实验报告"
SEMESTER="242501"

while getopts :hd:p:t:T: OPT; do
    case $OPT in
        h) usage 0 ;;
        d) TEMPLATE_DIR="$OPTARG" ;;
        p) PATN="$OPTARG" ;;
        t) TITLE="$OPTARG" ;;
		T) SEMESTER="$OPTARG" ;;
        ?) usage 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1

CSV="$*" # taking username, lastname, firstname info from

# cp $TEMPLATE_DIR/20*.org dstdir
paste \
  <(fd -e org -d 1 "$PATN" "$TEMPLATE_DIR" | head -$(( $(wc -l < "$CSV") - 1 )) ) \
  <(qsv select /name$/ "$CSV" | qsv behead | sed -e 's/,//g' -e 's/$/.org/') \
	| sed 's/^/cp /' | bash

# change TITLE/AUTHOR
for f in 20*.org
do
	NAME=$(tr -d "[:digit:]" <<< "${f%.*}")
	ID=$(cut -b-11 <<< "$f")

	sed -i \
		-e "/#+TITLE:/  s/:.*$/: $TITLE/" \
		-e "/#+AUTHOR:/ s/:.*$/: $NAME ($ID)/" \
		-e "/#+DATE:/   s/:.*$/: $SEMESTER/" \
		"$f"
done    
