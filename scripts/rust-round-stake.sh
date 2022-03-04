#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

GET_ROUNDS_STAKE=$(./getRounds.sh |  grep '"stake":')
ODD_ROUND_STAKE=$(echo $GET_ROUNDS_STAKE | awk '{print $2}' | tr -d '",' | xargs hex2gram.sh)
EVEN_ROUND_STAKE=$(echo $GET_ROUNDS_STAKE | awk '{print $4}' | tr -d '",' | xargs hex2gram.sh)

echo "Odd Round: $ODD_ROUND_STAKE"
echo "Even Round: $EVEN_ROUND_STAKE"

