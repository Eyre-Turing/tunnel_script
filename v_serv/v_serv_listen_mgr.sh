#!/bin/bash

USER_PORT=$1
V_CLI_USER_PORT=$2

# 标准输入为v_cli输入
# 标准输出为给v_cli发信息

create_listen()
{
    nc -lp "$USER_PORT" -c "nc -lp $V_CLI_USER_PORT" &

    # 下面的命令用于检测上面的nc是否处于监听用户连接状态，如果处于，将卡住，直到监听到
    while ss -tunlpa | awk "\$5~/:${USER_PORT}$/{print \$2}" | grep -q LISTEN; do
        :
    done

    # 给v_cli发送user in信息，v_cli收到将会创建一个连接
    echo "user in"

    # 下面的命令用于检测上面的nc是否处于监听代理连接状态，如果处于，将卡住，直到监听到
    while ss -tunlpa | awk "\$5~/:${V_CLI_USER_PORT}$/{print \$2}" | grep -q LISTEN; do
        :
    done
}

while :; do
    create_listen
done
