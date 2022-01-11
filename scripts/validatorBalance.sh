#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

ADDR=$($TONOS account $VALIDATOR_ADDR | grep "address:")
BALANCE=$($TONOS account $VALIDATOR_ADDR | grep "balance:" | awk '{print $2}')
TON_BALANCE=$($SCRIPTS_DIR/hex2gram.sh $BALANCE)
echo $ADDR
echo "balance: $TON_BALANCE"
