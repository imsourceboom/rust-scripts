#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

get_election_date ()
{
   ELECTIONS_ID=$($TONOS_CLI -c $TONOS_CLI_CONFIG runget $ELECTOR_ADDR active_election_id  | grep 'Result:' | sed 's/Result:[[:space:]]*//g' | tr -d \"[])
}

# rustcup have unique elector
get_election_date_rustcup ()
{
   ELECTION_RESULT=`$TONOS_CLI -c $TONOS_CLI_CONFIG run $ELECTOR_ADDR active_election_id {} --abi $ELECTOR_ABI`
   ELECTIONS_ID=$(echo $ELECTION_RESULT | awk -F'Result: ' '{print $2}' | jq -r '.value0'  )
}

# get elector address
ELECTOR_ADDR="-1:$($TONOS_CLI -c $TONOS_CLI_CONFIG  getconfig 1 | grep 'p1:' | sed 's/Config p1:[[:space:]]*//g' | tr -d \")"

if [ $TON_IS_RUSTNET -eq 1 ]; then
   get_election_date_rustcup
else
   get_election_date
fi

if [ -z $ELECTIONS_ID ]; then
   echo "-1";
   exit
fi

echo "$ELECTIONS_ID"
