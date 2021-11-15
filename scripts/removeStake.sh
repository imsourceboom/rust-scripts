#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
        --addr $NEW_DEPOOL_ADDR \
        stake remove \
        --wallet $VALIDATOR_ADDR \
        --value 1000000 \
        --sign $MSIG_KEYS_JSON_PATH
