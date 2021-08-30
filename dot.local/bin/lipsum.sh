#!/bin/sh

while getopts ":n:wpbls" opt; do
  case $opt in
    n)
      AMOUNT=$OPTARG
      ;;
    w)
      WHAT=words
      ;;
    p)
      WHAT=paras
      ;;
    b)
      WHAT=bytes
      ;;
    l)
      WHAT=lines
      ;;
    s)
      START=true
      ;;
    *)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

curl -s -X POST https://lipsum.com/feed/json \
	 -d "amount=${AMOUNT:-5}" \
	 -d "what=${WHAT:-paras}" \
	 -d "start=${START:-false}" \
	| jq -r '.feed.lipsum'
