#!/bin/bash

cd $HOME/rust-scripts/scripts

shc -f rust-confirm-transaction.sh
rm rust-confirm-transaction.sh.x.c rust-confirm-transaction.sh
mv rust-confirm-transaction.sh.x rust-confirm-transaction.sh
