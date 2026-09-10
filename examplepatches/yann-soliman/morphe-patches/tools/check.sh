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

run_logged "Public Gradle build + bundle" public-build.log "$ROOT/build-local.sh"
mapfile -t PUBLIC_MPP_CANDIDATES < <(
  find "$ROOT/patches/build/libs" -maxdepth 1 -type f \
    -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' -print
)
test ${#PUBLIC_MPP_CANDIDATES[@]} -gt 0
PUBLIC_MPP="$(python3 "$ROOT/tools/select_dex_mpp.py" "${PUBLIC_MPP_CANDIDATES[@]}")"
cp "$PUBLIC_MPP" "$WORK/public.mpp"

run_logged "Public bundle metadata" public-list.log \
  env PATCH_LIST_OUTPUT="$WORK/public-patches-list.json" \
  "$ROOT/gradlew" generatePatchesList --no-build-cache

run_logged "Personal Gradle build + bundle" personal-build.log \
  bash "$ROOT/tools/build-personal-bundle.sh" "$WORK/personal-build"
cp "$WORK/personal-build/patches-personal.mpp" "$WORK/personal.mpp"
cp "$WORK/personal-build/patches-list.json" "$WORK/personal-patches-list.json"

run_logged "Bundle visibility" visibility.log \
  python3 "$ROOT/tools/verify_bundle_visibility.py" \
  "$WORK/public-patches-list.json" "$WORK/personal-patches-list.json"

run_logged "MPP packaged contents" mpp-contents.log \
  python3 "$ROOT/tools/verify_mpp_contents.py" \
  "$WORK/public.mpp" "$WORK/personal.mpp"

run_logged "Repository regression tests" tests.log "$ROOT/tools/test.sh"
printf 'Repository check: PASS\n'
