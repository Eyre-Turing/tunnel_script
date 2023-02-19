#!/bin/bash

USER_PORT=$1
V_CLI_MGR_PORT=$2
V_CLI_USER_PORT=$3

cd "$(dirname "$BASH_SOURCE")"

nc -lp "$V_CLI_MGR_PORT" -c "./v_serv_listen_mgr.sh $USER_PORT $V_CLI_USER_PORT"
