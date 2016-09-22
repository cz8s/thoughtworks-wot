#!/bin/sh
gpg --homedir=. --refresh-keys
gpg --homedir=. --list-sigs | sig2dot > thoughtworks-sigs.dot
springgraph < thoughtworks-sigs.dot > thoughtworks-sigs.png
