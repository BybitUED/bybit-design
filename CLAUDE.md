# Bybit Design Repo

设计团队的 .pen 设计文件仓库，使用 Git 异步协作。

## 结构

```
designs/
  pages/       ← 页面设计稿（每个功能一个 .pen 文件）
  components/  ← 组件库
  icons/       ← 图标库
images/        ← 设计中引用的图片资源
scripts/       ← 设计师用的简化 Git 脚本
```

## 协作规则

1. **一个 .pen 文件同时只能一人编辑** — 编辑前必须执行 `锁定` 脚本
2. 每个功能/页面用独立 .pen 文件，避免多人改同一文件
3. 提交时写清楚改了什么（脚本会提示）
4. 需要评审时执行 `提交评审` 脚本，会自动创建 MR

## 分支策略

- `main` — 已评审通过的最终稿
- `design/{设计师名}/{功能名}` — 设计师工作分支
- 合并到 main 需要至少 1 人 approve

## 给 Claude Code 的指引

- .pen 文件是加密的，只能通过 Pencil MCP 工具读取
- 读取设计时使用 `batch_get` 获取结构，`get_screenshot` 获取视觉
- 组件规范在 `designs/components/*.rules.md` 中
