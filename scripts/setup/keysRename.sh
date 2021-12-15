#!/bin/bash

cd $HOME/keys

OLD_HOSTNAME=$(ls *.depool.addr | cut -f 1 -d '.')
rename "s/${OLD_HOSTNAME}\.//" * && \
	mv addr validator.addr && \
	rm ${OLD_HOSTNAME}.depool.addr

ls
