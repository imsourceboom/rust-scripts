#!/bin/bash

. $HOME/rust-rustcup/scripts/rust-env.sh

ADDR=$($TONOS_CLI -c $TONOS_CLI_CONFIG account $VALIDATOR_ADDR | grep "address:")
BALANCE=$($TONOS_CLI -c $TONOS_CLI_CONFIG account $VALIDATOR_ADDR | grep "balance:" | awk '{print $2}')
TON_BALANCE=$($SCRIPTS_DIR/hex2gram.sh $BALANCE)
echo $ADDR
echo "balance: $TON_BALANCE"
