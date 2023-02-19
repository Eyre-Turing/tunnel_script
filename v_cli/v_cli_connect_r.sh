#!/bin/bash

PIPE_FILE1=$1
PIPE_FILE2=$2

# 标准输入为服务器输入
# 标准输出为给服务器发送

exec 200<"$PIPE_FILE1"
exec 201>"$PIPE_FILE2"

# 把用户输入转发给服务端
cat <&200 &

# 把服务端输入转发给用户
cat >&201

exec 201>&-
exec 200<&-

rm -f "$PIPE_FILE2"
