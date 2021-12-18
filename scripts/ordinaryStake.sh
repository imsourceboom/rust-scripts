#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
       --addr $DEPOOL_ADDR \
       stake ordinary \
       --wallet $VALIDATOR_ADDR \
       --value 1000000 \
       --sign $MSIG_KEYS_JSON_PATH
