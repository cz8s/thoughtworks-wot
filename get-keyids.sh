#!/bin/sh

TEMP=$(tempfile)

curl 'http://zimmerman.mayfirst.org:11371/pks/lookup?op=vindex&search=thoughtworks.com' > $TEMP

lynx -dump $TEMP | grep '<strong>pub</strong>' -A 2 | grep 'rch=0x' | cut -d'>' -f 2 | cut -d'<' -f1 | grep -v revok | sort > keyids.txt

for keyid in $(cat keyids.txt); do
	gpg --homedir=. --recv-key $keyid
done

rm $TEMP

