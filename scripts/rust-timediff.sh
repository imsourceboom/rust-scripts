#!/bin/bash

GETSTATS=$(docker exec -t rnode /ton-node/tools/console -C /ton-node/configs/console.json -jc getstats)
TIMEDIFF=$(echo $GETSTATS | jq -r '.timediff')
SHARDS_TIMEDIFF=$(echo $GETSTATS | jq -r '.shards_timediff')
SYNC_STATUS=$(echo $GETSTATS | jq -r '.sync_status')

echo $TIMEDIFF
echo $SHARDS_TIMEDIFF
echo $SYNC_STATUS