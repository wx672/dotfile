#!/bin/bash
# Update the bt-tracker= line in aria2.conf
# Any bt-tracker= lines are removed and and a new one added at the bottom of the file

# Updates at:  https://gist.github.com/HaleTom/fe873dc2f3c5bd14f7418efefc2b91a8
# Inspiration: https://github.com/wuyuansushen/aria2c_TrackersList

set -euo pipefail
shopt -s failglob

warn() { printf "%s: %s\n" "$0" "$*"; }
die() { warn "$1"; exit 1; }

conf=${XDG_CONFIG_HOME:-$HOME/.conifg}/aria2/aria2.conf
url='https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt'

tmp=$(mktemp -p /tmp) || die 'Cannot make temp file'
cleanup() { rm -rf "$tmp"; }  # Ensure tmp file is always removed, eg if we can't curl
trap cleanup EXIT

# Strip out any old bt-tracker= lines
[ -e "$conf" ] || die "config file $conf does not exist"
sed -E '/^[[:space:]]*bt-tracker/d' "$conf" >| "$tmp"

trackers=$(curl --no-progress-meter "$url" | sed '/^$/d' | tr '\n' ',') \
 || die "Couldn't get trackers list" >> "$tmp"

printf 'bt-tracker=%s\n' "$trackers" >> "$tmp"
mv "$tmp" "$conf"