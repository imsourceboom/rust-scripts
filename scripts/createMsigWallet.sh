#!/bin/bash

. rust-env.sh

MSIG_GENADDR=$($TONOS genaddr --genkey $KEYS_DIR/msig.keys.json --wc 0 $SAFE_TVC --abi $SAFE_ABI)
echo "$MSIG_GENADDR" | echo "Seed phrase" | cut -d ' ' -f 3- | tr -d '"' > $KEYS_DIR/validator.seed
echo "$MSIG_GENADDR" | echo "Raw address" | awk '{print $3}' > $KEYS_DIR/validator.addr
