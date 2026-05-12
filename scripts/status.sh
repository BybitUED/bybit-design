#!/bin/bash
# 查看当前状态 — 在哪个分支、有什么改动
# 用法: ./scripts/status.sh

cd "$(dirname "$0")/.."

BRANCH=$(git branch --show-current)
DESIGNER=$(git config bybit.designer 2>/dev/null || echo "未设置")

echo "=============================="
echo "  Bybit Design 当前状态"
echo "=============================="
echo ""
echo "  设计师:   $DESIGNER"
echo "  当前分支: $BRANCH"
echo ""

# 未提交的改动
CHANGES=$(git status --short 2>/dev/null)
if [ -n "$CHANGES" ]; then
    echo "  未保存的改动："
    echo "$CHANGES" | while read -r line; do
        echo "    $line"
    done
    echo ""
    echo "  运行 ./scripts/save.sh 保存"
else
    echo "  ✓ 所有改动已保存"
fi

echo ""

# 显示最近的提交
echo "  最近保存记录："
git log --oneline -5 2>/dev/null | while read -r line; do
    echo "    $line"
done

echo ""
