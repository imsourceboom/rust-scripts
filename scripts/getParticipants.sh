#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS run $DEPOOL_ADDR \
        getParticipants {} \
        --abi $DEPOOL_ABI
