#!/usr/bin/env bash
# Alternative install for users who don't use the Claude Code plugin system:
# symlinks (or copies) every skill in ./skills into a skill directory.
#
# Usage: ./install.sh [target-dir]
#   target-dir defaults to ~/.claude/skills (personal skills for Claude Code).
#   For cross-agent setups use: ./install.sh ~/.agents/skills
set -euo pipefail

REPO="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-$HOME/.claude/skills}"
mkdir -p "$TARGET"

for skill in "$REPO"/skills/*/; do
  name="$(basename "$skill")"
  if [ -e "$TARGET/$name" ]; then
    echo "skip: $TARGET/$name already exists"
  else
    ln -s "$REPO/skills/$name" "$TARGET/$name"
    echo "installed: $name -> $TARGET/$name"
  fi
done

echo
echo "Note: the tailwind-docs and headless-ui skills fetch their reference docs"
echo "on first use (see each skill's SKILL.md). Vendored tailwind-docs MDX comes"
echo "from the official tailwindcss.com repository and is not shipped here."