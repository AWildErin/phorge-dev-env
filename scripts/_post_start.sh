#!/usr/bin/env bash

# Submodule init and restart apache2
echo 'Initialising and updating submodules'
cd /workspace
git submodule update --init --recursive
sudo apache2ctl restart

echo 'Configuring mysql'
cd scripts
./mysql_setup.sh
