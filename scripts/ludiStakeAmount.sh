#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

GET_PARTICIPANT_INFO=$($SCRIPTS_DIR/getParticipantInfo.sh)
TOTAL_STAKING=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.total' | xargs hex2gram.sh)
#ORDINARY_ROUND_LENGTH=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.stakes | length')
VESTING_ROUND_LENGTH=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.vestings | length')
#LOCK_ROUND_LENGTH=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r '.locks | length')

echo "total staking amount: $TOTAL_STAKING"

for ((i = 0; i < $VESTING_ROUND_LENGTH; i++))
do
	ORDINARY_ROUND=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".stakes | to_entries[$i] | .key")
	ORDINARY_AMOUNT=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".stakes | to_entries[$i] | .value")
	#echo "ordinary $ORDINARY_ROUND: $ORDINARY_AMOUNT"

	VESTING_ROUND=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".vestings | to_entries[$i] | .key")
	VESTING_AMOUNT=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".vestings | to_entries[$i] | .value.remainingAmount")
	#echo "vesting $VESTING_ROUND: $VESTING_AMOUNT"

	LOCK_ROUND=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".locks | to_entries[$i] | .key")
	LOCK_AMOUNT=$(echo $GET_PARTICIPANT_INFO | awk -F "Result: " '{print $2}' | jq -r ".locks | to_entries[$i] | .value.remainingAmount")
	#echo "lock $LOCK_ROUND: $LOCK_AMOUNT"

	ROUND=$VESTING_ROUND
	AMOUNT_SUM=$(expr $ORDINARY_AMOUNT + $VESTING_AMOUNT + $LOCK_AMOUNT | xargs hex2gram.sh)
	echo "Round $ROUND amount: $AMOUNT_SUM"
done

#echo "ordinary round length: $ORDINARY_ROUND_LENGTH"
#echo "vesting round length: $VESTING_ROUND_LENGTH"
#echo "lock round length: $LOCK_ROUND_LENGTH"
