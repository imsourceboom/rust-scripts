#!/bin/bash

VALIDATE=$(docker exec -t rnode /ton-node/tools/console -C /ton-node/configs/console.json -c getstats | grep 'in_current_vset_p34' | awk '{print $2}' | tr -d ,)
echo $VALIDATE
