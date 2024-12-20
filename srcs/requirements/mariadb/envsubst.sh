#!/bin/bash
envsubst < /etc/mysql/mariadb.conf.d/50-server.cnf.template > /etc/mysql/mariadb.conf.d/50-server.cnf
envsubst < /etc/mysql/init.sql.template > /etc/mysql/init.sql
exec "$@"
