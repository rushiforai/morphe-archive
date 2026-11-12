#!/usr/bin/env bash
#
# Checks that this bundle still gets along with the official Morphe patches.
#
#   scripts/compat-check.sh [--youtube <apk>] [--reddit <apk|apkm>] [--work <dir>]
#
# Always done (needs only curl, unzip, python3 and a built bundle):
#   1. fetch the latest stable official bundle,
#   2. compare the patcher version both bundles were built for,
#   3. make sure the two bundles share no file names that could shadow each other.
#
# Done as well when an original app file is given (needs Java):
#   4. apply the official default patches and ours TOGETHER with the official
#      command line patcher, and check that nothing failed, that our components are
#      in the resulting manifest, and that the provider authority followed any package
#      rename. With ANDROID_HOME set, it also reports which of our classes other
#      patches rewrote.
#
# Exit code 0 means compatible. Anything else prints what was found.
# Build the bundle first:  ./gradlew :patches:buildAndroid
#
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
WORK="${TMPDIR:-/tmp}/duet-compat"
YOUTUBE=""
REDDIT=""
while [ $# -gt 0 ]; do
  case "$1" in
    --youtube) YOUTUBE="$2"; shift 2 ;;
    --reddit) REDDIT="$2"; shift 2 ;;
    --work) WORK="$2"; shift 2 ;;
    *) echo "Unknown argument: $1" >&2; exit 2 ;;
  esac
done
mkdir -p "$WORK"

OFFICIAL_JSON_URL="https://raw.githubusercontent.com/MorpheApp/morphe-patches/main/patches-bundle.json"
DESKTOP_PROPS_URL="https://raw.githubusercontent.com/MorpheApp/morphe-desktop/main/gradle.properties"

fail=0
note() { printf '%s\n' "$*"; }
bad() { printf 'PROBLEM: %s\n' "$*"; fail=1; }

OURS="$(ls -t "$ROOT"/patches/build/libs/patches-*.mpp 2>/dev/null | grep -v -e '-sources' -e '-javadoc' | head -1 || true)"
[ -n "$OURS" ] || { echo "No built bundle. Run ./gradlew :patches:buildAndroid first." >&2; exit 2; }

# --- 1. latest stable official bundle ---------------------------------------
curl -fsSL --retry 3 "$OFFICIAL_JSON_URL" -o "$WORK/official.json"
OFFICIAL_VERSION="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["version"])' "$WORK/official.json")"
OFFICIAL_URL="$(python3 -c 'import json,sys; print(json.load(open(sys.argv[1]))["download_url"])' "$WORK/official.json")"
OFFICIAL="$WORK/official-$OFFICIAL_VERSION.mpp"
[ -s "$OFFICIAL" ] || curl -fsSL --retry 3 "$OFFICIAL_URL" -o "$OFFICIAL"
note "Official Morphe patches: v$OFFICIAL_VERSION"
note "This bundle:             $(basename "$OURS")"

# --- 2. patcher version ------------------------------------------------------
patcher_version() { unzip -p "$1" META-INF/MANIFEST.MF | tr -d '\r' | sed -n 's/^Patcher-Version: //p'; }
OFFICIAL_PATCHER="$(patcher_version "$OFFICIAL")"
OUR_PATCHER="$(patcher_version "$OURS")"
note "Patcher version: official $OFFICIAL_PATCHER, ours $OUR_PATCHER"
if [ "$OFFICIAL_PATCHER" != "$OUR_PATCHER" ]; then
  bad "Patcher versions differ. Set morphe-patcher in gradle/libs.versions.toml to $OFFICIAL_PATCHER (and the plugin version the official settings.gradle.kts uses), rebuild, and run the tests."
fi

# --- 3. names that could shadow each other ----------------------------------
unzip -Z1 "$OFFICIAL" | grep -v '/$' | grep -v '^META-INF/' | sort > "$WORK/official.files"
unzip -Z1 "$OURS" | grep -v '/$' | grep -v '^META-INF/' | grep -v '^classes.dex$' | sort > "$WORK/ours.files"
SHARED="$(comm -12 "$WORK/official.files" "$WORK/ours.files" || true)"
if [ -n "$SHARED" ]; then
  bad "Both bundles contain files of the same name (the first one loaded would win): $(echo "$SHARED" | tr '\n' ' ')"
else
  note "No file names shared with the official bundle."
fi

