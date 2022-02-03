#!/bin/bash

DOCKER_DIR="$HOME/main.ton.dev/docker-compose/ton-node"

cd $DOCKER_DIR
tmux new -ds clear
tmux send -t clear.0 "df -h / && pm2 stop 0 && docker-compose down -v && docker-compose up -d && df -h / && sleep 18000 && pm2 restart 0" ENTER
