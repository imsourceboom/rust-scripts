#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
        --addr $NEW_DEPOOL_ADDR \
        withdraw $1 \
        --wallet $VALIDATOR_ADDR \
        --sign $MSIG_KEYS_JSON_PATH
