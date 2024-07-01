#!/bin/sh

usage(){
  cat <<EOF
  ${0##*/} - Fetch Lorem Ipsum from https://lipsum.com/feed/json

  ${0##*/} [-n amount] [-w what] [-s true|false]

  Example usage:
    ${0##*/} # default amount(n) = 5, what(w) = paras, start(s) = false

    ${0##*/} -n 3     \ # AMOUNT=3 (default 5)
             -w paras \ # WHAT=paras (one of 'bytes, words, lines, paras', default paras)
             -s true    # START=true (default false)

  The above command will issue the following 'curl' command:
  
    curl -X POST https://lipsum.com/feed/json \
         -d "amount=5" \
         -d "what=paras" \
         -d "start=true"
EOF
  exit ${1:-0}
}

while getopts ":n:w:s:" opt; do
  case $opt in
    n)
      AMOUNT=$OPTARG
      ;;
    w)
      WHAT=$OPTARG
      ;;
    s)
      START=$OPTARG
      ;;
    *)
      usage
      ;;
  esac
done

curl -s -X POST https://lipsum.com/feed/json \
	 -d "amount=${AMOUNT:-5}" \
	 -d "what=${WHAT:-paras}" \
	 -d "start=${START:-false}" \
	| jq -r '.feed.lipsum'
