#!/bin/bash

cd $HOME
sudo apt-get update && sudo apt-get install -y \
    gpg \
    tar \
    cmake \
    build-essential \
    pkg-config \
    libssl-dev \
    libtool \
    m4 \
    automake \
    clang \
    git \
    libzstd-dev \
    libgoogle-perftools-dev \
    gnupg2 \
    librdkafka-dev \
    curl

cd $HOME
git clone https://github.com/tonlabs/ton-labs-node.git
cd $HOME/ton-labs-node
git submodule init
git submodule update
cargo update && cargo build --release --features "metrics"
cd $HOME/ton-labs-node/target/release
cp ton_node $HOME/rust-scripts/tools

cd $HOME
git clone https://github.com/tonlabs/ton-labs-node-tools.git
cd $HOME/ton-labs-node-tools
git submodule init
git submodule update
cargo update && cargo build --release
cd $HOME/ton-labs-node-tools/target/release
cp console $HOME/rust-scripts/tools
cp keygen $HOME/rust-scripts/tools

cd $HOME/ton-labs-node
git rev-parse HEAD
cd $HOME/ton-labs-node/target/release
./ton_node

cd $HOME/ton-labs-node-tools
git rev-parse HEAD
cd $HOME/ton-labs-node-tools/target/release
./console

cd $HOME
rm -rf $HOME/ton-labs-node $HOME/ton-labs-node-tools
