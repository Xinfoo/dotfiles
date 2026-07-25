#!/usr/bin/env bash
set -euo pipefail

if ((EUID == 0)); then
  echo "Do not run this script with sudo." >&2
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if [[ ! -e "$HOME/dotfiles" ]];then
    cp -ra "$SCRIPT_DIR" "$HOME/dotfiles"
fi

for config_dir in "$HOME/dotfiles/XDG_CONFIG_HOME/"*; do
    if [[ -e "$XDG_CONFIG_HOME/$(basename "$config_dir")" ]]; then
        echo "$config_dir already exists, skiping..."
    else
        if [[ -L "$config_dir" ]]; then
            rm -f "$config_dir"
        fi
        ln -sf "$config_dir" "$XDG_CONFIG_HOME/$(basename "$config_dir")"
        echo "The $(basename "$config_dir") configuration has been set."
    fi
done
