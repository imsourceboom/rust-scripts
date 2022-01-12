#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

$TONOS call \
	$HELPER_ADDR \
	sendTicktock {} \
	--abi $DEPOOL_HELPER_ABI \
	--sign $HELPER_KEYS_JSON_PATH
