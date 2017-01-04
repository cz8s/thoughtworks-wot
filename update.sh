#!/bin/sh
gpg --homedir=. --refresh-keys thoughtworks.com
for key in $(gpg --homedir=. --list-sigs --with-colons thoughtworks.com| grep 'User ID not found' | cut -d':' -f 5); do
  gpg --homedir=. --recv-key $key
done
gpg --homedir=. --list-sigs --keyid-format 0xlong thoughtworks.com | sig2dot -a > thoughtworks-sigs.dot
springgraph < thoughtworks-sigs.dot > thoughtworks-sigs.png
