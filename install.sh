#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL="$(basename "$SCRIPT_DIR")"

TARGETS=(
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
)

for target in "${TARGETS[@]}"; do
  dest="$target/$SKILL"
  mkdir -p "$target"

  if [[ -e "$dest" ]]; then
    echo "Removing $dest"
    rm -rf "$dest"
  fi
  echo "Installing to $dest"
  mkdir -p "$dest"
  cp -r "$SCRIPT_DIR/SKILL.md" "$SCRIPT_DIR/assets" "$dest/"
done

echo "Done."
