#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS run $DEPOOL_ADDR \
        getDePoolInfo {} \
        --abi $DEPOOL_ABI
