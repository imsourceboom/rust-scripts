#!/bin/bash

# Check main.ton.dev directory
cd $HOME
if [ ! -d $HOME/main.ton.dev ]; then
        git clone https://github.com/tonlabs/main.ton.dev.git
fi

# Change depool env value
sed -i "s|DEPOOL_ENABLE=.*|DEPOOL_ENABLE=\"yes\"|g" $HOME/main.ton.dev/scripts/env.sh

# Install
cd $HOME/main.ton.dev/scripts
. ./env.sh
./install_deps.sh
./deploy.sh 2>&1 | tee ./deploy.log

sleep 5
# Tools setup
cd $HOME/rust-scripts/scripts/setup
./toolsSetup.sh

cp $HOME/rust-scripts/configs/bash.config $HOME/.bashrc
source $HOME/.bashrc
