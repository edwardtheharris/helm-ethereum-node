#!/bin/bash

mkdir -pv /srv/ethereum/consensus

cd /srv/ethereum/consensus || true

exec /usr/sbin/prysm.sh beacon-chain --accept-terms-of-use --datadir=/srv/ethereum/consensus --execution-endpoint=http://localhost:8551 --mainnet --jwt-secret=/srv/ethereum/jwt/jwt.hex --checkpoint-sync-url=https://beaconstate.info --genesis-beacon-api-url=https://beaconstate.info
