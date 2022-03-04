#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS run $DEPOOL_ADDR \
        getRounds {} \
        --abi $DEPOOL_ABI
