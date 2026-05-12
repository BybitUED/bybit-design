#!/bin/bash
# 安装自动同步定时任务 — 设计师运行一次即可
# 每 5 分钟自动同步远程更新，有新内容时弹出 macOS 通知
# 用法: ./scripts/install-autosync.sh

set -e
cd "$(dirname "$0")/.."

REPO_DIR="$(pwd)"
SCRIPT_PATH="$REPO_DIR/scripts/auto-sync.sh"
PLIST_NAME="com.bybit.design-sync"
PLIST_PATH="$HOME/Library/LaunchAgents/${PLIST_NAME}.plist"

# 确保脚本可执行
chmod +x "$SCRIPT_PATH"

# 如果已安装，先卸载旧版本
if launchctl list | grep -q "$PLIST_NAME" 2>/dev/null; then
    echo "检测到已有定时任务，更新中..."
    launchctl unload "$PLIST_PATH" 2>/dev/null || true
fi

# 生成 launchd plist
cat > "$PLIST_PATH" << PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Label</key>
    <string>${PLIST_NAME}</string>
    <key>ProgramArguments</key>
    <array>
        <string>/bin/bash</string>
        <string>${SCRIPT_PATH}</string>
    </array>
    <key>StartInterval</key>
    <integer>300</integer>
    <key>EnvironmentVariables</key>
    <dict>
        <key>BYBIT_DESIGN_DIR</key>
        <string>${REPO_DIR}</string>
        <key>PATH</key>
        <string>/usr/local/bin:/opt/homebrew/bin:/usr/bin:/bin</string>
    </dict>
    <key>StandardOutPath</key>
    <string>/tmp/bybit-design-sync.out</string>
    <key>StandardErrorPath</key>
    <string>/tmp/bybit-design-sync.err</string>
    <key>RunAtLoad</key>
    <true/>
</dict>
</plist>
PLIST

# 加载定时任务
launchctl load "$PLIST_PATH"

echo ""
echo "✓ 自动同步已启用！"
echo ""
echo "  频率: 每 5 分钟检查一次远程更新"
echo "  通知: 有新内容时弹出 macOS 通知"
echo "  日志: ~/.bybit-design-sync.log"
echo ""
echo "  停用: ./scripts/uninstall-autosync.sh"
echo "  手动同步: ./scripts/auto-sync.sh"
