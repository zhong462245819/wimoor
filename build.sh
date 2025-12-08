#!/bin/bash

CONF="services.conf"

while IFS= read -r servicePath || [[ -n "$servicePath" ]]; do
  [[ -z "$servicePath" || "$servicePath" =~ ^# ]] && continue

  serviceName=$(basename "$servicePath")

  echo "=== 构建服务镜像：$serviceName ==="
  echo "路径：$servicePath"

  # -------- FIX: 正确的 cd --------
  cd "$servicePath" || { echo "路径不存在：$servicePath"; exit 1; }

  echo "当前目录：$(pwd)"

  docker build -t "$serviceName:latest" .

  cd - > /dev/null

  echo "=== 完成：$serviceName ==="
  echo
done < "$CONF"

echo "全部服务构建完成。"