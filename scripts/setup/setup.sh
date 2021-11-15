#!/bin/bash

./noPasswd.sh
./dockerSetup.sh
./rustnetSetup.sh $1

cd $HOME
mkdir keys
