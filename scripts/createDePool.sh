#!/bin/bash

. rust-env.sh

DEPOOL_GENADDR=$($TONOS genaddr --genkey $KEYS_DIR/depool.keys.json --wc 0 $DEPOOL_TVC --abi $DEPOOL_ABI)
echo "$DEPOOL_GENADDR" | echo "Seed phrase" | cut -d ' ' -f 3- | tr -d '"' > $KEYS_DIR/depool.seed
echo "$DEPOOL_GENADDR" | echo "Raw address" | awk '{print $3}' > $KEYS_DIR/depool.addr

