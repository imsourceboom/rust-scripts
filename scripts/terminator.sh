#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG call $NEW_DEPOOL_ADDR \
	terminator {} \
	--abi $DEPOOL_ABI \
	--sign $NEW_DEPOOL_KEYS_JSON_PATH
