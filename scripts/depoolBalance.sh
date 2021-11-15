#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

ADDR=$($SCRIPTS_DIR/getDePoolBalance.sh | grep "address:")
BALANCE=$($SCRIPTS_DIR/getDePoolBalance.sh | grep "value0" | awk '{print $2}' | tr -d \")
TON_BALANCE=$($SCRIPTS_DIR/hex2gram.sh $BALANCE)
echo $ADDR
echo "balance: $TON_BALANCE"
