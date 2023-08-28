#!/bin/bash

CLASH="/usr/local/bin/clash"
clash_fy="$CLASH -f $HOME/.config/clash/fy-55549.yaml"
clash_free="$CLASH -f $HOME/.config/clash/config.yaml"

[[ $1 ]] && {
	$clash_fy
	trap "$clash_fy" INT TERM EXIT
} || {
	$clash_free
	trap "$clash_free" INT TERM EXIT
}
