#!/bin/bash

# https://tex.stackexchange.com/questions/42236/pdfcrop-generates-larger-file
# Removes white margins from every page in the file. (Default operation)
# Trims page edges by given amounts. (Alternative operation)

function usage () {
	cat <<EOF
Usage: `basename $0` [Options] <input.pdf> [<output.pdf>]

If only <input.pdf> is given, it is overwritten with the cropped output.

Options:

 -m "<left> [<bottom> [<right> <top>]]"
    adds extra margins in default operation mode. Unit is bp. A single number
    is used for all margins, two numbers "<left> <bottom>" are applied to the
    right and top margins alike.

 -t "<left> [<bottom> [<right> <top>]]"
    trims outer page edges by the given amounts. Unit is bp. A single number
    is used for all trims, two numbers "<left> <bottom>" are applied to the
    right and top trims alike.

 -two
    to be used for documents with two-sided page layout; the meaning of <left>
    and <right> changes to <inner> and <outer> for options -m and -t

 -hires
    %%HiResBoundingBox is used in default operation mode.

 -help
    prints this message.
EOF
}

c=0
mar=(0 0 0 0); tri=(0 0 0 0)
bbtype=BoundingBox
two=0

while getopts m:t:h: opt
do
	case $opt
	in
		m)
			eval mar=($OPTARG)
			[[ -z "${mar[1]}" ]] && mar[1]=${mar[0]}
			[[ -z "${mar[2]}" || -z "${mar[3]}" ]] && mar[2]=${mar[0]} && mar[3]=${mar[1]}
			c=0
			;;
		t)
			if [[ "$OPTARG" == "wo" ]]
			then
				two=1
			else
				eval tri=($OPTARG)
				[[ -z "${tri[1]}" ]] && tri[1]=${tri[0]}
				[[ -z "${tri[2]}" || -z "${tri[3]}" ]] && tri[2]=${tri[0]} && tri[3]=${tri[1]}
				c=1
			fi
			;;
		h)
			if [[ "$OPTARG" == "ires" ]]
			then
				bbtype=HiResBoundingBox
			else
				usage 1>&2; exit 0
			fi
			;;
		\?)
			usage 1>&2; exit 1
			;;
	esac
done

shift $((OPTIND-1))

[[ -z "$1" ]] && echo "`basename $0`: missing filename" 1>&2 && usage 1>&2 && exit 1
input=$1;output=$1;shift;
[[ -n "$1" ]] && output=$1 && shift;

(
    [[ "$c" -eq 0 ]] && gs -dNOPAUSE -q -dBATCH -sDEVICE=bbox "$input" 2>&1 | grep "%%$bbtype"
    pdftk "$input" output - uncompress
) | perl -w -n -s -e '
  BEGIN {@m=split /\s+/, $mar; @t=split /\s+/, $tri; @mb=(); $p=-1;}
  sub fixMB {
    if($c){
      if($two && $p%2) {
        $mb[0]+=$t[2];$mb[1]+=$t[1];$mb[2]-=$t[0];$mb[3]-=$t[3];
      }
      else {
        $mb[0]+=$t[0];$mb[1]+=$t[1];$mb[2]-=$t[2];$mb[3]-=$t[3];
      }
      print "/MediaBox [", join(" ", @mb), "]\n";
    } else {
      @bb=split /\s+/, $bbox[$p];
      if($two && $p%2) {
        $bb[0]+=$mb[0];$bb[1]+=$mb[1];$bb[2]+=$mb[0];$bb[3]+=$mb[1];
        $bb[0]-=$m[2];$bb[1]-=$m[1];$bb[2]+=$m[0];$bb[3]+=$m[3];
      }
      else {
        $bb[0]+=$mb[0];$bb[1]+=$mb[1];$bb[2]+=$mb[0];$bb[3]+=$mb[1];
        $bb[0]-=$m[0];$bb[1]-=$m[1];$bb[2]+=$m[2];$bb[3]+=$m[3];
      }
      print "/MediaBox [", join(" ", @bb), "]\n";
    }
  }
  if (/BoundingBox:\s+([\d\.\s]+\d)/) { push @bbox, $1; next;}
  elsif (/\/MediaBox\s+\[([\d\.\s]+\d)\]/) {
    @mb=split /\s+/, $1; next if($p<0);
    fixMB; @mb=(); $p=-1; next;
  }
  elsif (/pdftk_PageNum\s+(\d+)/) {
    $p=$1-1; next unless(@mb);
    fixMB; @mb=(); $p=-1; next;
  }
  print;
' -- -mar="${mar[*]}" -tri="${tri[*]}" -c=$c -two=$two | pdftk - output "$output" compress
