#!/bin/bash

# Convert scanned PDF into DJVU to save space
# Tools needed:
#   pdfimages - poppler-utils
#   convert - imagemagick
#   c44,djvm - djvulibre-bin

TMPDIR="/tmp"

conv(){
	echo -n "[convert] PPM -> PGM..."
	for f in $TMPDIR/tmp*.ppm
	do
		convert $f "$@" $f.pgm || (break && exit 3)
	done && echo "done."	

	echo -n "[c44] PGM -> DJVU..."
	for f in $TMPDIR/tmp*.pgm
	do
		c44 $f || exit 4
	done && echo "done."
}

cleanup(){
	echo -n "[rm] Cleaning up..."
	rm -rf $TMPDIR/tmp*.{ppm,pgm,djvu}
	echo "done."
}

[ -z $2 ] && echo "Usage: $0 <input pdf file> [boox|kpw|<Xres>x]" && exit 1

trap "cleanup" EXIT

cleanup # in case there are leftovers in $TMPDIR

echo -n "[pdfimages] PDF -> PPM..."
pdfimages $1 $TMPDIR/tmp || exit 2
echo "done."

case "$2" in 
	[bB][oO][oO][xX]|[bB]) conv "-scale" "1200x" ;;
	    [Kk][Pp][Ww]|[Kk]) conv "-scale" "1024x" ;;
	                    *) conv "-scale" "$2" ;;
esac

echo -n "[djvm] Generating the final DJVU file..."
djvm -c `basename $1 pdf`djvu $TMPDIR/*.djvu
echo "done."
