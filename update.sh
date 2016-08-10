#!/bin/sh
gpg --homedir=. --refresh-keys
gpg --homedir=. --list-sigs | sig2dot > thoughtworks-sigs.dot
if [[ "$unamestr" == 'Linux' ]]; then
  springgraph < thoughtworks-sigs.dot > thoughtworks-sigs.png
else
  dot -T png -O thoughtworks-sigs.dot
fi
