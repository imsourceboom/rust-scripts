#!/bin/bash

SCRIPTS_DIR="$HOME/rust-scripts"

# Check tools directory
if [ ! -d $SCRIPTS_DIR/tools ]; then
        cd $SCRIPTS_DIR
        mkdir tools
fi

# Copy tools
docker cp rnode:/ton-node/tools/tonos-cli $SCRIPTS_DIR/tools
docker cp rnode:/ton-node/tools/tonos-cli.conf.json $SCRIPTS_DIR/tools
docker cp rnode:/ton-node/configs/Elector.abi.json $SCRIPTS_DIR/tools

# Config endpoint
#cd $OPERATOR_DIR/tools
#./tonos-cli config endpoint add rust.ton.dev "https://rustnet1.ton.dev","https://rustnet2.ton.dev"
#./tonos-cli config --url https://rustnet.ton.dev
