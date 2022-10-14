#!/usr/bin/env bash

cd /workspace/phorge
./bin/config set mysql.host '127.0.0.1'
./bin/config set mysql.user 'root'
./bin/config set mysql.pass 'mariadb'

./bin/config set phabricator.base-uri http://phorge.local

./bin/config set phabricator.developer-mode true
./bin/config set phabricator.show-prototypes true
./bin/config set darkconsole.enabled true

./bin/storage upgrade --force