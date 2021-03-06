#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

if [ $# == 0 ]; then
	$TONOS run $DEPOOL_ADDR \
	        getParticipantInfo "{\"addr\":\"$VALIDATOR_ADDR\"}" \
	        --abi $DEPOOL_ABI
	exit 0
fi

$TONOS run $DEPOOL_ADDR \
        getParticipantInfo "{\"addr\":\"$1\"}" \
        --abi $DEPOOL_ABI

