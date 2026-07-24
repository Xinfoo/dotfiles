#!/usr/bin/env bash
set -euo pipefail

if command -v uwsm >/dev/null 2>&1 && uwsm check is-active >/dev/null 2>&1; then
  selection=$(wofi --show drun --define=drun-print_desktop_file=true) || exit 0
  [ -n "$selection" ] || exit 0

  case "$selection" in
    *'.desktop '*) desktop_entry="${selection%.desktop *}.desktop:${selection#*.desktop }" ;;
    *)             desktop_entry="$selection" ;;
  esac

  exec uwsm app -- "$desktop_entry"
fi

exec wofi --show drun
