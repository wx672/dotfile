#!/bin/bash

speedTest="/usr/local/bin/wgcf-endpoint"
ipList="/tmp/iplist"
OUT="/tmp/result.csv"
CONF="/etc/wireguard/wgcf.conf"
RANDOM=$$

hex(){
	printf '%x\n' $(($RANDOM*2+$RANDOM%2))
}

collectIP(){
	if [[ "$1" = 6 ]]; then
		for (( i=0; i<200; i++ )); do
			allIP+=(
				"[2606:4700:d0::$(hex):$(hex):$(hex):$(hex)]"
				"[2606:4700:d1::$(hex):$(hex):$(hex):$(hex)]" )
		done
	else
		for (( i=0; i<200; i++ )); do
			allIP+=(
				# "162.159.192.$(($RANDOM%255))"
				# "162.159.193.$(($RANDOM%255))"
				# "162.159.195.$(($RANDOM%255))"
				"188.114.96.$(($RANDOM%255))"
				"188.114.97.$(($RANDOM%255))"
				"188.114.98.$(($RANDOM%255))"
				"188.114.99.$(($RANDOM%255))"
			)
			# [ ${#allIP[@]} -ge 100 ] && return
		done
	fi

	sort -u <(sed -e 's/ /\n/g' <<< "${allIP[@]}") > $ipList

}

collectIP ${1:-4}

sudo systemctl stop wg-quick@wgcf

$speedTest -file $ipList -output $OUT

ENDPNT=$(sed -n 2p $OUT | cut -d, -f1)

sed -i "/^Endpoint/ s/=.*$/= $ENDPNT/" $CONF

echo 'sudo systemctl start wg-quick@wgcf ...'
sudo systemctl start wg-quick@wgcf && echo 'done.'

sudo wg show wgcf | rg endpoint
while true; do
	sudo wg show wgcf | rg transfer
	sleep 3
done
