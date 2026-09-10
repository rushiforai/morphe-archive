#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
OUTPUT_DIR="${1:?usage: build-personal-bundle.sh OUTPUT_DIR}"

PERSONAL_DIR="$ROOT/patches/src/personal/kotlin/io/github/yannsoliman/patches/keepcool"
MAIN_DIR="$ROOT/patches/src/main/kotlin/io/github/yannsoliman/patches/keepcool"

mkdir -p "$OUTPUT_DIR" "$MAIN_DIR"

FILES=(
  KeepcoolCalendarPatch.kt
  KeepcoolCalendarFingerprints.kt
)

cleanup() {
  local name
  for name in "${FILES[@]}"; do
    rm -f "$MAIN_DIR/$name"
  done
}
trap cleanup EXIT

for name in "${FILES[@]}"; do
  cp "$PERSONAL_DIR/$name" "$MAIN_DIR/$name"
done

"$ROOT/build-local.sh" -PpersonalBundle=true

mapfile -t MPP_CANDIDATES < <(
  find "$ROOT/patches/build/libs" -maxdepth 1 -type f \
    -name 'patches-*.mpp' ! -name '*sources*' ! -name '*javadoc*' -print
)
if (( ${#MPP_CANDIDATES[@]} == 0 )); then
  echo "Personal MPP not found" >&2
  exit 1
fi

MPP="$(python3 "$ROOT/tools/select_dex_mpp.py" "${MPP_CANDIDATES[@]}")"

# Preserve the Android-ready bundle immediately. generatePatchesList depends on a
# regular Gradle build and may replace the .mpp with a non-dex bundle.
cp "$MPP" "$OUTPUT_DIR/patches-personal.mpp"

PATCH_LIST_OUTPUT="$OUTPUT_DIR/patches-list.json" \
  "$ROOT/gradlew" -PpersonalBundle=true generatePatchesList --no-build-cache
