#!/bin/bash

. $HOME/rustcup/scripts/rust-env.sh

ELECTIONS_ID=$(ton-election-id.sh)
if [ $ELECTIONS_ID = "-1" ]; then
   echo "ERROR: Can't get election date"
   exit
fi

if [ $ELECTIONS_ID = "0" ]; then
   echo "-1";
   exit
fi

ELECTOR_CONFIG=`$TONOS_CLI -c $TONOS_CLI_CONFIG getconfig 15` 
ELECTOR_CONFIG_JSON=$(echo $ELECTOR_CONFIG | awk '{split($0, a, "p15:"); print a[2]}')
ELECTOR_CONFIG_ELECTIONS_START_BEFORE=`echo "$ELECTOR_CONFIG_JSON" | jq ".elections_start_before"`

echo $(($ELECTIONS_ID - $ELECTOR_CONFIG_ELECTIONS_START_BEFORE))
