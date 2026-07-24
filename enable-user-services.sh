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

graphical_session_wants=(
  gvfs-daemon.service
  gvfs-metadata.service
  gvfs-udisks2-volume-monitor.service
  gvfs-mtp-volume-monitor.service
)

echo "Enabling important graphical user services:"
printf '  %s\n' "${services[@]}"

echo "Adding D-Bus services to graphical-session.target:"
printf '  %s\n' "${graphical_session_wants[@]}"

systemctl --user daemon-reload
systemctl --user enable "${services[@]}"
systemctl --user add-wants graphical-session.target "${graphical_session_wants[@]}"

if systemctl --user is-active --quiet graphical-session.target; then
  systemctl --user start "${services[@]}" "${graphical_session_wants[@]}"
  echo "Services enabled and started."
else
  echo "Services enabled; they will start with the next graphical session."
fi
