#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG run $NEW_DEPOOL_ADDR \
        getParticipants {} \
        --abi $DEPOOL_ABI
