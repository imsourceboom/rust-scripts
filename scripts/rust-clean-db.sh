#!/bin/bash

DOCKER_DIR="$HOME/main.ton.dev/docker-compose/ton-node"

df -h /

cd $DOCKER_DIR
docker-compose down -v
sleep 20
docker-compose up -d
sleep 20

df -h /

pm2 stop 0
