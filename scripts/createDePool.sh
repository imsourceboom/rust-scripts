#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

if [ ! -d $HOME/latest-depool-key ]; then
	mkdir $HOME/latest-depool-key
fi

NEW_PATH="$HOME/latest-depool-key"

SEED_PHRASE=$($TONOS_CLI -c $TONOS_CLI_CONFIG genphrase | sed -n '3p' | cut -f 3- -d ' ' | tr -d \")
echo $SEED_PHRASE > $NEW_PATH/depool.seed
$TONOS_CLI -c $TONOS_CLI_CONFIG getkeypair $NEW_PATH/depool.keys.json "$SEED_PHRASE"

DEPOOL_ADDRESS=$($TONOS_CLI -c $TONOS_CLI_CONFIG genaddr $DEPOOL_TVC $DEPOOL_ABI --setkey $NEW_PATH/depool.keys.json --wc 0)
echo "$DEPOOL_ADDRESS" | grep "Raw address:" | cut -f 3 -d ' ' > $NEW_PATH/depool.addr
