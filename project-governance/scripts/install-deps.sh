#!/usr/bin/env bash
# project-governance 依赖技能安装脚本
# 规则：安装目录与本技能所在目录一致；用户全局技能中已有该依赖时跳过。
# 用法：bash scripts/install-deps.sh [--dest <skills目录>]
set -euo pipefail

SKILL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SKILLS_ROOT="$(dirname "$SKILL_DIR")"
if [ "${1:-}" = "--dest" ]; then SKILLS_ROOT="$(cd "${2:?--dest 需要一个目录}" && pwd)"; fi

# 全局技能目录（codex / dsh 安装器）
GLOBAL_DIRS=(
  "${CODEX_HOME:-$HOME/.codex}/skills"
  "$HOME/.agents/skills"
  "$HOME/.dsh/skills"
)

DEPS=(
  "obra/superpowers skills/using-superpowers"
  "obra/superpowers skills/brainstorming"
  "obra/superpowers skills/writing-plans"
  "obra/superpowers skills/systematic-debugging"
  "obra/superpowers skills/test-driven-development"
  "obra/superpowers skills/verification-before-completion"
  "hyhmrright/brooks-lint skills/brooks-review"
  "hyhmrright/brooks-lint skills/brooks-audit"
)

install_one() {
  local repo="$1" path="$2"
  local name; name="$(basename "$path")"
  local dest="$SKILLS_ROOT/$name"
  if [ -d "$dest" ]; then echo "skip: $name 已存在于 $SKILLS_ROOT"; return 0; fi
  for g in "${GLOBAL_DIRS[@]}"; do
    if [ -d "$g/$name" ]; then echo "skip: $name 已在全局技能目录 $g"; return 0; fi
  done
  local tmp; tmp="$(mktemp -d)"
  if git clone --depth 1 --filter=blob:none --sparse "https://github.com/$repo" "$tmp/repo" >/dev/null 2>&1 \
     && git -C "$tmp/repo" sparse-checkout set "$(dirname "$path")" >/dev/null 2>&1 \
     && [ -d "$tmp/repo/$path" ]; then
    cp -R "$tmp/repo/$path" "$dest"
  elif curl -fsSL "https://codeload.github.com/$repo/tar.gz/refs/heads/main" -o "$tmp/repo.tgz" \
     && tar -xzf "$tmp/repo.tgz" -C "$tmp" && [ -d "$tmp/$name" -o -e "$tmp" ]; then
    cp -R "$(find "$tmp" -type d -path "*/$path" | head -1)" "$dest"
  else
    rm -rf "$tmp"
    echo "error: $name 安装失败（git 与 tarball 均不可用）" >&2
    return 1
  fi
  rm -rf "$tmp"
  echo "installed: $name -> $dest"
}

for dep in "${DEPS[@]}"; do
  install_one $dep
done
echo "done: 依赖检查完成（目标目录 $SKILLS_ROOT）"
