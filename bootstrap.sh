#!/usr/bin/env bash
set -euo pipefail
CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
find "$CONFIG_DIR" \
  -path "$CONFIG_DIR/.git" -prune \
  -o -type f \
  ! -name 'readme' \
  ! -name 'bootstrap.sh' \
  ! -name 'groups' \
  ! -name 'packages' \
  -print |
while read -r file; do
  file="${file#"$CONFIG_DIR"}"
  source="$CONFIG_DIR$file"
  destination="$file"
  if [[ "$destination" == /etc/* ]]; then
    sudo mkdir -p "$(dirname "$destination")"
    sudo ln -sfn "$source" "$destination"
  else 
    mkdir -p "$(dirname "$destination")"
    ln -sfn "$source" "$destination"
  fi
done

mapfile -t groups < <(grep -Ev '^[[:space:]]*($|#)' "$CONFIG_DIR/groups")
if ((${#groups[@]})); then
  sudo dnf group install "${groups[@]}" -y
fi
mapfile -t packages < <(grep -Ev '^[[:space:]]*($|#)' "$CONFIG_DIR/packages")
if ((${#packages[@]})); then
  sudo dnf install "${packages[@]}" -y
fi

sudo chown -R $(whoami):$(whoami) /nix

