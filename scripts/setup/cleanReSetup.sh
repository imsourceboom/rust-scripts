#!/bin/bash

# Copy configs directory
docker cp rnode:/ton-node/configs $HOME

# Monitoring Off
pm2 stop 0

# Clean rnode
cd $HOME/main.ton.dev/docker-compose/ton-node
docker-compose down && git reset --hard origin/master && git clean -ffdx

# Remove main.ton.dev
cd $HOME
sudo rm -rf $HOME/main.ton.dev

# Reclone main.ton.dev
cd $HOME
git clone https://github.com/tonlabs/main.ton.dev.git

# Change depool env value
sed -i "s|DEPOOL_ENABLE=.*|DEPOOL_ENABLE=\"yes\"|g" $HOME/main.ton.dev/scripts/env.sh

# Install
cd $HOME/main.ton.dev/scripts
. ./env.sh
./install_deps.sh
./deploy.sh 2>&1 | tee ./deploy.log

sleep 5
# rnode Stop
cd $HOME/main.ton.dev/docker-compose/ton-node
docker-compose stop

# Copy configs directory to rnode
sudo rm -rf $HOME/main.ton.dev/docker-compose/ton-node/configs
sudo cp -r $HOME/configs $HOME/main.ton.dev/docker-compose/ton-node

# rnode Restart
cd $HOME/main.ton.dev/docker-compose/ton-node
docker-compose restart
