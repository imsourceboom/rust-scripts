#!/bin/bash

cd $HOME

sudo apt-get update -y
sudo apt-get install curl jq wget bc tmux -y
curl -fsSL https://get.docker.com/ | sudo sh
sudo usermod -aG docker $USER

echo '-----------------------'
echo 'Please!! Reconnect to the server And install main.ton.dev'
echo 'git clone https://github.com/tonlabs/main.ton.dev.git'
echo '-----------------------'
