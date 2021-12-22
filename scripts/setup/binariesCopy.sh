#!/bin/bash

docker cp $HOME/rust-scripts/tools/ton_node rnode:/ton-node/ton_node_no_kafka
docker cp $HOME/rust-scripts/tools/console rnode:/ton-node/tools/
docker cp $HOME/rust-scripts/tools/keygen rnode:/ton-node/tools/
