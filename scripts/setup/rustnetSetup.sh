#!/bin/bash


# Check rustnet.ton.dev directory
cd $HOME
if [ ! -d $HOME/rustnet.ton.dev ]; then
        git clone https://github.com/tonlabs/rustnet.ton.dev.git
fi

# Check network
cd $HOME/rustnet.ton.dev/configs
if [ $# -eq 0 ] || [ $1 == "main" ]; then
	curl -O https://raw.githubusercontent.com/tonlabs/main.ton.dev/master/configs/ton-global.config.json
fi

if [ $# -ne 0 ] && [ $1 == "fld" ]; then
	curl -O https://raw.githubusercontent.com/Everscale-Network/custler.uninode/main/configs/fld.ton.dev/ton-global.config.json
fi

if [ $# -ne 0 ] && [ $1 == "net" ]; then
	curl -O https://raw.githubusercontent.com/tonlabs/net.ton.dev/master/configs/net.ton.dev/ton-global.config.json
fi

# Install
cd $HOME/rustnet.ton.dev/scripts
. ./env.sh
./install_deps.sh
./deploy.sh 2>&1 | tee ./deploy.log

echo '-----------------------------'
echo 'Please!! When the installation is complete, run toolSetup.sh'
echo '-----------------------------'
