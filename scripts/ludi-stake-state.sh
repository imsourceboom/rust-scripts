#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

GET_PARTICIPANT_INFO=$($SCRIPTS_DIR/getParticipantInfo.sh)
TOTAL_STAKING=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.total' | xargs hex2gram.sh)
#ORDINARY_ROUND_LENGTH=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.stakes | length')
VESTING_ROUND_LENGTH=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.vestings | length')
#LOCK_ROUND_LENGTH=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.locks | length')

echo "Total staking amount: $TOTAL_STAKING"
echo "----------------------------"

ORDINARY_SUM=0
VESTING_SUM=0
LOCK_SUM=0

for ((i = 0; i < $VESTING_ROUND_LENGTH; i++))
do
	ORDINARY_ROUND=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".stakes | to_entries[$i] | .key")
	ORDINARY_AMOUNT=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".stakes | to_entries[$i] | .value")
	ORDINARY_AMOUNT_HEX=$(echo $ORDINARY_AMOUNT | xargs hex2gram.sh)
	ORDINARY_SUM=$(expr $ORDINARY_SUM + $ORDINARY_AMOUNT)
	echo "ordinary $ORDINARY_ROUND: $ORDINARY_AMOUNT_HEX"

	VESTING_ROUND=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".vestings | to_entries[$i] | .key")
	VESTING_AMOUNT=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".vestings | to_entries[$i] | .value.remainingAmount")
	VESTING_AMOUNT_HEX=$(echo $VESTING_AMOUNT | xargs hex2gram.sh)
	VESTING_SUM=$(expr $VESTING_SUM + $VESTING_AMOUNT)
	echo "vesting $VESTING_ROUND: $VESTING_AMOUNT_HEX"

	LOCK_ROUND=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".locks | to_entries[$i] | .key")
	LOCK_AMOUNT=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".locks | to_entries[$i] | .value.remainingAmount")
	LOCK_AMOUNT_HEX=$(echo $LOCK_AMOUNT | xargs hex2gram.sh)
	LOCK_SUM=$(expr $LOCK_SUM + $LOCK_AMOUNT)
	echo "lock $LOCK_ROUND: $LOCK_AMOUNT_HEX"

	ROUND=$VESTING_ROUND
	AMOUNT_SUM=$(expr $ORDINARY_AMOUNT + $VESTING_AMOUNT + $LOCK_AMOUNT | xargs hex2gram.sh)
	echo "Round $ROUND amount: $AMOUNT_SUM"
	echo "----------------------------"
done

echo "Ordinary sum: $(echo $ORDINARY_SUM | xargs hex2gram.sh)"
echo "Vesting sum: $(echo $VESTING_SUM | xargs hex2gram.sh)"
echo "Lock sum: $(echo $LOCK_SUM | xargs hex2gram.sh)"

#echo "ordinary round length: $ORDINARY_ROUND_LENGTH"
#echo "vesting round length: $VESTING_ROUND_LENGTH"
#echo "lock round length: $LOCK_ROUND_LENGTH"
