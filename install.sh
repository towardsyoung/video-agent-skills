#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_NAME="storyboard-lite"
SKILL_SOURCE="$ROOT_DIR/skills/$SKILL_NAME"

if [[ ! -f "$SKILL_SOURCE/SKILL.md" ]]; then
  echo "Missing skill source: $SKILL_SOURCE/SKILL.md" >&2
  exit 1
fi

install_link() {
  local target_dir="$1"
  local link_path="$target_dir/$SKILL_NAME"

  mkdir -p "$target_dir"

  if [[ -L "$link_path" ]]; then
    rm "$link_path"
  elif [[ -e "$link_path" ]]; then
    echo "Skip existing non-symlink: $link_path" >&2
    return
  fi

  ln -s "$SKILL_SOURCE" "$link_path"
  echo "Installed $link_path -> $SKILL_SOURCE"
}

install_link "$HOME/.codex/skills"
install_link "$HOME/.claude/skills"
install_link "$HOME/.openclaw/skills"
install_link "$HOME/.agents/skills"

echo "Done."
