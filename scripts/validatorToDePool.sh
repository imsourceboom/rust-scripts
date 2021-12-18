#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG call $VALIDATOR_ADDR submitTransaction \
        "{\"dest\":\"$DEPOOL_ADDR\",\"value\":$1,\"bounce\":false,\"allBalance\":false,\"payload\":\"\"}" \
        --abi $SAFE_ABI \
        --sign $MSIG_KEYS_JSON_PATH
