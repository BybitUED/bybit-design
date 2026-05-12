#!/bin/bash
# 同步最新内容 — 拉取远程更新
# 用法: ./scripts/sync.sh

set -e
cd "$(dirname "$0")/.."

BRANCH=$(git branch --show-current)

# 先保存未提交的改动
if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
    echo "检测到未保存的改动，先自动保存..."
    git add -A
    git commit -m "自动保存: 同步前暂存"
fi

# 拉取远程更新
if git remote | grep -q origin; then
    echo "正在同步远程更新..."
    git pull origin "$BRANCH" --rebase 2>/dev/null || {
        echo ""
        echo "⚠️  同步遇到冲突！"
        echo "   .pen 文件冲突无法自动合并。"
        echo "   请联系团队确认保留哪个版本。"
        echo ""
        echo "   保留我的版本: git checkout --ours <文件>"
        echo "   保留远程版本: git checkout --theirs <文件>"
        echo "   然后运行: git rebase --continue"
        exit 1
    }
    echo ""
    echo "✓ 同步完成（当前分支: $BRANCH）"
else
    echo "远程仓库尚未配置，无需同步。"
fi
