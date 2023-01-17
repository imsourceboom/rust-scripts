#!/bin/bash

RUST_SCRIPTS_DIR="$HOME/rust-scripts"
TOOLS_DIR="$RUST_SCRIPTS_DIR/tools"

# Check tools directory
if [ ! -d $TOOLS_DIR ]; then
        cd $RUST_SCRIPTS_DIR
        mkdir tools
fi

# Copy tools
docker cp rnode:/ton-node/tools/tonos-cli $RUST_SCRIPTS_DIR/tools
docker cp rnode:/ton-node/tools/tonos-cli.conf.json $RUST_SCRIPTS_DIR/tools
docker cp rnode:/ton-node/configs/Elector.abi.json $RUST_SCRIPTS_DIR/tools


# Check tonos-cli config json
cd $TOOLS_DIR
if [ ! -f "tonos-cli.conf.json" ]; then
	./tonos-cli config endpoint add main.evercloud.dev "https://mainnet.evercloud.dev"
	./tonos-cli config --url main.evercloud.dev
fi

if [ ! -d "$TOOLS_DIR/ton-labs-contracts" ]; then
	git clone https://github.com/tonlabs/ton-labs-contracts.git
	sleep 3
	cd $TOOLS_DIR/ton-labs-contracts/solidity/safemultisig
	cp SafeMultisigWallet.tvc $TOOLS_DIR
	cp SafeMultisigWallet.abi.json $TOOLS_DIR
	cd $TOOLS_DIR/ton-labs-contracts/solidity/depool
	cp DePool.tvc $TOOLS_DIR
	cp DePool.abi.json $TOOLS_DIR
	cp DePoolHelper.tvc $TOOLS_DIR
	cp DePoolHelper.abi.json $TOOLS_DIR
	rm -rf $TOOLS_DIR/ton-labs-contracts
fi
