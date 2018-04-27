#!/bin/bash
# stock.sh written by Jean-Baptiste Fleury <jean-baptiste.fleury@epitech.eu>
# Data provided by MarketWatch, Copyright © 2018 MarketWatch, Inc. All rights reserved.
# Requires curl, column, recode, gnuplot

if [ -z "$1" ]
then
	echo "USAGE ./stock.sh [SYMBOL] or ./stock.sh [COMPANY NAME]"
	exit
fi
symbol_found=`curl -s https://www.marketwatch.com/investing/stock/$1 | wc -l`
if [ $symbol_found != "0" ]
then
	echo STOCK INFO FOR "$1":
	echo
	curl -s https://www.marketwatch.com/investing/stock/$1 > /tmp/infostock
	grep "<h1 class=\"company__name\">" /tmp/infostock |
	sed 's/^.*<h1 class=\"company__name\">/NAME:>/' |
	sed 's/<\/h1>//' > /tmp/details_stock
	if [ -z "$(grep "<span class=\"value\">" /tmp/infostock)" ]
	then
		grep -m 1 "<span class=\"kv__value kv__primary \">" /tmp/infostock |
		sed 's/^.*<span class=\"kv__value kv__primary \">/VALUE:>/' |
		sed 's/<\/span>//' >> /tmp/details_stock
	fi
	grep "<span class=\"value\">" /tmp/infostock |
	sed 's/^.*<span class=\"value\">/VALUE:>/' |
	sed 's/<\/span>//' >> /tmp/details_stock
	grep -m 4 "<span class=\"kv__value kv__primary \">" /tmp/infostock |
	sed 's/^.*<span class=\"kv__value kv__primary \">/MARKET CAP:>/' |
	sed 's/<\/span>//' |
	tail -n 1 >> /tmp/details_stock
	grep -m 1 "<li class=\"content__item value ignore-color\">" /tmp/infostock |
	sed 's/^.*<li class=\"content__item value ignore-color\">/5 Days:>/' |
	sed 's/<\/li//' >> /tmp/details_stock
	grep -m 2 "<li class=\"content__item value ignore-color\">" /tmp/infostock |
	sed 's/^.*<li class=\"content__item value ignore-color\">/1 Month:>/' |
	sed 's/<\/li//' |
	tail -n 1 >> /tmp/details_stock
	grep -m 3 "<li class=\"content__item value ignore-color\">" /tmp/infostock |
	sed 's/^.*<li class=\"content__item value ignore-color\">/3 Months:>/' |
	sed 's/<\/li//' |
	tail -n 1 >> /tmp/details_stock
	grep -m 4 "<li class=\"content__item value ignore-color\">" /tmp/infostock |
	sed 's/^.*<li class=\"content__item value ignore-color\">/YTD:>/' |
	sed 's/<\/li//' |
	tail -n 1 >> /tmp/details_stock
	grep -m 5 "<li class=\"content__item value ignore-color\">" /tmp/infostock |
	sed 's/^.*<li class=\"content__item value ignore-color\">/1 Year:>/' |
	sed 's/<\/li//' |
	tail -n 1 >> /tmp/details_stock
	cat /tmp/details_stock | column -s '>' -t
	echo
	path="$(echo "https://charting.nasdaq.com/ext/charts.dll?2-1-14-0-0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0|0,0,0,0,0-512-03NA000000TOPKEK-&SF:1|5-BG=FFFFFF-BT=0-HT=395--XXCL-" | sed 's/TOPKEK/'$1'/')"
	curl -s $path |
	tail -n +3 > /tmp/plotstock
	printf "set terminal dumb\nset xdata time\nset timefmt \"%%m/%%d/%%Y\"\nset format x \"%%m\"\nset autoscale y\nset autoscale x\nplot '/tmp/plotstock' using 1:2 title \"\"" |
	gnuplot
	exit
fi

echo Searching symbols for "$1"...
curl -s https://www.marketwatch.com/tools/quotes/lookup.asp?lookup=$1 > /tmp/results
result_start=` cat /tmp/results | grep -n "<div class=\"results\">" | cut -d: -f1`
result_end=`tail -n +$result_start /tmp/results | grep -nm 1 "</div></div>" | cut -d: -f1`
tail -n +$result_start /tmp/results |
head -n $result_end |
grep "title=" |
sed 's/^.*title=/title=/' |
sed 's/title="//' |
sed 's/\">/>SYMBOL: /' |
sed 's/<\/a><\/td>//' |
recode html |
grep -i "$1" |
sort -u |
column -s '>' -t \
> /tmp/results2
echo
echo "`wc -l /tmp/results2 | cut -d" " -f1` results found:"
echo
cat /tmp/results2
