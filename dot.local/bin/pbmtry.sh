#!/bin/bash

usage(){
	cat <<EOF
${0##*/} - Convert any image into PBMs with different parameters.

Usage: ${0##*/} <Image file>
EOF
	exit 4;
}

topdf(){
	ppm2tiff -c none $PBM $TIF && \
		tiff2pdf -zFo $PDF $TIF
}

[[ -n "$1" ]] || { usage; }

[[ -f "$1" ]] || { echo $1: 'Image file not found!'; exit 1; }

trap topdf EXIT

Viewer="$(command -v sxiv)"
IMG="$1"
BASE="${IMG%.*}"

PPM="$BASE.ppm"
PBM="$BASE.pbm"
TIF="$BASE.tif"
PDF="$BASE.pdf"

[[ -f "$PPM" ]] || convert $IMG $PPM 

for T in .5 .48 .45 .42 .4 .35; do
	for F in 2 4 8 16 32 64; do
		mkbitmap -f$F -t$T -o $PBM $PPM && \
			$Viewer $PBM
	done
done

