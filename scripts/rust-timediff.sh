#!/bin/bash

TIMEDIFF=$(docker exec -t rnode /ton-node/tools/console -C /ton-node/configs/console.json -c getstats | grep 'timediff' | awk '{print $2}' | tr -d ,)
echo $TIMEDIFF
