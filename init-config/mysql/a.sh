#!/bin/bash

# ==========================================
# 合并目录下所有 .sql 文件成一个文件
# 按文件名排序，不会出现 echo -e 的 -e 字符
# ==========================================

# 1. 输入检查
if [ -z "$1" ] || [ -z "$2" ]; then
    echo "❌ 用法错误"
    echo "示例: ./merge-sql.sh ./sql merged.sql"
    exit 1
fi

SQL_DIR=$1
OUTPUT_FILE=$2

# 2. 检查目录
if [ ! -d "$SQL_DIR" ]; then
    echo "❌ 目录不存在: $SQL_DIR"
    exit 1
fi

# 3. 清空输出文件
> "$OUTPUT_FILE"

echo "➡ 开始合并 SQL 文件到: $OUTPUT_FILE"

# 4. 遍历 SQL 文件
for file in $(ls "$SQL_DIR"/*.sql | sort); do
    echo "📌 合并: $file"

    # 使用 printf，而不是 echo -e
    printf "\n\n-- ========================================\n" >> "$OUTPUT_FILE"
    printf "-- File: %s\n" "$(basename "$file")" >> "$OUTPUT_FILE"
    printf "-- ========================================\n\n" >> "$OUTPUT_FILE"

    cat "$file" >> "$OUTPUT_FILE"
done

echo "🎉 合并完成：$OUTPUT_FILE"