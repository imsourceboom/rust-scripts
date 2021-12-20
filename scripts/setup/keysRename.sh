#!/bin/bash

cd $HOME

PACKAGE=$(dpkg -l | grep rename)
if [ -z ${PACKAGE} ]; then
	sudo apt install rename -y
fi

cp -r $HOME/keys $HOME/ludi-keys

cd $HOME/keys

OLD_HOSTNAME=$(ls *.depool.addr | cut -f 1 -d '.')
rename "s/${OLD_HOSTNAME}\.//" * && \
	mv addr validator.addr && \
	rm ${OLD_HOSTNAME}.depool.addr && \
	ls
