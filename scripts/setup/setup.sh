#!/bin/bash


# Check rustnet.ton.dev directory
cd $HOME
if [ ! -d $HOME/rustnet.ton.dev ]; then
        git clone https://github.com/tonlabs/rustnet.ton.dev.git
fi

# Change depool env value
sed -i "s|DEPOOL_ENABLE=.*|DEPOOL_ENABLE=\"yes\"|g" $HOME/rustnet.ton.dev/scripts/env.sh

# Install
cd $HOME/rustnet.ton.dev/scripts
. ./env.sh
./install_deps.sh
./deploy.sh 2>&1 | tee ./deploy.log

sleep 5
# Tools setup
./toolsSetup.sh
