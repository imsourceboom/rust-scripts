#!/bin/bash

DOCKER_DIR="$HOME/main.ton.dev/docker-compose/ton-node"
TOOLS_DIR="$HOME/rust-scripts/tools"

sed -i "s|DEPOOL_ENABLE=.*|DEPOOL_ENABLE=yes|g" $DOCKER_DIR/.env
cat $DOCKER_DIR/.env | tail -n 1

cd $DOCKER_DIR
tmux new -ds clean
tmux send -t clean.0 "echo 'scripts start' && date '+%F %a %T' && df -h / && pm2 stop 0 && docker-compose down -v && docker-compose up -d && df -h /" ENTER
tmux send -t clean.0 "sleep 14400 && pm2 restart 0" ENTER
