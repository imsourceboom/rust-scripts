#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG run $VALIDATOR_ADDR getTransactions {} --abi $SAFE_ABI
