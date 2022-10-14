#!/usr/bin/env bash

cd phorge
sudo ./bin/config set mysql.user 'mariadb'
sudo ./bin/config set mysql.pass 'mariadb'