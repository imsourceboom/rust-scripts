#!/bin/bash

. $HOME/rust-scripts/scripts/rust-env.sh

ELECTIONS_ID=$(rust-election-id.sh)
if [ $ELECTIONS_ID = "-1" ]; then
   echo "ERROR: Can't get election date"
   exit
fi

if [ $ELECTIONS_ID = "0" ]; then
   echo "STOPPED";
   exit
fi

if (( $ELECTIONS_ID > 0 ));then
   echo "ACTIVE";
   exit
fi

echo "ERROR: unknown election id $ELECTIONS_ID";
