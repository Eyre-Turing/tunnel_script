#!/bin/bash

SERV_IP=$1
SERV_PORT=$2
V_SERV_IP=$3
V_CLI_USER_PORT=$4

# 标准输入为v_serv输入
# 标准输出为给v_serv发信息

create_connect()
{
    local v_serv_mgr_cmd
    read v_serv_mgr_cmd
    if [ "$v_serv_mgr_cmd" == "user in" ]; then
        nc "$V_SERV_IP" "$V_CLI_USER_PORT" -c "nc $SERV_IP $SERV_PORT" &
    fi
}

while :; do
    create_connect
done
