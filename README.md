# 🧠 Yu Stack — Dual AI Agent Collaboration Terminal

> 一个终端，两个AI大脑，187种专业技能。

**Yu Stack** 是一个开源的 **双AI智能体协作系统**。它将两个顶级AI编码代理（Hermes + Claude Code）整合到一个tmux分屏终端中，并预装了 **187种专业角色和工作流**，让一个人拥有整个工程团队的战斗力。

---

## 系统架构

```
┌──────────────────────────────────────────────────────┐
│                    yu 终端                            │
├────────────────────────┬─────────────────────────────┤
│  🧠 Hermes             │  🤖 Claude Code             │
│  分析 · 规划 · 学习    │  编码 · 实现 · 执行         │
│                        │                             │
│  Skills:               │  Roles:                     │
│  ├─ gstack 43 workflows│  ├─ Agency 144 experts      │
│  │  ├─ /review         │  │  ├─ Frontend Dev         │
│  │  ├─ /investigate    │  │  ├─ Backend Architect    │
│  │  ├─ /qa             │  │  ├─ Security Engineer    │
│  │  ├─ /cso            │  │  ├─ UI/UX Designer       │
│  │  ├─ /ship           │  │  ├─ DevOps Engineer      │
│  │  └─ 38 more         │  │  └─ 139 more roles       │
│  └─ Auto-integration   │  └─ Team orchestration      │
└────────────────────────┴─────────────────────────────┘
         │                        │
         └────────┬───────────────┘
                  │
       ┌──────────▼──────────┐
       │  ~/.yu-stack/        │
       │  ├─ task.md          │ ← 任务同步
       │  ├─ current_task.txt │
       │  └─ ...              │
       └──────────────────────┘
                  │
       ┌──────────▼──────────┐
       │  ~/Desktop/共享文件/  │ ← Claude输出自动集成到Hermes
       └──────────────────────┘
```

---

## 快速开始

### 安装

```bash
git clone https://github.com/[your-username]/yu-stack.git
cd yu-stack
chmod +x setup.sh
./setup.sh
source ~/.zshrc
```

### 使用

```bash
# 设置任务
yu --task "用Next.js构建一个AI聊天界面，使用OpenAI API"

# 启动协作终端
yu

# 你会看到：
# ┌────────────────────────┬──────────────────────────────┐
# │  🧠 Hermes             │  🤖 Claude Code              │
# │  (分析需求, 输出方案)   │  (收到方案, 开始编码)        │
# └────────────────────────┴──────────────────────────────┘

# 查看工作区状态
yu --status

# 查看全部命令
yu --help
```

---

## 187种专业技能矩阵

### 来自 The Agency（144种专家角色）

| 部门 | 角色数 | 代表角色 |
|------|--------|---------|
| 🔧 工程 | 24 | Frontend Dev, Backend Architect, Full Stack, AI/ML, DevOps, Security, DB, Cloud |
| 🎨 设计 | 9 | UI Designer, UX Researcher, Brand Guardian, Visual Storyteller |
| 📢 营销 | 30+ | Content Strategist, SEO, Copywriter, 小红书/TikTok/Reddit专家 |
| 💰 销售 | 8 | Outreach, Discovery, Deal Strat, Sales Engineer, Negotiation |
| 💳 广告 | 8 | PPC, Paid Social, Retargeting, Attribution |
| 📦 产品 | 12 | PM, PO, Feature Prioritizer, Roadmap Architect |
| 📊 项目管理 | 10 | Agile Coach, Scrum Master, Risk Manager |
| 🧪 QA | 8 | Test Automation, Performance, Security, Bug Hunter |
| 🎮 游戏 | 10 | Game Designer, Unity/Unreal Developer |
| 🎓 学术 | 8 | Research Analyst, Data Scientist, Thesis Advisor |
| 💼 专业服务 | 10 | Business Consultant, Legal Advisor, Financial Analyst |
| 🛠️ 支持 | 7 | Support Engineer, Customer Success, Training |

