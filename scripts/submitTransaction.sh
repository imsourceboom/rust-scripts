#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

$TONOS_CLI -c $TONOS_CLI_CONFIG call \
	$VALIDATOR_ADDR \
	submitTransaction \
	"{\"dest\":\"$1\",\"value\":$2,\"bounce\":true,\"allBalance\":false,\"payload\":\"\"}" \
	--abi $SAFE_ABI \
	--sign $MSIG_KEYS_JSON_PATH
