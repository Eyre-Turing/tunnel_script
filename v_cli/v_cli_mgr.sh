#!/bin/bash

SERV_IP=$1
SERV_PORT=$2
V_SERV_IP=$3
V_CLI_MGR_PORT=$4
V_CLI_USER_PORT=$5

cd "$(dirname "$BASH_SOURCE")"

nc "$V_SERV_IP" "$V_CLI_MGR_PORT" -c "./v_cli_connect_mgr.sh $SERV_IP $SERV_PORT $V_SERV_IP $V_CLI_USER_PORT"
