#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

GET_DEPOOL_INFO=$($TONOS run $DEPOOL_ADDR getDePoolInfo {} --abi $DEPOOL_ABI)

if [ $1 == "minStake" ]; then
	MIN_STAKE=$(echo $GET_DEPOOL_INFO | awk -F 'Result: ' '{print $2}' | jq ".minStake" | xargx hex2gram.sh)
	echo $MIN_STAKE
	exit
fi

echo $GET_DEPOOL_INFO
