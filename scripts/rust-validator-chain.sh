#!/bin/bash

source "$HOME/rust-scripts/scripts/rust-env.sh"

GETSTATS=$(docker exec -it rnode /ton-node/tools/console -C /ton-node/configs/console.json -jc getstats)
ADNL_ADDR=$(echo $GETSTATS | jq -r ".current_vset_p34_adnl_id")

if [ -z $ADNL_ADDR ]; then
	echo "NOT_VALIDATE"
	exit
fi

ADNL_ADDR_HEX=$(echo $ADNL_ADDR | base64 -d | od -t x1 -An | tr -d ' \n')
GETCONFIG_34=$($TONOS_CLI -c $TONOS_CLI_CONFIG getconfig 34)
VALIDATOR_LIST=$(echo $GETCONFIG_34 | awk -F 'p34: ' '{print $2}' | jq ".list")
VALIDATOR_LENGTH=$(echo $VALIDATOR_LIST | jq "length")

for (( i = 0; i < $VALIDATOR_LENGTH; i++ ))
do
	FIND_ADNL=$(echo $VALIDATOR_LIST | jq -r ".[$i].adnl_addr")
	if [ $FIND_ADNL = $ADNL_ADDR_HEX ]; then
		echo "Validator index: $(($i + 1))"
		echo "ADNL address: $FIND_ADNL"

		if [ $i -lt 100 ]; then
			echo "Chain: Master"
			exit
		else
			echo "Chain: Shard"
			exit
		fi
	fi
done
