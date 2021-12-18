#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG run $DEPOOL_ADDR \
        getParticipantInfo "{\"addr\":\"$VALIDATOR_ADDR\"}" \
        --abi $DEPOOL_ABI
