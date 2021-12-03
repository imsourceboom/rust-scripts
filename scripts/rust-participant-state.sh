#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

get_participants ()
{
   TON_PARTICIPANTS_CURRENT=$($TONOS_CLI -c $TONOS_CLI_CONFIG runget $ELECTOR_ADDR participant_list_extended)
}

# rustcup have unique elector
get_participants_rustcup ()
{
   TON_ELECTOR_GET=$($TONOS_CLI -c $TONOS_CLI_CONFIG run $ELECTOR_ADDR get {} --abi $ELECTOR_ABI)
   TON_PARTICIPANTS_CURRENT=$(echo $TON_ELECTOR_GET | awk -F'Result: ' '{print $2}' | jq ".cur_elect")
}


ELECTION_STATE=$(rust-election-state.sh)
if [ $ELECTION_STATE != "ACTIVE" ]; then
   echo "UNKNOWN"
   exit
fi

ELECTIONS_ID=$(rust-election-id.sh)
if [ $ELECTIONS_ID = "-1" ]; then
   echo "ERROR: Can't get election date"
   exit
fi

if [ $ELECTIONS_ID = "0" ]; then
   echo "UNKNOWN"
   exit
fi

# get elector address
ELECTOR_ADDR="-1:$($TONOS_CLI -c $TONOS_CLI_CONFIG  getconfig 1 | grep 'p1:' | sed 's/Config p1:[[:space:]]*//g' | tr -d \")"


#cat $TON_NODE_CONFIG
TON_VALIDATOR_KEYS_COUNT=$(docker exec -t rnode cat /ton-node/configs/config.json | jq '.validator_keys|length')

if [[ $TON_VALIDATOR_KEYS_COUNT == 0 ]]; then
   echo "NOT_FOUND"
   exit 0
fi

if [ $TON_IS_RUSTNET -eq 1 ]; then
   get_participants_rustcup
else
   get_participants
fi

for (( i=0; i<$TON_VALIDATOR_KEYS_COUNT; i++ ))
do
   TON_KEYS_FOR_ELECTION_ID=$(docker exec -t rnode cat /ton-node/configs/config.json | jq ".validator_keys[$i].election_id")

   if [ $TON_KEYS_FOR_ELECTION_ID == $ELECTIONS_ID ]; then

      TON_ADNL_KEY_HASH=$(docker exec -t rnode cat /ton-node/configs/config.json | jq ".validator_keys[$i].validator_key_id" | tr -d \")
      TON_ADNL_KEY="$(docker exec -t rnode /ton-node/tools/console -C /ton-node/configs/console.json -c "exportpub $TON_ADNL_KEY_HASH" | awk -F"imported key:" '{print $2}' | awk -F" " '{print $1}' )"
      TON_ADNL_KEY_FROM_ELECTOR=$( echo "$TON_PARTICIPANTS_CURRENT"  | grep $TON_ADNL_KEY)

      if [ -z "$TON_ADNL_KEY_FROM_ELECTOR" ]; then
            echo "NOT_FOUND"
            exit
      else
            echo "ACTIVE"
            exit
      fi
   fi
done

echo "NOT_FOUND"
