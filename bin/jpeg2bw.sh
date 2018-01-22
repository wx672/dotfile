#!/bin/bash

[[ -n $4 ]] || {
    echo Usage: $0 '<input image> <output PBM file name> <FILTER> <THRESHOLD>'
    echo 'man mkbitmap for fine-tuning.'
    exit 0;
}

OUTPUT="$2"
FILTER=$3;
THRESHOLD=$4;

TOPNM="/usr/bin/anytopnm"
MKBITMAP="/usr/bin/mkbitmap"

$TOPNM $1 | $MKBITMAP -f$FILTER -t$THRESHOLD -o $OUTPUT
