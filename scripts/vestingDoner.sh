#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
        --addr $DEPOOL_ADDR \
        donor vesting \
        --wallet $VALIDATOR_ADDR \
        --donor 0:e17ac4e77f46626579c7c4fefe35286117384c5ccfc8745c9780cdf056c378bf \
        --sign $MSIG_KEYS_JSON_PATH
