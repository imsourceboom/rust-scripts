#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

if [ $# -eq 0 ]; then
	echo "Parameter is Required !"
	echo "ordinaryStake.sh [stake - gram]"
	exit
fi

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
       --addr $DEPOOL_ADDR \
       stake ordinary \
       --wallet $VALIDATOR_ADDR \
       --value $1 \
       --sign $MSIG_KEYS_JSON_PATH
