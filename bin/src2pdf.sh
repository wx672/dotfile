#!/bin/sh

#https://gist.github.com/smoitra87/8115689

[ -n "$1" ] || { echo Usage: $0 '<source file>'; exit 1; }

PREAMBLE='\usepackage{xltxtra}\setmonofont{DejaVu Sans Mono}\pagestyle{empty}'

STYLE='default'
[ -n "$2" ] && STYLE=$2

pygmentize -f tex -O "style=$STYLE,linenos,full,preamble=$PREAMBLE" $1 | xelatex -jobname=`basename $1` -output-directory=/tmp

pdfcrop /tmp/`basename $1.pdf` `basename $1 | tr . -`.pdf

rm -f /tmp/$1*
