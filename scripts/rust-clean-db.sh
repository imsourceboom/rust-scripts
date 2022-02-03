#!/bin/bash

DOCKER_DIR="$HOME/main.ton.dev/docker-compose/ton-node"
TOOLS_DIR="$HOME/rust-scripts/tools"

cd $DOCKER_DIR
tmux new -ds clear
tmux send -t clear.0 "docker cp rnode:/ton-node/tools/tonos-cli.conf.json $TOOLS_DIR/tools" ENTER
tmux send -t clear.0 "echo 'scripts start' && date '+%F %a %T' && df -h / && pm2 stop 0 && docker-compose down -v && docker-compose up -d && df -h / && sleep 5" ENTER
tmux send -t clear.0 "docker cp $TOOLS_DIR/tools/tonos-cli.conf.json rnode:/ton-node/tools" ENTER
tmux send -t clear.0 "sleep 18000 && pm2 restart 0" ENTER
