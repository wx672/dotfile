#!/bin/bash

usage(){
	cat <<EOF
USAGE: ${0##*/} [-h] [-A|-D|-L]
EOF
}

[ "$1" ] || { usage; exit 2; }

while getopts :hADL OPT; do
	case $OPT in
		h) usage; exit 0 ;;
		A) OP="A" ;;
		D) OP="D" ;;
		L) sudo iptables -L; exit 0 ;;
		*) usage; exit 1			
	esac
done

sudo iptables -"$OP" INPUT -i eth0 -p tcp -m multiport --dports 22,25,80,443,3333,4000,8080,10022 -j ACCEPT

sudo iptables -"$OP" INPUT -i eth0 -p udp -m multiport --dports 60001,5353,323 -j ACCEPT

sudo iptables -"$OP" INPUT -j DROP

# nft add rule ip filter INPUT iifname "eth0" ip protocol tcp tcp dport { 22,25,80,443,3333,4000,8080,10022} counter accept
# nft add rule ip filter INPUT iifname "eth0" ip protocol udp udp dport { 60001,5353,323} counter accept
# nft add rule ip filter INPUT counter drop
