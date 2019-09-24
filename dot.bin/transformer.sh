#!/bin/bash

usage() {
    cat <<EOF
Usage: $0 [-h] [-d dir] [-f "name pattern"] [-t "title string"] csvfile

-d direcotry holding old 20*.org files
-f filename pattern (usually 20*.org)
-t TITLE string (default to '《操作系统原理》实验报告')
-h help
EOF
}

[[ -z "$1" ]] && { usage; exit 1; }
	
# defaults
FILE="20*.org"
DIR="."
TITLE="《操作系统原理》实验报告"

while getopts :hd:f:t: OPT; do
    case $OPT in
        h) usage; exit 0 ;;
        d) DIR="$OPTARG" ;;
        f) FILE="$OPTARG" ;;
        t) TITLE="$OPTARG" ;;
        ?) usage; exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1

CSV="$@"

# rename 20*.org files
cd $DIR && paste \
  <( ls $FILE | head -$(( $(wc -l $CSV | cut -d' ' -f1) - 1 )) ) \
  <(grep -v username $CSV | cut -f1,3,4 --output-delimiter='' -d, \
		| tr -d "[:blank:]\000" | sed 's/$/.org/')\
  | sed 's/^/mv /' | bash                                 # mv oldfile newfile

# change TITLE/AUTHOR
sed -i '/#+TITLE/d' 20*.org					# remove TITLE line
sed -i "1i\#+TITLE: $TITLE" 20*.org		    # insert TITLE line

sed -i '/#+AUTHOR/d' 20*.org                                     # remove AUTHOR line
for f in 20*.org; do
	NAME=$(echo $f | tr -d "[:digit:]" | cut -f1 -d.)
	ID=$(echo $f | cut -b-11)
	sed -i "1a\#+AUTHOR: $NAME ($ID)" $f;
done    # append AUTHOR line
