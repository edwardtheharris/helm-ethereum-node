#!/bin/bash

exec /usr/bin/prysm-beacon-chain --accept-terms-of-use --execution-endpoint="${EXECUTION_ENDPOINT}"
