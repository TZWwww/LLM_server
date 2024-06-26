#!/bin/bash

# 脚本路径
SCRIPT_PATH="./download.sh"


# 无限循环，监控 download.sh 脚本
while true; do
    # 启动 download.sh 脚本
    $SCRIPT_PATH

    # 如果 download.sh 退出，则等待1秒后重启
    echo "download.sh has stopped. Attempting to restart."
    sleep 1
done

