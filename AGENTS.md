# 🎭 Agent Systems Reference

## 系统一：The Agency — 144 Expert Roles

**来源**: [github.com/MarcusRawlins/agency-agents](https://github.com/MarcusRawlins/agency-agents)
**侧**: Claude Code（右屏）
**激活**: 在Claude Code中说 "activate Frontend Developer mode"

### 12大部门速查

```
The Agency (总部)
├── 🔧 工程部门 - 24个代理
├── 🎨 设计部门 - 9个代理
├── 📢 营销部门 - 30+个代理
├── 💰 销售部门 - 8个代理
├── 💳 付费广告部门 - 8个代理
├── 📦 产品部门 - 12个代理
├── 📊 项目管理部门 - 10个代理
├── 🧪 测试与QA部门 - 8个代理
├── 🎮 游戏开发部门 - 10个代理
├── 🎓 学术部门 - 8个代理
├── 💼 专业服务部门 - 10个代理
└── 🛠️ 客户支持部门 - 7个代理
```

### 常用激活示例

```
"activate Frontend Developer mode"
"切换到后端架构师模式"
"激活UI设计师模式，帮我设计一个电商产品页面"
"切换到QA工程师模式，为这个功能编写测试"
"activate Security Engineer mode for this PR"
"激活Growth Hacker模式，分析增长策略"
"切换到小红书专家模式，写一篇种草文案"
```

---

## 系统二：gstack — 43 Dev Workflows

**来源**: [github.com/garrytan/gstack](https://github.com/garrytan/gstack)
**侧**: Hermes（左屏）
**作者**: Garry Tan (YC CEO)

### 规划与策略
| 技能 | 用途 | 前置条件 |
|------|------|---------|
| `/office-hours` | 产品创意重构 | 任何新想法 |
| `/plan-ceo-review` | CEO级战略审核 | 功能/产品方向 |
| `/plan-eng-review` | 架构评审 | 方案设计后 |
| `/plan-design-review` | 设计评审 | 设计方案后 |
| `/plan-devex-review` | 开发者体验审核 | API/CLI/SDK设计时 |
| `/autoplan` | 自动跑全部评审 | 完整规划 |

### 设计与实现
| 技能 | 用途 |
|------|------|
| `/design-consultation` | 从零搭建设计系统 |
| `/design-review` | 视觉设计审计+修复 |
| `/design-html` | HTML/CSS设计实现 |
| `/design-shotgun` | 多方向设计探索 |

### 开发流程
| 技能 | 用途 |
|------|------|
| `/review` | 预合并代码审查 |
| `/investigate` | 系统性调试（4阶段） |
| `/codex` | 第二意见 |
| `/browse` | 无头浏览器控制 |
| `/pair-agent` | 结对编程 |

### 测试与质量
| 技能 | 用途 |
|------|------|
| `/qa` | 浏览器QA+修复 |
| `/qa-only` | QA报告 |
| `/benchmark` | 性能测试 |
| `/health` | 代码质量仪表盘 |

### 安全
| 技能 | 用途 |
|------|------|
| `/cso` | 安全审计(OWASP+STRIDE) |
| `/setup-browser-cookies` | 浏览器Cookie导入 |

### 部署
| 技能 | 用途 |
|------|------|
| `/ship` | 完整发版 |
| `/land-and-deploy` | 合并+部署+验证 |
| `/canary` | 上线后监控 |
| `/setup-deploy` | 部署配置 |
| `/document-release` | 文档发布 |

### 运维协作
| 技能 | 用途 |
|------|------|
| `/retro` | 周会回顾 |
| `/learn` | 学习记录管理 |
| `/context-save` | 进度保存 |
| `/context-restore` | 进度恢复 |
| `/plan-tune` | 问题灵敏度调节 |
| `/gstack-upgrade` | 自身升级 |

### 安全控制
| 技能 | 用途 |
|------|------|
| `/careful` | 危险操作警告 |
| `/freeze` | 锁定目录编辑 |
| `/guard` | 双重保护 |
| `/unfreeze` | 解除锁定 |

---

## 协作工作流

```
你提出需求
    │
    ▼
┌── Hermes（分析）───────────────────────────────────┐
│  /office-hours → 理解需求背景                      │
│  /plan-ceo-review → 评估价值方向                    │
│  /plan-eng-review → 确定技术架构                    │
│  输出: 方案文档 → ~/Desktop/共享文件/               │
└────────────────────────────────────────────────────┘
    │
    ▼
┌── Claude Code（实现）────────────────────────────────┐
│  "activate Full Stack Engineer mode"                │
│  读取方案 → 编码实现 → 测试                         │
│  输出: 代码 → ~/Desktop/共享文件/                   │
└────────────────────────────────────────────────────┘
    │
    ▼
┌── Hermes（整合）────────────────────────────────────┐
│  扫描 ~/Desktop/共享文件/ 的新输出                   │
│  分类 → 集成到技能/记忆                              │
│  更新工作区状态                                     │
└────────────────────────────────────────────────────┘
```

---

## 工作流模板

### 完整项目启动
```
1. yu --task "构建一个XX系统"
2. yu → 启动协作终端
3. Hermes: /office-hours → 理解需求
4. Hermes: /plan-ceo-review → 战略评估
5. Hermes: 输出方案到共享文件
6. Claude Code: 读取方案 → 编码
7. Hermes: /review 审查代码
8. Claude Code: 修复问题
9. Hermes: /qa 测试
10. Hermes: /ship 发版
```

### Bug修复
```
1. yu --task "#bug XX功能报错"
2. Hernes: /investigate → 根因分析
3. Hermes: 输出根因报告
4. Claude Code: 修复代码
5. Hermes: 验证修复
6. Hermes: /learn 记录教训
```

### 安全审计
```
1. yu --task "安全审计当前项目"
2. Hermes: /cso → OWASP+STRIDE
3. Hermes: 输出审计报告
4. Claude Code: 修复漏洞
5. Hermes: 验证修复
```
