#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

PROXY_CODE=$($TVM_LINKER decode --tvc $PROXY_TVC | grep 'code:' | awk '{print $2}')

$TONOS_CLI -c $TONOS_CLI_CONFIG deploy $DEPOOL_TVC \
        "{\"minStake\":1000000000000000,\"validatorAssurance\":1000000000000000,\"proxyCode\":\"$PROXY_CODE\",\"validatorWallet\":\"$VALIDATOR_ADDR\",\"participantRewardFraction\":99}" \
        --abi $DEPOOL_ABI \
        --sign $NEW_DEPOOL_KEYS_JSON_PATH \
        --wc 0
