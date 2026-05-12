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

# 创建设计文件（从模板复制）
TARGET="designs/pages/${FEATURE}.pen"
if [ ! -f "$TARGET" ]; then
    TEMPLATE=$(find designs -name "*.pen" -path "*/components/*" | head -1)
    if [ -z "$TEMPLATE" ]; then
        TEMPLATE=$(find designs -name "*.pen" | head -1)
    fi
    if [ -n "$TEMPLATE" ]; then
        cp "$TEMPLATE" "$TARGET"
    else
        touch "$TARGET"
    fi
    git add "$TARGET"
    git commit -m "新建设计: ${FEATURE}"
fi

echo ""
echo "✓ 已创建工作分支: $BRANCH"
echo "✓ 设计文件已创建: $TARGET"
echo ""
echo "现在可以用 Pencil 打开 $TARGET 开始设计！"
echo "  保存进度:     ./scripts/save.sh"
echo "  提交评审:     ./scripts/review.sh"

# 在 VSCode 中打开文件
if command -v code &> /dev/null; then
    code "$TARGET"
fi