### 来自 gstack（43种开发工作流）

| 工作流 | 用途 |
|--------|------|
| `/plan-ceo-review` | CEO级战略审核——找10星产品 |
| `/plan-eng-review` | 架构锁定——数据流、边界情况、测试策略 |
| `/plan-design-review` | 设计评审——维度评分0-10 |
| `/office-hours` | 产品创意重构——写代码前想清楚 |
| `/autoplan` | 全自动规划——一次跑全部评审 |
| `/investigate` | 系统性调试——**没有根因不修** |
| `/review` | 代码审查——SQL安全、LLM边界、副作用 |
| `/qa` | 浏览器端QA——三层测试+修复+验证 |
| `/qa-only` | QA报告——只找bug不改代码 |
| `/cso` | 安全审计——OWASP Top 10 + STRIDE |
| `/ship` | 完整发版——合并→测试→审查→版本→CHANGELOG→PR |
| `/land-and-deploy` | 合并+部署+验证一体化 |
| `/canary` | 上线后监控 |
| `/design-consultation` | 从零搭建设计系统 |
| `/design-review` | 视觉设计审计 |
| `/learn` | 项目管理学习记录 |
| `/retro` | 周会回顾 |
| `/browse` | 无头浏览器控制 |
| `/open-gstack-browser` | 可见浏览器+侧边栏 |
| `/benchmark` | 性能基准测试 |
| `/health` | 代码质量仪表盘 |
| `/context-save/restore` | 进度保存/恢复 |
| `/setup-deploy` | 部署配置 |
| `/document-release` | 文档发布 |
| `/pair-agent` | 结对编程 |
| `/make-pdf` | PDF生成 |
| `/careful/freeze/guard/unfreeze` | 安全控制 |

---

## 设计哲学

### Boil the Lake（煮沸湖泊）

AI编码让完整实现的边际成本趋近于零。当完整版只多花几分钟时——永远选完整版，不抄捷径。

```
坏模式: "先发90%，剩下的下个PR补"
好模式: "多花30秒做100%，一次到位"
```

### Search Before Building（先查后建）

1000倍工程师的第一反应不是"我来设计"，而是"有没有人已经解决了这个"。

### 三层知识

1. **Layer 1** — 公认实践，经过战斗验证
2. **Layer 2** — 新趋势（批判性看待，市场有时狂热）
3. **Layer 3** — **第一性原理原创（最有价值）**

---

## 项目结构

```
yu-stack/
├── setup.sh             # 一键安装脚本
├── bin/
│   └── yu               # 协作终端启动器
├── .workspace/          # 工作区模板
├── README.md            # 本文档
├── AGENTS.md            # Agent系统参考
└── ETHOS.md             # 设计哲学
```

---

## 技术栈

| 组件 | 用途 |
|------|------|
| [tmux](https://github.com/tmux/tmux) | 终端分屏 + 会话管理 |
| [Hermes Agent](https://github.com/NousResearch/hermes-agent) | 左屏：分析、规划、学习 |
| [Claude Code](https://docs.anthropic.com/en/docs/claude-code) | 右屏：编码、实现、执行 |
| [Agency Agents](https://github.com/MarcusRawlins/agency-agents) | 144种专家角色（Claude Code侧） |
| [gstack](https://github.com/garrytan/gstack) | 43种开发工作流（Hermes侧） |
| [Bun](https://bun.sh) | gstack浏览器后端运行时 |

---

## 灵感来源

- **[gstack](https://github.com/garrytan/gstack)** by Garry Tan (YC CEO) — AI工程工作流系统
- **[The Agency](https://github.com/MarcusRawlins/agency-agents)** by Marcus Rawlins — 144专家代理系统
- **YJJ** — tmux双AI协作终端的原始设计

---

## License

MIT — 自由使用、修改、分享。
