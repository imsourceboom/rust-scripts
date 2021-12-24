#!/bin/bash

KEYS_PATH="$HOME/keys"

docker cp $KEYS_PATH/validator.addr rnode:/ton-node/configs/my_validator.addr
docker exec -it rnode mkdir /ton-node/configs/keys
docker cp $KEYS_PATH/msig.keys.json rnode:/ton-node/configs/keys
docker cp $KEYS_PATH/depool.addr rnode:/ton-node/configs
