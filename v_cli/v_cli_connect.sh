#!/bin/bash

SERV_IP=$1
SERV_PORT=$2

# 标准输入为用户输入
# 标准输出为给用户发送消息

PIPE_FILE1="user_to_serv.$$.pipe"
PIPE_FILE2="serv_to_user.$$.pipe"

mkfifo "$PIPE_FILE1"
mkfifo "$PIPE_FILE2"

nc "$SERV_IP" "$SERV_PORT" -c "./v_cli_connect_r.sh $PIPE_FILE1 $PIPE_FILE2" &

exec 200>"$PIPE_FILE1"
exec 201<"$PIPE_FILE2"

# 把服务端信息转发给用户
cat <&201 &

# 把用户的输入转发给服务端
cat >&200

exec 200>&-
exec 201<&-

rm -f "$PIPE_FILE1"
