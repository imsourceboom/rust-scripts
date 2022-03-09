#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh


if [ $# -eq 1 ]; then
	$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
		--addr $DEPOOL_ADDR events | head -n $1
	exit
fi

$TONOS_CLI -c $TONOS_CLI_CONFIG depool \
	--addr $DEPOOL_ADDR events

