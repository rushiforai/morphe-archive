#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  cat >&2 <<'USAGE'
Usage:
  tools/verify-keepcool-calendar.sh ORIGINAL_DECODED PATCHED_DECODED [REPORT_JSON]

Both arguments must be directories produced by an APK disassembler (for example apktool).
The optional report path is passed to verify_calendar_scope.py. If omitted, the report is
created in a temporary directory and discarded after a successful run.
USAGE
  exit 2
}

[[ $# -ge 2 && $# -le 3 ]] || usage
ORIGINAL="$(realpath "$1")"
PATCHED="$(realpath "$2")"
[[ -d "$ORIGINAL" ]] || { printf 'Original decoded directory not found: %s\n' "$ORIGINAL" >&2; exit 2; }
[[ -d "$PATCHED" ]] || { printf 'Patched decoded directory not found: %s\n' "$PATCHED" >&2; exit 2; }

WORK="$(mktemp -d "${TMPDIR:-/tmp}/keepcool-calendar-verify.XXXXXX")"
REPORT="${3:-$WORK/calendar-scope.json}"
if [[ $# -eq 3 ]]; then
  REPORT="$(realpath -m "$REPORT")"
  mkdir -p "$(dirname "$REPORT")"
fi

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
run_logged "Register/data-flow checks" registers.log \
  env CALENDAR_DECODED="$PATCHED" python3 -m unittest discover -s tests -p 'test_calendar_registers.py' -v
run_logged "J+30 horizon verification" horizon.log \
  python3 tests/verify_calendar_j30.py "$PATCHED"
run_logged "Original/patched scope check" scope.log \
  python3 tests/verify_calendar_scope.py "$ORIGINAL" "$PATCHED" "$REPORT"

printf 'Keepcool calendar verification: PASS\n'
if [[ $# -eq 3 ]]; then
  printf 'Scope report: %s\n' "$REPORT"
fi
