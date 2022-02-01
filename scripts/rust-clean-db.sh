#!/bin/bash

DOCKER_DIR="$HOME/main.ton.dev/docker-compose/ton-node"

cd $DOCKER_DIR
docker-compose down -v
sleep 20
docker-compose up -d
sleep 20

pm2 stop 0
