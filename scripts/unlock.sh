#!/bin/bash
# 解锁文件
# 用法: ./scripts/unlock.sh designs/pages/home.pen

set -e
cd "$(dirname "$0")/.."

FILE="$1"

if [ -z "$FILE" ]; then
    echo "当前已锁定的文件："
    git lfs locks 2>/dev/null || echo "  (无法获取锁定列表，远程仓库可能未配置)"
    echo ""
    echo "请输入要解锁的文件路径："
    read -r FILE
fi

if [ -z "$FILE" ]; then
    echo "❌ 文件路径不能为空"
    exit 1
fi

git lfs unlock "$FILE"
echo ""
echo "✓ 已解锁: $FILE"
