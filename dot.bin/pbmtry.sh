#!/bin/bash

usage(){
	cat <<EOF
$(basename $0) - Convert any image into PBMs with didderent parameters.

Usage: `basename $0` <Image file>
EOF
				   exit 4;
}

topdf(){
	ppm2tiff $PBM $TIF && \
		tiff2pdf -zFo $PDF $TIF
}

[[ -n "$1" ]] || { usage; }

[[ -f "$1" ]] || { echo $1: 'Image file not found!'; exit 1; }

trap topdf EXIT

IMG="$1"
BASE="${IMG%.*}"

PPM="$BASE.ppm"
PBM="$BASE.pbm"
TIF="$BASE.tif"
PDF="$BASE.pdf"

convert $IMG $PPM 

for T in .5 .49 .48 .45 .42; do
	for F in 8 4 2 1; do
		mkbitmap -f$F -t$T -o $PBM $PPM && \
			qiv $PBM
	done
done

