#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

DATE=$(date)
DEPOOL_BALANCE=$($HOME/rust-scripts/scripts/getDePoolBalance.sh | grep 'value0' | awk '{print $2}' | tr -d '"')

if [ $DEPOOL_BALANCE -le 21000000000 ]; then
	echo "--------------------------------------"
	SUCCEEDED=$($HOME/rust-scripts/scripts/replenishDePool.sh 2 | grep 'Succeeded')
	echo "$SUCCEEDED Refilled DePool Balance !!!"
	DEPOOL_HEX_REFILL=$($HOME/rust-scripts/scripts/hex2gram.sh 2000000000)
	echo "Refilled Amount: $DEPOOL_HEX_REFILL"
	echo $DATE
	echo "--------------------------------------"
else
	echo "DePool Enough Balance !!!"
	DEPOOL_HEX_BALANCE=$($HOME/rust-scripts/scripts/hex2gram.sh $DEPOOL_BALANCE)
	echo "DePool Balance: $DEPOOL_HEX_BALANCE"
fi
