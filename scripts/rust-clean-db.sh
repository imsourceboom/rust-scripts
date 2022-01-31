#!/bin/bash

DOCKER_DIR="$HOME/main.ton.dev/docker-compose/ton-node"

pm2 stop 0

cd $DOCKER_DIR
docker-compose down -v
docker-compose up -d

sleep 14400

pm2 restart 0
