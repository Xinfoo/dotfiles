#!/usr/bin/env bash
set -euo pipefail

if (($# == 0)); then
  echo "Usage: ${0##*/} COMMAND [ARGUMENT ...]" >&2
  exit 2
fi

if command -v uwsm >/dev/null 2>&1 && uwsm check is-active >/dev/null 2>&1; then
  uwsm app -- "$@" && exit 0
fi

exec "$@"
