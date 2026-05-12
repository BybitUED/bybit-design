#!/bin/bash
# 提交设计评审 — 创建 Merge Request
# 用法: ./scripts/review.sh

set -e
cd "$(dirname "$0")/.."

BRANCH=$(git branch --show-current)
DESIGNER=$(git config bybit.designer 2>/dev/null || echo "designer")

if [ "$BRANCH" = "main" ]; then
    echo "❌ 当前在 main 分支，请先用 ./scripts/start.sh 创建工作分支"
    exit 1
fi

# 确保所有改动已保存
if ! git diff --quiet || ! git diff --cached --quiet || [ -n "$(git ls-files --others --exclude-standard)" ]; then
    echo "有未保存的改动，先保存..."
    echo "这次改了什么？"
    read -r MSG
    git add -A
    git commit -m "${MSG:-更新设计稿}"
fi

# 推送到远程
if ! git remote | grep -q origin; then
    echo "❌ 远程仓库尚未配置。请先运行："
    echo "   git remote add origin <你的GitLab仓库地址>"
    exit 1
fi

git push -u origin "$BRANCH"

# 提取功能名
FEATURE=$(echo "$BRANCH" | sed 's|design/[^/]*/||')

echo ""
echo "✓ 代码已推送到远程分支: $BRANCH"
echo ""
echo "请在 GitLab 上创建 Merge Request："
echo "  标题建议: 【设计评审】${FEATURE} — by ${DESIGNER}"
echo "  目标分支: main"
echo ""

# 如果有 glab CLI，自动创建 MR
if command -v glab &> /dev/null; then
    echo "检测到 glab CLI，是否自动创建 MR？(y/n)"
    read -r CONFIRM
    if [ "$CONFIRM" = "y" ]; then
        echo "请输入 MR 描述（设计说明）："
        read -r DESC
        glab mr create \
            --title "【设计评审】${FEATURE}" \
            --description "${DESC:-请评审设计稿}" \
            --target-branch main \
            --assignee "$DESIGNER"
        echo "✓ MR 已创建！"
    fi
fi
