#!/bin/bash

cd $HOME

sudo apt-get update -y;
sudo apt-get install npm jq -y;
sudo npm i n -g;
sudo n lts;
PATH="$PATH"
sudo npm i pm2 -g;
cd $HOME/rust-scripts/monitoring
npm i
pm2 start app.js --name "monitoring"
pm2 save
pm2 startup | awk 'FNR == 3' > ~/rust-scripts/scripts/setup/pm2-Startup.sh
cd $HOME/rust-scripts/scripts/setup
sudo chmod 755 pm2-Startup.sh
./pm2-Startup.sh
