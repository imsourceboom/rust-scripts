#!/bin/bash

TIMEDIFF=$(docker exec -t rnode /ton-node/tools/console -C /ton-node/configs/console.json -jc getstats | jq -r '.timediff')
echo $TIMEDIFF
