#!/bin/bash
# prepare-release.sh — stage a stable release on main, then tag it.
# Usage: bash scripts/prepare-release.sh <X.Y.Z>
#
# On main with a clean tree, this:
#   1. Sets gradle.properties to the version.
#   2. Promotes the CHANGELOG.md "## Unreleased" section to "## <version> (<today>)".
#   3. Regenerates patches-list.json, stamps its version, and refreshes the
#      README.md patch table.
#   4. Commits the release staging.
#
# Then publish with:
#   git push origin main && git tag -a v<X.Y.Z> -m "Release v<X.Y.Z>" && git push origin v<X.Y.Z>
# Pushing the tag runs .github/workflows/release.yml, which tests, builds,
# creates the GitHub release, and points patches-bundle.json at the download.
set -euo pipefail

VERSION="${1:?Usage: scripts/prepare-release.sh <X.Y.Z>}"
PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$PROJECT_DIR"

[[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]] || {
    echo "❌ Version must be X.Y.Z (got '$VERSION')" >&2
    exit 1
}
[[ "$(git rev-parse --abbrev-ref HEAD)" == "main" ]] || {
    echo "❌ Run on main (see docs/release.md)" >&2
    exit 1
}
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "❌ Working tree is dirty" >&2
    exit 1
fi
if git rev-parse "v$VERSION" >/dev/null 2>&1; then
    echo "❌ Tag v$VERSION already exists" >&2
    exit 1
fi

REPO="$(gh repo view --json nameWithOwner -q .nameWithOwner 2>/dev/null || git remote get-url origin | sed -E 's#.*github\.com[:/]([^/]+/[^/]+?)(\.git)?$#\1#')"
TODAY="$(date +%F)"

# Print an error message to stderr and exit with code 1.
die() {
    echo "❌ $*" >&2
    exit 1
}

command -v java >/dev/null 2>&1 || die "java not found"
command -v python3 >/dev/null 2>&1 || die "python3 not found"

# 1. Pin the build version (portable -i across GNU/BSD sed).
sed -i.bak -E "s/^version *= *.*/version = $VERSION/" gradle.properties
rm -f gradle.properties.bak
grep -q "^version = $VERSION$" gradle.properties || die "failed to update gradle.properties"

# 2. Promote Unreleased to a dated, Manager-compatible version heading.
#    Keep-a-Changelog principles, but plain "## <version> (<date>)" syntax so
#    Morphe Manager's changelog parser keeps working (no "[brackets] - date").
python3 - "$VERSION" "$TODAY" <<'PY'
import re, sys
version, today = sys.argv[1], sys.argv[2]
path = "CHANGELOG.md"
text = open(path, encoding="utf-8").read()
match = re.search(r"^## Unreleased\s*$", text, re.MULTILINE)
if not match:
    sys.exit("CHANGELOG.md has no '## Unreleased' section")
section = text[match.end():]
next_heading = re.search(r"^#{1,3}\s+\S.*\(\d{4}-\d{2}-\d{2}\)\s*$", section, re.MULTILINE)
body = section[: next_heading.start() if next_heading else len(section)]
if not re.search(r"^\* ", body, re.MULTILINE):
    sys.exit("## Unreleased has no '*' bullets — add the app patch changes first")
rest = section[next_heading.start() if next_heading else len(section):]
open(path, "w", encoding="utf-8").write(
    text[: match.start()] + "## Unreleased\n\n" + f"## {version} ({today})\n" + body.rstrip("\n") + "\n\n" + rest.lstrip("\n")
)
PY
[[ -n "$(git diff -- CHANGELOG.md)" ]] || die "CHANGELOG promotion produced no change"

# 3. Regenerate the patch list, stamp the version, refresh the README table.
./gradlew generatePatchesList --no-daemon
python3 - "$VERSION" <<'PY'
import json, sys
path = "patches-list.json"
data = json.load(open(path, encoding="utf-8"))
data["version"] = sys.argv[1]
json.dump(data, open(path, "w", encoding="utf-8"), indent=2)
open(path, "a", encoding="utf-8").write("\n")
PY
python3 .github/scripts/generate_patches_readme.py "$REPO" main patches-list.json README.md

# 4. Stage the release.
git add gradle.properties CHANGELOG.md patches-list.json README.md
git diff --cached --quiet && die "nothing to commit"
git commit -m "Release v$VERSION"
echo
echo "✅ Staged v$VERSION. Review, then publish:"
echo "   git push origin main && git tag -a v$VERSION -m \"Release v$VERSION\" && git push origin v$VERSION"
