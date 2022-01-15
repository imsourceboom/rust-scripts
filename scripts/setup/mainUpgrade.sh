#!/bin/bash

pm2 stop 0

cd $HOME
git clone https://github.com/tonlabs/main.ton.dev.git

sed -i "s|DEPOOL_ENABLE=.*|DEPOOL_ENABLE=\"yes\"|g" $HOME/main.ton.dev/scripts/env.sh

cp -r $HOME/rustnet.ton.dev/docker-compose/ton-node/configs $HOME/main.ton.dev/docker-compose/ton-node

cd $HOME/main.ton.dev/scripts
./upgrade.sh 2>&1 | tee ./upgrade.log

sudo rm -rf $HOME/rustnet.ton.dev

cp $HOME/rust-scripts/configs/bash.config ~/.bashrc && source $HOME/.bashrc

sleep 10
docker exec -it rnode /ton-node/tools/console -C /ton-node/configs/console.json -c getstats | grep 'COMMIT_ID'
docker exec -it rnode /ton-node/ton_node_no_kafka --help | grep 'TON Node'
