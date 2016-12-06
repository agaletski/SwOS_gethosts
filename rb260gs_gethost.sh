#!/bin/bash
# Gets FDB table from Mikrotik rb260gs switch.
#

curl  -u admin:password --digest --silent 'http://192.168.1.10/!dhost.b'|tr "[},:'{]" " \n   "|while read f1 f2 f3 f4 f5 f6 f7 f8 f9 f11 f12
do 
case $f4 in
	0x00 ) Port="P. 0";;
	0x01 ) Port="P. 1";;
	0x02 ) Port="P. 2";;
	0x04 ) Port="P. 3";;
	0x08 ) Port="P. 4";;
	0x10 ) Port="P. 5";;
	0x20 ) Port="P. 6";;
	* ) echo "Wrong port spesified - $f4"; exit 0;;
esac

Vlan=$((16#${f12:6:4}))

echo $Port V.$Vlan - ${f2:0:2}:${f2:2:2}:${f2:4:2}:${f2:6:2}:${f2:8:2}:${f2:10:2} 

done
