#!/bin/bash
# 首次设置 — 设计师只需运行一次
# 用法: ./scripts/setup.sh

set -e
cd "$(dirname "$0")/.."

echo "=============================="
echo "  Bybit Design 协作环境设置"
echo "=============================="
echo ""

# 检查 Git LFS
if ! command -v git-lfs &> /dev/null; then
    echo "正在安装 Git LFS..."
    brew install git-lfs
fi
git lfs install

# 设置用户信息
echo "请输入你的名字（英文，如 zhangsan）:"
read -r USERNAME
echo "请输入你的邮箱:"
read -r EMAIL

git config user.name "$USERNAME"
git config user.email "$EMAIL"

# 保存设计师名到本地配置（用于分支命名）
git config bybit.designer "$USERNAME"

echo ""
echo "✓ 设置完成！"
echo "  你的工作分支前缀: design/$USERNAME/"
echo ""
echo "接下来你可以："
echo "  开始新设计:   ./scripts/start.sh 功能名"
echo "  保存进度:     ./scripts/save.sh"
echo "  提交评审:     ./scripts/review.sh"
echo "  同步最新:     ./scripts/sync.sh"
