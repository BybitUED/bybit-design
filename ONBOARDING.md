# 新设计师加入指南

## 前置条件

1. 安装 VSCode
2. 安装 Pencil 插件（扩展商店搜 `highagency.pencildev`）
3. 有 GitLab 账号并配置好 SSH Key

## 三步上手

### 1. 克隆仓库

打开终端（VSCode 菜单 → Terminal → New Terminal），粘贴：

```bash
cd ~/Projects
git clone git@github.com:BybitUED/bybit-design.git
cd bybit-design
```

### 2. 初始化环境

```bash
./scripts/setup.sh
```

会问你名字和邮箱，填完就好。

### 3. 用 VSCode 打开项目

```bash
code ~/Projects/bybit-design
```

或者直接 File → Open Folder → 选 `~/Projects/bybit-design`

---

## 日常工作流

所有操作通过 `Cmd+Shift+P` → `Tasks: Run Task` 执行：

| 我要做什么 | 选哪个任务 |
|-----------|-----------|
| 开始一个新设计 | 🆕 开始新设计 |
| 保存当前进度 | 💾 保存进度 |
| 拉取同事的更新 | 🔄 同步最新 |
| 设计完了要评审 | 📤 提交评审 |
| 编辑前锁定文件 | 🔒 锁定文件 |
| 编辑完解锁文件 | 🔓 解锁文件 |
| 看看当前什么状态 | 📋 查看状态 |

## 重要规则

1. **编辑 .pen 文件前先锁定** — 同一个文件不能两人同时改
2. **每天结束前保存一次** — 防止丢失
3. **每个新功能用独立文件** — 放在 `designs/pages/功能名.pen`

## 遇到问题？

- "冲突了怎么办" → 找同事确认保留谁的版本
- "不小心改错了" → 运行 `🔄 同步最新` 可以恢复到远程版本
- 其他问题 → 找团队里会 Git 的人帮忙
