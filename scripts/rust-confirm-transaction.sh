#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

CUSTODIAN_KEY=""

GET_TRANSACTIONS="$($TONOS_CLI -c $TONOS_CLI_CONFIG run $VALIDATOR_ADDR getTransactions {} --abi $SAFE_ABI)" 
TRANSACTIONS_COUNT=$(echo $GET_TRANSACTIONS | awk -F'Result: ' '{print $2}' | jq '.transactions|length')

if [[ $TRANSACTIONS_COUNT == 0 ]]; then
   echo "INFO: nothing to confirm"
   exit 0
fi

for (( i=0; i<$TRANSACTIONS_COUNT; i++ ))
do  
   DESTINATION_ADDR=$(echo $GET_TRANSACTIONS | awk -F"Result: " '{print $2}' | jq ".transactions[$i].dest" | tr -d \")
   TRANSACTION_ID=$(echo $GET_TRANSACTIONS | awk -F"Result: " '{print $2}' | jq ".transactions[$i].id")
   if [ $DESTINATION_ADDR == $DEPOOL_ADDR ]; then
      $TONOS_CLI -c $TONOS_CLI_CONFIG  call $VALIDATOR_ADDR confirmTransaction "{\"transactionId\":$TRANSACTION_ID}" --abi $SAFE_ABI --sign "$CUSTODIAN_KEY"
   else
      echo "WARNING: unknown destination $DESTINATION_ADDR for wallet $VALIDATOR_ADDR"
   fi
done
