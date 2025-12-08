#!/bin/bash

set -e

CONF="services.conf"
BASE_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "==== Step 3: 导入镜像并启动容器（自动根据镜像 EXPOSE 端口映射） ===="

while read -r line; do
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue

  SERVICE_PATH="$line"
  SERVICE_NAME="$(basename "$SERVICE_PATH")"
  TAR_PATH="${BASE_DIR}/${SERVICE_NAME}.tar"

  if [ ! -f "$TAR_PATH" ]; then
    echo "!!! 未找到 tar 文件，跳过：$TAR_PATH"
    continue
  fi

  echo
  echo ">>> 处理服务：$SERVICE_NAME"

  echo ">>> docker load -i ${TAR_PATH}"
  docker load -i "${TAR_PATH}"

  echo ">>> 删除旧容器（如果存在）"
  docker rm -f "${SERVICE_NAME}" || true

  # 自动从镜像里读取 EXPOSE 的第一个端口
  EXPOSED_PORT=$(docker image inspect "${SERVICE_NAME}:latest" \
    --format '{{range $k,$v := .Config.ExposedPorts}}{{println $k}}{{end}}' \
    | head -n1)

  if [ -n "$EXPOSED_PORT" ]; then
    PORT="${EXPOSED_PORT%/*}"   # 去掉 /tcp
    echo ">>> 检测到镜像暴露端口：${PORT}，将映射为 -p ${PORT}:${PORT}"
    docker run -d \
      --name "${SERVICE_NAME}" \
      -p "${PORT}:${PORT}" \
      "${SERVICE_NAME}:latest"
  else
    echo "!!! 未检测到 EXPOSE 端口，将不做 -p 端口映射，只在容器内部可访问"
    docker run -d \
      --name "${SERVICE_NAME}" \
      "${SERVICE_NAME}:latest"
  fi

  echo ">>> ${SERVICE_NAME} 部署完成"
  echo "--------------------------------------"

done < "${CONF}"

echo
echo "==== 所有服务部署完成 ===="
docker ps