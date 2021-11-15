#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG call $VALIDATOR_ADDR submitTransaction \
        "{\"dest\":\"$NEW_DEPOOL_ADDR\",\"value\":50000000000,\"bounce\":false,\"allBalance\":false,\"payload\":\"\"}" \
        --abi $SAFE_ABI \
        --sign $MSIG_KEYS_JSON_PATH
