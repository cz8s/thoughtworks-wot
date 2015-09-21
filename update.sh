#!/bin/sh
gpg --homedir=. --refresh-keys
gpg --homedir=. --list-sigs | sig2dot > thoughtworks-sigs.dot
dot thoughtworks-sigs.dot -Ksfdp -Tpng -o thoughtworks-sigs.png
