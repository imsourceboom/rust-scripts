#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS run $DEPOOL_ADDR getDePoolBalance {} --abi $DEPOOL_ABI
