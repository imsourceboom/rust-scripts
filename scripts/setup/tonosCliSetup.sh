#!/bin/bash

cd $HOME

sudo apt-get install libssl-dev pkg-config

git clone https://github.com/tonlabs/tonos-cli.git
cd tonos-cli
cargo update
cargo build --release
cd target/release
