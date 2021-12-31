#!/bin/bash

# Copy configs directory
docker cp rnode:/ton-node/configs $HOME

# Monitoring Off
pm2 stop 0

# Clean rnode
cd $HOME/rustnet.ton.dev/docker-compose/ton-node
docker-compose down && git reset --hard origin/main && git clean -ffdx

# Remove rustnet.ton.dev
cd $HOME
sudo rm -rf $HOME/rustnet.ton.dev

# Reclone rustnet.ton.dev
cd $HOME
git clone https://github.com/tonlabs/rustnet.ton.dev.git

# Change depool env value
sed -i "s|DEPOOL_ENABLE=.*|DEPOOL_ENABLE=\"yes\"|g" $HOME/rustnet.ton.dev/scripts/env.sh

# Install
cd $HOME/rustnet.ton.dev/scripts
. ./env.sh
./install_deps.sh
./deploy.sh 2>&1 | tee ./deploy.log

# Wait and monitoring On
sleep 7200
pm2 restart 0
