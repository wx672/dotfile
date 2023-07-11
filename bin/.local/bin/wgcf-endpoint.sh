#!/bin/bash

findIP="/usr/local/bin/wgcf-endpoint"
ipList="/tmp/iplist"
OUT="/tmp/result.csv"
CONF="/etc/wireguard/wgcf.conf"

endpts4(){
	while true; do
		allIP+=(
			# "162.159.192.$(($RANDOM%256))"
			# "162.159.193.$(($RANDOM%256))"
			# "162.159.195.$(($RANDOM%256))"
			# "173.245.48.$(($RANDOM%256))"
			# "173.245.49.$(($RANDOM%256))"
			# "173.245.50.$(($RANDOM%256))"
			# "173.245.51.$(($RANDOM%256))"
			# "173.245.52.$(($RANDOM%256))"			
			"188.114.96.$(($RANDOM%256))"
			"188.114.97.$(($RANDOM%256))"
			"188.114.98.$(($RANDOM%256))"
			"188.114.99.$(($RANDOM%256))"
			# "190.93.241.$(($RANDOM%256))"
			# "190.93.242.$(($RANDOM%256))"
			# "190.93.243.$(($RANDOM%256))"
			# "190.93.244.$(($RANDOM%256))"
		)

		[ ${#allIP[@]} -ge 100 ] && break
	done
# ipcalc 173.245.48.0/20
# ipcalc 103.21.244.0/22
# ipcalc 103.22.200.0/22
# ipcalc 103.31.4.0/22
# ipcalc 141.101.64.0/18
# ipcalc 108.162.192.0/18
# ipcalc 190.93.240.0/20
# ipcalc 188.114.96.0/20
# ipcalc 197.234.240.0/22
# ipcalc 198.41.128.0/17
# ipcalc 162.158.0.0/15
# ipcalc 104.16.0.0/13
# ipcalc 104.24.0.0/14
# ipcalc 172.64.0.0/13
# ipcalc 131.0.72.0/22
}

hex(){
	printf '%x\n' $(($RANDOM*2+$RANDOM%2))
}

endpts6(){
	while true; do
		allIP+=(
			"[2606:4700:d0::$(hex):$(hex):$(hex):$(hex)]"
			"[2606:4700:d1::$(hex):$(hex):$(hex):$(hex)]" )

		[ ${#allIP[@]} -ge 100 ] && break
	done
}


#[[ "$1" ]] && endpts6 || endpts4
endpts4

# PS3='请选择：'
# select Addr_family in "优选IPv4" "优选IPv6"
# do
# 	[[ "$Addr_family" = "优选IPv4" ]] && endpts4 
# 	[[ "$Addr_family" = "优选IPv6" ]] && endpts6 
# 	break
# done		

sort -u <(sed -e 's/ /\n/g' <<< "${allIP[@]}") > $ipList

# Stop wg-quick@wgcf service
sudo wg-quick down wgcf
sudo systemctl stop wg-quick@wgcf

$findIP -file $ipList -output $OUT

# sort -t, -nk2 -nk3 result.csv | uniq | head -11
echo "Chosen one: $(sed -n 2p $OUT)"
ENDPNT=$(sed -n 2p $OUT | cut -d, -f1)

sed -i "/^Endpoint/ s/=.*$/= $ENDPNT/" $CONF

echo 'sudo systemctl start wg-quick@wgcf ...'
sudo systemctl start wg-quick@wgcf && echo 'done.'

sudo wg show wgcf | rg endpoint
while true; do
	sudo wg show wgcf | rg transfer
	sleep 3
#	sudo wg show wgcf | sed -n -e '/endpoint/p' -e '/transfer/p'
done
