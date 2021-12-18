#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh


$TONOS_CLI -c $TONOS_CLI_CONFIG call \
        $VALIDATOR_ADDR submitTransaction \
        "{\"dest\":\"0:e17ac4e77f46626579c7c4fefe35286117384c5ccfc8745c9780cdf056c378bf\",\"value\":1000000000000000,\"bounce\":true,\"allBalance\":false,\"payload\":\"\"}" \
        --abi $SAFE_ABI \
        --sign $MSIG_KEYS_JSON_PATH
