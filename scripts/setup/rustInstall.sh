#!/bin/bash

curl https://sh.rustup.rs -sSf | sh
sleep 5
source $HOME/.cargo/env
sleep 3
rustc --version
