#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS run $VALIDATOR_ADDR getTransactions {} --abi $SAFE_ABI
