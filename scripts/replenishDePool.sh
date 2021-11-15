#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
	--addr $NEW_DEPOOL_ADDR \
	replenish \
	--value $1 \
	--wallet $VALIDATOR_ADDR \
	--sign $MSIG_KEYS_JSON_PATH
