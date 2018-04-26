#!/bin/bash
# Written By Jean-Baptiste Fleury <jean-baptiste.fleury@epitech.eu>
# REQUIRES CURL AND COREUTILS/BUSYBOX
# crypto.sh is a bash script that prints info on cryptocurrency using the
# coinmarketcap api.
if [ -z $1 ]
then
	echo "USAGE: ./crypto.sh [SYMBOL]"	
fi

curl https://api.coinmarketcap.com/v1/ticker/?convert=EUR -s > /tmp/toto
line=` cat /tmp/toto | grep -n "\"symbol\": \"$1\"" | cut -d: -f1`

cat /tmp/toto | tail -n +$line | head -n +16 | tr -d \" | tr -d ,
