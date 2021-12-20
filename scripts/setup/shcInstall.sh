#!/bin/bash

sudo apt update -y
sudo apt install build-essential -y

cd $HOME
wget https://github.com/neurobin/shc/archive/4.0.3.tar.gz
tar xvfz 4.0.3.tar.gz
rm 4.0.3.tar.gz

cd shc-4.0.3
./configure
make
sudo make install && cd $HOME && rm -rf shc*
