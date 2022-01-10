#!/bin/bash

LOGS_DIR="$HOME/rustnet.ton.dev/docker-compose/ton-node/logs"

if [ -f $LOGS_DIR/output.log ]; then
	echo 0 | sudo tee $LOGS_DIR/output.log
fi

if [ -f $LOGS_DIR/output_1.log ]; then
	echo 0 | sudo tee $LOGS_DIR/output_1.log
fi

if [ -f $LOGS_DIR/send_depool_tick_tock.log ]; then
	echo 0 | sudo tee $LOGS_DIR/send_depool_tick_tock.log
fi

if [ -f $LOGS_DIR/stderr.log ]; then
	echo 0 | sudo tee $LOGS_DIR/stderr.log
fi

if [ -f $LOGS_DIR/stdout.log ]; then
	echo 0 | sudo tee $LOGS_DIR/stdout.log
fi

if [ -f $LOGS_DIR/validator.log ]; then
	echo 0 | sudo tee $LOGS_DIR/validator.log
fi

