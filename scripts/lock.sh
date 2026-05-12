#!/bin/bash
# 锁定文件 — 防止多人同时编辑同一个 .pen 文件
# 用法: ./scripts/lock.sh designs/pages/home.pen

set -e
cd "$(dirname "$0")/.."

FILE="$1"

if [ -z "$FILE" ]; then
    echo "可锁定的 .pen 文件："
    find designs -name "*.pen" -type f | while read -r f; do
        echo "  $f"
    done
    echo ""
    echo "请输入要锁定的文件路径："
    read -r FILE
fi

if [ -z "$FILE" ]; then
    echo "❌ 文件路径不能为空"
    exit 1
fi

if ! git remote | grep -q origin; then
    echo "⚠️  远程仓库未配置，文件锁定需要远程仓库支持。"
    echo "   本地开发时请与团队口头确认谁在编辑此文件。"
    exit 0
fi

# 使用 Git LFS 锁定
git lfs lock "$FILE"
echo ""
echo "✓ 已锁定: $FILE"
echo "  编辑完成后请运行: ./scripts/unlock.sh $FILE"
