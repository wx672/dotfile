#!/bin/bash


[[ -n $2 ]] || {
    echo Usage: $0 '<input image> <output PDF file name>'
    echo 'man mkbitmap/potrace for fine-tuning.'
    exit 0;
}
FILTER=3;
SCALE=2;
THRESHOLD=0.48;
TURDSIZE=5;

POTRACE="/usr/bin/potrace"
MKBITMAP="/usr/bin/mkbitmap"
OUTPUT="$2"
TMP="/tmp/tmp.ppm"

convert $1 $TMP

cat $TMP | $MKBITMAP -x -f$FILTER -s$SCALE -t$THRESHOLD | $POTRACE -b pdf -t$TURDSIZE -o $OUTPUT
