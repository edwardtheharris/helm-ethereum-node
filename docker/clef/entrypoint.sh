#!/bin/bash

mkdir -pv /srv/ethereum/clef/keystore
mkdir -pv /srv/ethereum/clef/config

/usr/sbin/clef --keystore=/srv/ethereum/clef/keystore --configdir=/srv/ethereum/clef/config --chainid=1 --http --suppress-bootwarn
