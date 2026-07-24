#!/usr/bin/env bash
set -euo pipefail

if ((EUID == 0)); then
  echo "Do not run this script with sudo; it manages the current user's services." >&2
  exit 1
fi

services=(
  hyprpaper.service
  waybar.service
  hyprpolkitagent.service
  cliphist.service
  mako.service
)

echo "Enabling important graphical user services:"
printf '  %s\n' "${services[@]}"

systemctl --user daemon-reload
systemctl --user enable "${services[@]}"

if systemctl --user is-active --quiet graphical-session.target; then
  systemctl --user start "${services[@]}"
  echo "Services enabled and started."
else
  echo "Services enabled; they will start with the next graphical session."
fi
