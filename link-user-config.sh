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

for config_dir_name in "$HOME/dotfiles/XDG_CONFIG_HOME/*"; do
    if [[ -e "$XDG_CONFIG_HOME/$config_dir_name" ]]; then
        echo "$XDG_CONFIG_HOME/$config_dir_name already exists, skiping..."
    else
        if [[ -L "$XDG_CONFIG_HOME/$config_dir_name" ]]; then
            rm -f "$XDG_CONFIG_HOME/$config_dir_name"
        fi
        ln -sf "$HOME/dotfiles/XDG_CONFIG_HOME/$config_dir_name" "$XDG_CONFIG_HOME/$config_dir_name"
        echo "The $config_dir_name configuration has been set."
    fi
done
