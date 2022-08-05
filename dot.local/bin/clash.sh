#!/bin/bash

fy="clash -f /home/wx672/.config/clash/fy-55549.yaml"

[[ $1 ]] && {
	$fy
	trap "$fy" INT TERM EXIT
} || {
	clash
	trap clash INT TERM EXIT
}



