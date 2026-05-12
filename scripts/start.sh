#!/bin/bash
# 开始一个新的设计任务 — 创建工作分支
# 用法: ./scripts/start.sh 功能名

set -e
cd "$(dirname "$0")/.."

FEATURE="$1"
DESIGNER=$(git config bybit.designer 2>/dev/null || echo "")

if [ -z "$DESIGNER" ]; then
    echo "❌ 请先运行 ./scripts/setup.sh"
    exit 1
fi

if [ -z "$FEATURE" ]; then
    echo "请输入功能名称（英文，如 home-page）:"
    read -r FEATURE
fi

if [ -z "$FEATURE" ]; then
    echo "❌ 功能名不能为空"
    exit 1
fi

BRANCH="design/${DESIGNER}/${FEATURE}"

# 先同步 main
git checkout main 2>/dev/null || git checkout -b main
git pull origin main 2>/dev/null || true

# 创建工作分支
git checkout -b "$BRANCH"

echo ""
echo "✓ 已创建工作分支: $BRANCH"
echo ""
echo "现在可以开始设计了！"
echo "  设计文件放在: designs/pages/${FEATURE}.pen"
echo "  保存进度:     ./scripts/save.sh"
echo "  提交评审:     ./scripts/review.sh"
