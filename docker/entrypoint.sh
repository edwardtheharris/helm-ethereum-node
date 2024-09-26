#!/bin/bash

/usr/sbin/geth --config /etc/ethereum/ethereum.conf --authrpc.jwtsecret=/srv/ethereum/jwt/jwt.hex
