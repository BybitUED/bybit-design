#!/bin/bash
# 卸载自动同步定时任务
# 用法: ./scripts/uninstall-autosync.sh

PLIST_NAME="com.bybit.design-sync"
PLIST_PATH="$HOME/Library/LaunchAgents/${PLIST_NAME}.plist"

if [ -f "$PLIST_PATH" ]; then
    launchctl unload "$PLIST_PATH" 2>/dev/null || true
    rm -f "$PLIST_PATH"
    echo "✓ 自动同步已停用"
else
    echo "未安装自动同步"
fi
