#!/bin/bash

cd $HOME/rust-scripts/scripts && mv rust-confirm-transaction.sh $HOME

cd $HOME/rust-scripts && git pull

cd $HOME && mv rust-confirm-transaction.sh $HOME/rust-scripts/scripts
