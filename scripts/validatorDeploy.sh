#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

PUBKEY=$(cat $MSIG_KEYS_JSON_PATH | grep 'public' | awk '{print $2}' | tr -d \",)

$TONOS_CLI -c $TONOS_CLI_CONFIG deploy $SAFE_TVC \
        "{\"owners\":[\"0x$PUBKEY\"],\"reqConfirms\":1}" \
        --abi $SAFE_ABI \
        --sign $MSIG_KEYS_JSON_PATH \
        --wc 0
