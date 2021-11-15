#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
	--addr $NEW_DEPOOL_ADDR \
	ticktock \
	-w $VALIDATOR_ADDR \
	-s $MSIG_KEYS_JSON_PATH
