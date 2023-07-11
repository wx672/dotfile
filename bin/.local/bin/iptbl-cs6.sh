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

DPORTS1="22,25,80,443,1080,1081,3333,4000,8080,8081"
DPORTS2="8433,8434,9090,9091,10022,39609,59626"

sudo iptables -"$OP" INPUT -i eth0 -p tcp -m multiport --dports $DPORTS1  -j ACCEPT
sudo iptables -"$OP" INPUT -i eth0 -p tcp -m multiport --dports $DPORTS2  -j ACCEPT

sudo iptables -"$OP" INPUT -i eth0 -p udp -m multiport --dports 60001,5353,323 -j ACCEPT

sudo iptables -"$OP" INPUT -j DROP
