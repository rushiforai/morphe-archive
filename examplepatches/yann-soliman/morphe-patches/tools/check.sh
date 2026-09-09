#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
WORK="$(mktemp -d "${TMPDIR:-/tmp}/morphe-check.XXXXXX")"

cleanup() {
  local rc=$?
  if (( rc == 0 )); then
    rm -rf "$WORK"
  else
    printf 'Logs preserved in %s\n' "$WORK" >&2
  fi
}
trap cleanup EXIT

run_logged() {
  local label=$1
  local log=$2
  shift 2
  printf '%-34s' "$label"
  if "$@" >"$WORK/$log" 2>&1; then
    printf 'PASS\n'
  else
    printf 'FAIL\n' >&2
    tail -n 100 "$WORK/$log" >&2 || true
    return 1
  fi
}

cd "$ROOT"
run_logged "Gradle build + bundle" build.log "$ROOT/build-local.sh"
run_logged "Repository regression tests" tests.log "$ROOT/tools/test.sh"
printf 'Repository check: PASS\n'
