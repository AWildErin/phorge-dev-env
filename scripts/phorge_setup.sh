#!/usr/bin/env bash

cd /workspace/phorge
sudo ./bin/config set mysql.host '127.0.0.1'
sudo ./bin/config set mysql.user 'root'
sudo ./bin/config set mysql.pass 'mariadb'