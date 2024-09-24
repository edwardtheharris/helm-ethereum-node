#!/bin/bash

mkdir -pv /srv/ethereum/consensus

exec /usr/bin/prysm-beacon-chain --accept-terms-of-use --datadir=/srv/ethereum/consensus --execution-endpoint=http://localhost:8551 --mainnet --checkpoint-sync-url=https://beaconstate.info --genesis-beacon-api-url=https://beaconstate.info
