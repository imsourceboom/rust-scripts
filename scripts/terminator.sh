#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG call $DEPOOL_ADDR \
	terminator {} \
	--abi $DEPOOL_ABI \
	--sign $DEPOOL_KEYS_JSON_PATH
