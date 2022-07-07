#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

BALANCE=$($SCRIPTS_DIR/getDePoolBalance.sh | grep "value0" | awk '{print $2}' | tr -d \")
TON_BALANCE=$($SCRIPTS_DIR/hex2gram.sh $BALANCE)
echo $DEPOOL_ADDR
echo "balance: $TON_BALANCE"
