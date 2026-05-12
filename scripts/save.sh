#!/bin/bash
# 保存当前设计进度（相当于 git add + commit + push）
# 用法: ./scripts/save.sh [可选的说明]

set -e
cd "$(dirname "$0")/.."

# 检查是否有改动
if git diff --quiet && git diff --cached --quiet && [ -z "$(git ls-files --others --exclude-standard)" ]; then
    echo "没有新的改动需要保存。"
    exit 0
fi

# 显示改动的文件
echo "以下文件有改动："
echo "---"
git status --short
echo "---"
echo ""

# 获取提交信息
MSG="$*"
if [ -z "$MSG" ]; then
    echo "这次改了什么？（简要说明，如：完成首页头部设计）"
    read -r MSG
fi

if [ -z "$MSG" ]; then
    MSG="更新设计稿"
fi

# 提交
git add -A
git commit -m "$MSG"

# 推送到远程（如果有）
if git remote | grep -q origin; then
    BRANCH=$(git branch --show-current)
    git push -u origin "$BRANCH" 2>/dev/null || git push origin "$BRANCH"
    echo ""
    echo "✓ 已保存并同步到远程"
else
    echo ""
    echo "✓ 已保存到本地"
    echo "  （远程仓库尚未配置，本地保存成功）"
fi