# --- 4. patch real apps with both bundles ------------------------------------
if [ -n "$YOUTUBE$REDDIT" ]; then
  DESKTOP_VERSION="$(curl -fsSL --retry 3 "$DESKTOP_PROPS_URL" | sed -n 's/^version *= *//p' | tr -d '[:space:]')"
  CLI="$WORK/morphe-desktop-$DESKTOP_VERSION-all.jar"
  [ -s "$CLI" ] || curl -fsSL --retry 3 \
    "https://github.com/MorpheApp/morphe-desktop/releases/download/v$DESKTOP_VERSION/morphe-desktop-$DESKTOP_VERSION-all.jar" -o "$CLI"
  note "Command line patcher: morphe-desktop v$DESKTOP_VERSION"
fi

check_app() { # label, input file, package before patching
  local label="$1" input="$2" package="$3"
  [ -n "$input" ] || { note "$label: no app file given, skipped."; return 0; }
  [ -f "$input" ] || { bad "$label: $input does not exist."; return 0; }
  local out="$WORK/$label-patched.apk" result="$WORK/$label-result.json" log="$WORK/$label.log"
  rm -f "$out" "$result"
  MORPHE_DATA_DIR="$WORK/morphe-data" java -Xmx6g -jar "$CLI" patch -p "$OFFICIAL" -p "$OURS" \
    -o "$out" -r "$result" -t "$WORK/tmp-$label" "$input" > "$log" 2>&1 || true
  if [ ! -s "$result" ]; then
    bad "$label: the patcher produced no result. Last lines of $log:"; tail -15 "$log"; return 0
  fi
  python3 - "$label" "$result" "$out" "$package" <<'PY' || fail=1
import json, sys, zipfile
label, result_path, apk, package = sys.argv[1:5]
r = json.load(open(result_path))
ok = True
def problem(text):
    global ok
    ok = False
    print(f"PROBLEM: {label}: {text}")
if not r.get("success"):
    problem(f"patching failed. Failed patches: {r.get('failedPatches')}. Steps: {r.get('stepResults')}")
applied = r.get("appliedPatches") or []
if "Duet reminders" not in applied:
    problem("the Duet reminders patch was not applied")
if r.get("failedPatches"):
    problem(f"patches failed: {r['failedPatches']}")
print(f"{label}: {r.get('packageName')} {r.get('packageVersion')}, {len(applied)} patches applied, "
      f"{len(r.get('failedPatches') or [])} failed")
if ok:
    data = zipfile.ZipFile(apk).read("AndroidManifest.xml")
    def has(text):
        # A compiled manifest keeps its strings as UTF-16 or UTF-8.
        return text.encode("utf-16-le") in data or text.encode("utf-8") in data
    for needed in ("app.variablenine.nudge.NudgeProvider", "app.variablenine.nudge.NudgeListenerService",
                   "android.permission.BIND_NOTIFICATION_LISTENER_SERVICE"):
        if not has(needed):
            problem(f"{needed} is missing from the patched manifest")
    renamed = {"com.google.android.youtube": "app.morphe.android.youtube"}.get(package, package)
    candidates = {package + ".duetnudge", renamed + ".duetnudge"}
    found = sorted(c for c in candidates if has(c))
    if not found:
        problem(f"no provider authority ending in .duetnudge for {package} in the patched manifest")
    else:
        print(f"{label}: provider authority {', '.join(found)}")
    # The authority must carry the package name the app ends up with.
    if package != renamed and has('package') and has(renamed) and not has(renamed + ".duetnudge"):
        problem(f"the app was renamed to {renamed} but the provider authority did not follow")
sys.exit(0 if ok else 1)
PY
  if [ -n "${ANDROID_HOME:-}" ] && [ -s "$out" ]; then
    local dexdump
    dexdump="$(ls "$ANDROID_HOME"/build-tools/*/dexdump 2>/dev/null | sort | tail -1 || true)"
    if [ -n "$dexdump" ]; then
      unzip -p "$OURS" extensions/duetnudge.mpe > "$WORK/ours.dex"
      python3 "$ROOT/scripts/dex-diff.py" "$dexdump" "$WORK/ours.dex" "$out" "$label" || fail=1
    fi
  fi
}

if [ -n "$YOUTUBE$REDDIT" ]; then
  check_app youtube "$YOUTUBE" com.google.android.youtube
  check_app reddit "$REDDIT" com.reddit.frontpage
else
  note "No app files given: the combined patching run was skipped."
fi

if [ "$fail" -eq 0 ]; then note "RESULT: compatible with official Morphe patches v$OFFICIAL_VERSION"; else note "RESULT: problems found, see above"; fi
exit "$fail"
