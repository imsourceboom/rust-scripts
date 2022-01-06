#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG call \
	sendTickTock {} \
	--abi $DEPOOL_HELPER_ABI \
	--sign $HELPER_KEYS_JSON_PATH
