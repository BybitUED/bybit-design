#!/bin/bash
# 自动同步脚本 — 定时执行，保持本地仓库最新
# 首次运行自动 clone，之后每次 pull 最新
# 用法: ./scripts/auto-sync.sh

set -e

REPO_URL="${BYBIT_DESIGN_REPO:-git@github.com:BybitUED/bybit-design.git}"
LOCAL_DIR="${BYBIT_DESIGN_DIR:-$HOME/Projects/bybit-design}"
LOG_FILE="$HOME/.bybit-design-sync.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOG_FILE"
}

# 首次 clone
if [ ! -d "$LOCAL_DIR/.git" ]; then
    log "首次克隆: $REPO_URL → $LOCAL_DIR"
    mkdir -p "$(dirname "$LOCAL_DIR")"
    git clone "$REPO_URL" "$LOCAL_DIR"
    log "克隆完成"

    # 自动安装 LFS（如果有 brew）
    if command -v brew &> /dev/null && ! command -v git-lfs &> /dev/null; then
        brew install git-lfs
    fi
    if command -v git-lfs &> /dev/null; then
        cd "$LOCAL_DIR" && git lfs install && git lfs pull
    fi

    exit 0
fi

cd "$LOCAL_DIR"

# 如果有未提交的改动，跳过 pull（避免冲突）
if ! git diff --quiet || ! git diff --cached --quiet; then
    log "跳过同步: 有未提交的本地改动"
    exit 0
fi

BRANCH=$(git branch --show-current)

# 只在 main 分支或 design/ 分支上自动同步
if git remote | grep -q origin; then
    git fetch origin --quiet 2>/dev/null || {
        log "fetch 失败: 网络问题或远程不可达"
        exit 0
    }

    # 检查是否有更新
    LOCAL_HEAD=$(git rev-parse HEAD)
    REMOTE_HEAD=$(git rev-parse "origin/$BRANCH" 2>/dev/null || echo "")

    if [ -z "$REMOTE_HEAD" ]; then
        log "远程分支 origin/$BRANCH 不存在，跳过"
        exit 0
    fi

    if [ "$LOCAL_HEAD" = "$REMOTE_HEAD" ]; then
        exit 0  # 已是最新，静默退出
    fi

    # 拉取更新
    git pull origin "$BRANCH" --ff-only 2>/dev/null || {
        log "⚠️ pull 失败（可能有分叉），需要手动处理"
        exit 0
    }

    log "✓ 同步完成: $BRANCH ($(git log --oneline -1))"

    # macOS 通知（可选）
    if command -v osascript &> /dev/null; then
        LATEST_MSG=$(git log --oneline -1 | cut -c9-)
        osascript -e "display notification \"$LATEST_MSG\" with title \"设计稿已更新\" subtitle \"$BRANCH\"" 2>/dev/null || true
    fi
fi
