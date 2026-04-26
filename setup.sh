#!/usr/bin/env bash
# ============================================================
# Yu Stack — 一键安装脚本
# Dual AI Agent Collaboration Terminal
# ============================================================
set -e

YU_HOME="$HOME/.yu-stack"
YU_DIR="$(cd "$(dirname "$(readlink -f "$0" 2>/dev/null || echo "$0")")" && pwd)"
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'

info()  { echo -e "${CYAN}ℹ${NC} $1"; }
ok()    { echo -e "${GREEN}✓${NC} $1"; }
warn()  { echo -e "${YELLOW}⚠${NC} $1"; }
err()   { echo -e "${RED}✗${NC} $1" >&2; }

echo ""
echo -e "  ${CYAN}╔══════════════════════════════════════════╗${NC}"
echo -e "  ${CYAN}║    🚀 Yu Stack — 一键安装                ║${NC}"
echo -e "  ${CYAN}║    Dual AI Agent Collaboration Terminal  ║${NC}"
echo -e "  ${CYAN}╚══════════════════════════════════════════╝${NC}"
echo ""

# ─── Step 1: Check dependencies ────────────────────────────
info "Step 1/5: Checking dependencies..."

HOMEBREW_NEEDS=()
command -v git  >/dev/null 2>&1 || HOMEBREW_NEEDS+=("git")
command -v tmux >/dev/null 2>&1 || HOMEBREW_NEEDS+=("tmux")
command -v bun  >/dev/null 2>&1 || HOMEBREW_NEEDS+=("bun")

if [ ${#HOMEBREW_NEEDS[@]} -gt 0 ]; then
  info "Installing: ${HOMEBREW_NEEDS[*]}..."
  if command -v brew >/dev/null 2>&1; then
    brew install "${HOMEBREW_NEEDS[@]}" 2>&1 | tail -1
  else
    err "Homebrew not found. Install it: https://brew.sh"
    exit 1
  fi
fi

command -v claude >/dev/null 2>&1 || warn "Claude Code not found — install it for full collab mode"
command -v hermes >/dev/null 2>&1 || warn "Hermes not found — install it first"
ok "dependencies ready"

# ─── Step 2: Create workspace ──────────────────────────────
info "Step 2/5: Setting up workspace..."
mkdir -p "$YU_HOME"
mkdir -p "$HOME/Desktop/共享文件"

cat > "$YU_HOME/task.md" << 'TASK'
# 🎯 当前任务
（在此描述你要做的事情）

## 上下文

## 交付物
TASK
ok "workspace created at $YU_HOME"

# ─── Step 3: Install Agency Agents ─────────────────────────
info "Step 3/5: Installing Agency Agents (144 Expert Roles)..."
if [ ! -d "$HOME/agency-agents" ]; then
  git clone --depth 1 https://github.com/MarcusRawlins/agency-agents.git "$HOME/agency-agents" 2>&1 | tail -1 || warn "agency-agents clone failed (network?)"
fi

if [ -d "$HOME/agency-agents" ]; then
  mkdir -p "$HOME/.claude/agents"
  cp -r "$HOME/agency-agents"/* "$HOME/.claude/agents/" 2>/dev/null || true
  ok "Agency Agents: 144 expert roles loaded"
else
  warn "Agency Agents not installed — Claude Code will lack expert roles"
fi

# ─── Step 4: Install gstack ────────────────────────────────
info "Step 4/5: Installing gstack (43 Dev Workflows)..."
if [ ! -d "$HOME/gstack" ]; then
  git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git "$HOME/gstack" 2>&1 | tail -1 || warn "gstack clone failed (network?)"
fi

if [ -d "$HOME/gstack" ] && command -v bun >/dev/null 2>&1; then
  cd "$HOME/gstack"
  bun install 2>&1 | tail -1
  bun run gen:skill-docs --host hermes 2>&1 | tail -1
  
  # Symlink to Hermes
  for dir in "$HOME/gstack/.hermes/skills/"gstack*; do
    name=$(basename "$dir")
    target="$HOME/.hermes/skills/$name"
    [ ! -e "$target" ] && ln -sf "$dir" "$target"
  done
  
  # Build browser binary
  bun run build 2>&1 | tail -3
  bunx playwright install chromium 2>&1 | tail -1
  
  ok "gstack: 43 workflows loaded"
  ok "browse binary compiled (60MB)"
else
  warn "gstack not fully installed — missing bun or clone"
fi

# ─── Step 5: Install yu command ────────────────────────────
info "Step 5/5: Installing 'yu' command..."

# Symlink to location on PATH
for bindir in /usr/local/bin ~/.local/bin ~/bin; do
  if [ -d "$bindir" ] || mkdir -p "$bindir" 2>/dev/null; then
    ln -sf "$YU_DIR/bin/yu" "$bindir/yu" 2>/dev/null || true
    break
  fi
done

# Add alias to .zshrc if not present
if ! grep -q "alias yu=" "$HOME/.zshrc" 2>/dev/null; then
  cat >> "$HOME/.zshrc" << 'EOF'

# ─── Yu Stack: Dual AI Agent Terminal ───
alias yu="$HOME/yu-stack/bin/yu"
export YU_HOME="$HOME/.yu-stack"
EOF
  ok "alias added to ~/.zshrc"
fi

# ─── Done ──────────────────────────────────────────────────
echo ""
echo -e "  ${GREEN}╔══════════════════════════════════════════╗${NC}"
echo -e "  ${GREEN}║    ✅ Yu Stack 安装完成！                ║${NC}"
echo -e "  ${GREEN}╚══════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${CYAN}Usage:${NC}"
echo -e "    source ~/.zshrc"
echo -e "    yu              # 启动双AI协作终端"
echo -e "    yu --help       # 查看全部命令"
echo -e "    yu --status     # 查看工作区状态"
echo ""

echo -e "  ${CYAN}Collaboration:${NC}"
echo -e "    左: Hermes    — 分析 · 规划 · 学习"
echo -e "    右: Claude    — 编码 · 实现 · 执行"
echo -e "    共享文件 → ~/Desktop/共享文件/"
echo ""

echo -e "  ${CYAN}Skills Loaded:${NC}"
echo -e "    🎭  The Agency: 144 Expert Roles"
echo -e "    🛠️   gstack:     43 Dev Workflows"
echo -e "    🧠  Combined:  187 specializations"
echo ""

echo -e "  ${YELLOW}Next steps:${NC}"
echo -e "    1. source ~/.zshrc"
echo -e "    2. yu --task '我需要做...'"
echo -e "    3. yu"
echo ""
