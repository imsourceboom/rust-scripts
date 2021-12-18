#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG run $DEPOOL_ADDR getDePoolBalance {} --abi $DEPOOL_ABI
