#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

GET_ROUNDS=$(./getRounds.sh)
STAKE=$(echo "$GET_ROUNDS" |  grep '"stake":')
VALIDATOR_STAKE=$(echo "$GET_ROUNDS" |  grep '"validatorStake":')
TOTAL_ODD_ROUND_STAKE=$(echo $STAKE | awk '{print $2}' | tr -d '",' | xargs hex2gram.sh)
TOTAL_EVEN_ROUND_STAKE=$(echo $STAKE | awk '{print $4}' | tr -d '",' | xargs hex2gram.sh)
VALIDATOR_ODD_ROUND_STAKE=$(echo $VALIDATOR_STAKE | awk '{print $2}' | tr -d '",' | xargs hex2gram.sh)
VALIDATOR_EVEN_ROUND_STAKE=$(echo $VALIDATOR_STAKE | awk '{print $4}' | tr -d '",' | xargs hex2gram.sh)

echo "Odd Round: $TOTAL_ODD_ROUND_STAKE"
echo "Even Round: $TOTAL_EVEN_ROUND_STAKE"
echo "Validator Odd Round: $VALIDATOR_ODD_ROUND_STAKE"
echo "Validator Even Round: $VALIDATOR_EVEN_ROUND_STAKE"
