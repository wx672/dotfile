#!/bin/bash

clash_fy="clash -f /home/wx672/.config/clash/fy-55549.yaml"

[[ $1 ]] && {
	$clash_fy
	trap "$clash_fy" INT TERM EXIT
} || {
	clash
	trap clash INT TERM EXIT
}
