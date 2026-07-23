#!/usr/bin/env bash
set -euo pipefail

if ! command -v playerctl >/dev/null 2>&1; then
  printf '{"text":""}\n'
  exit 0
fi

status=$(playerctl status 2>/dev/null || true)
if [ -z "$status" ]; then
  printf '{"text":""}\n'
  exit 0
fi

case "$status" in
  Playing) printf '{"text":""}\n' ;;
  Paused)  printf '{"text":""}\n' ;;
  *)       printf '{"text":""}\n' ;;
esac
