#!/bin/bash

# Direactories
SCRIPTS_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)
export SCRIPTS_DIR
ROOT_DIR=$(cd "${SCRIPTS_DIR}/../" && pwd -P)
export ROOT_DIR
export KEYS_DIR="$HOME/keys"
export TOOLS_DIR="$ROOT_DIR/tools"

# tools
export TONOS_CLI="$TOOLS_DIR/tonos-cli"
export TONOS_CLI_CONFIG="$TOOLS_DIR/tonos-cli.conf.json"
export TONOS="$TONOS_CLI -c $TONOS_CLI_CONFIG"
export TVM_LINKER="$TOOLS_DIR/tvm_linker"

# Keys
export VALIDATOR_PATH="$KEYS_DIR/validator.addr"
export VALIDATOR_ADDR=$(cat $VALIDATOR_PATH)
export MSIG_KEYS_JSON_PATH="$KEYS_DIR/msig.keys.json"
export DEPOOL_PATH="$KEYS_DIR/depool.addr"
export DEPOOL_KEYS_JSON_PATH="$KEYS_DIR/depool.keys.json"
export DEPOOL_ADDR=$(cat $DEPOOL_PATH)
export HELPER_PATH="$KEYS_DIR/helper.addr"
export HELPER_KEYS_JSON_PATH="$KEYS_DIR/helper.keys.json"
export HELPER_ADDR=$(cat $HELPER_PATH)

# Contracts
export DEPOOL_TVC="$TOOLS_DIR/DePool.tvc"
export DEPOOL_ABI="$TOOLS_DIR/DePool.abi.json"
export DEPOOL_HELPER_TVC="$TOOLS_DIR/DePoolHelper.tvc"
export DEPOOL_HELPER_ABI="$TOOLS_DIR/DePoolHelper.abi.json"
export PROXY_TVC="$TOOLS_DIR/DePoolProxy.tvc"
export SAFE_TVC="$TOOLS_DIR/SafeMultisigWallet.tvc"
export SAFE_ABI="$TOOLS_DIR/SafeMultisigWallet.abi.json"
export ELECTOR_ABI="$TOOLS_DIR/Elector.abi.json"

# it is rustnet
# 0 = false
# 1 = true
export TON_IS_RUSTNET=0
