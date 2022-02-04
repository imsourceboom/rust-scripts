#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

VALIDATOR_BALANCE=$($TONOS account $VALIDATOR_ADDR | grep balance | awk '{print $2}')
VALIDATOR_BALANCE_HALF=$(expr $VALIDATOR_BALANCE / 2)
MIN_STAKE=$(getDePoolInfo.sh minStake)
MIN_STAKE_NANO="$(echo $MIN_STAKE | cut -d '.' -f 1)000000000"
STAKE_AMOUNT=$(expr $VALIDATOR_BALANCE_HALF - $MIN_STAKE_NANO)
STAKE_AMOUNT_GRAM=$(expr $STAKE_AMOUNT / 1000000000)

if [ $STAKE_AMOUNT -lt $MIN_STAKE_NANO ]; then
	echo "stake amount low"
	exit
fi

cd $SCRIPTS_DIR
tmux new -ds stake
tmux send -t stake.0 "./ordinaryStake.sh $STAKE_AMOUNT_GRAM && sleep 65536 && ./ordinaryStake.sh $STAKE_AMOUNT_GRAM"
