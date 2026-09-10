#!/bin/bash
# prepare-release.sh — stage a stable release on a branch even with main, then tag it post-merge.
# Usage: bash scripts/prepare-release.sh <X.Y.Z>
#
# On a branch whose HEAD equals origin/main with a clean tree, this:
#   1. Sets gradle.properties to the version.
#   2. Promotes CHANGELOG.md Unreleased to a dated version heading, with an
#      inline compare link after the initial release (see docs/release.md).
#   3. Regenerates patches-list.json, stamps its version, and refreshes the
#      README.md patch table.
#   4. Commits the release staging.
#
# Then publish with (see docs/release.md#staging-a-release): push the staging
# branch, open a PR, merge, sync main, and tag the post-merge main tip:
#   git push origin <staging-branch>
#   git tag v<X.Y.Z> && git push origin v<X.Y.Z>
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
# Release staging must start from the current tip of main — never from a
# stale or divergent branch — but the staging commit may sit on top of other
# reviewed work: feature and tooling commits can precede it on the same
# branch/PR. What matters is that the branch contains origin/main, so this
# checks ancestry instead of branch names or strict commit equality. A branch
# that is behind or diverged from origin/main is rejected. Synchronize
# first; the script never fetches (see docs/release.md#staging-a-release).
MAIN_HEAD="$(git rev-parse --verify --quiet origin/main)" || {
    echo "❌ origin/main is unknown; fetch origin first (see docs/release.md#staging-a-release)" >&2
    exit 1
}
git merge-base --is-ancestor "$MAIN_HEAD" HEAD || {
    echo "❌ HEAD ($(git rev-parse --short HEAD)) is not based on origin/main ($(git rev-parse --short "$MAIN_HEAD")); sync with origin/main first (see docs/release.md#staging-a-release)" >&2
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

# Validate history and promotion before modifying any files. Synchronize main
# and release tags first; see docs/release.md#staging-a-release.
PREV="$(
    python3 - "$VERSION" "$REPO" <<'PY'
import re, subprocess, sys
from pathlib import Path

version, repo = sys.argv[1:]
def die(message):
    sys.exit(message)

def git(*args):
    return subprocess.check_output(["git", *args], text=True).strip()

def number(value):
    return tuple(map(int, value.split(".")))

if git("rev-parse", "--is-shallow-repository") != "false":
    die("Release staging requires complete history; unshallow and synchronize tags first")
if not re.fullmatch(r"[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+", repo):
    die("Cannot resolve GitHub owner/repo for compare links")
text = Path("CHANGELOG.md").read_text(encoding="utf-8")
lines = text.splitlines()
if lines.count("## Unreleased") != 1:
    die("CHANGELOG.md must have exactly one '## Unreleased' section")
heading = re.compile(
    r"^##[ \t]+(?:\[(?P<linked>\d+\.\d+\.\d+)\]\((?P<url>[^)]*)\)|"
    r"(?P<bare>\d+\.\d+\.\d+))[ \t]+\(\d{4}-\d{2}-\d{2}\)[ \t]*$"
)
entries = []
unreleased = lines.index("## Unreleased")
first_release = len(lines)
for index, line in enumerate(lines):
    if not re.match(r"^#{1,3}\s", line) or line == "## Unreleased":
        continue
    match = heading.fullmatch(line)
    if match:
        if index < unreleased:
            die("Released entries must follow Unreleased")
        first_release = min(first_release, index)
        entries.append((match["linked"] or match["bare"], match["url"]))
    elif re.match(r"^##\s", line):
        die(f"Unrecognized release heading: {line}")
versions = [entry_version for entry_version, _ in entries]
if not any(line.startswith("* ") for line in lines[unreleased + 1:first_release]):
    die("## Unreleased has no '*' bullets — add the app patch changes first")
if version in versions:
    die(f"CHANGELOG.md already contains {version}; finish the staged release first")
if any(number(a) <= number(b) for a, b in zip(versions, versions[1:])):
    die("Released changelog versions must be unique and newest-first")
if entries:
    oldest = entries[-1][0]
    for position, (entry_version, url) in enumerate(entries):
        if position == len(entries) - 1:
            if url is not None:
                die(
                    f"Initial release {oldest} must use a bare heading "
                    f"'## {oldest} (YYYY-MM-DD)' without a compare link"
                )
            continue
        adjacent = entries[position + 1][0]
        expected = f"https://github.com/{repo}/compare/v{adjacent}...v{entry_version}"
        if url is None:
            die(
                f"Only the initial release ({oldest}) may use a bare heading; "
                f"## {entry_version} must link '{expected}'"
            )
        if url != expected:
            die(
                f"## {entry_version} links '{url}' but must link its adjacent "
                f"compare '{expected}'"
            )
reachable = [
    tag[1:] for tag in git("tag", "--merged", "HEAD").splitlines()
    if re.fullmatch(r"v\d+\.\d+\.\d+", tag)
]
prev = versions[0] if versions else ""
if prev:
    ref = f"refs/tags/v{prev}"
    if subprocess.run(["git", "rev-parse", "--verify", "--quiet", ref + "^{commit}"],
                      stdout=subprocess.DEVNULL).returncode:
        die(f"Missing tag v{prev}; synchronize tags or finish the untagged staged release")
    if subprocess.run(["git", "merge-base", "--is-ancestor", ref, "HEAD"]).returncode:
        die(f"Tag v{prev} is not reachable from HEAD")
    if prev != max(reachable, key=number):
        die("Newest changelog entry does not match the highest reachable stable tag")
    if number(version) <= number(prev):
        die(f"Version {version} must be greater than {prev}")
elif reachable:
    die("Stable tags exist but CHANGELOG.md has no released entries")
print(prev)
PY
)"

# 1. Pin the build version (portable -i across GNU/BSD sed).
sed -i.bak -E "s/^version *= *.*/version = $VERSION/" gradle.properties
rm -f gradle.properties.bak
grep -q "^version = $VERSION$" gradle.properties || die "failed to update gradle.properties"

# 2. Promote Unreleased to a dated, Manager-compatible version heading.
#    Only subsequent releases get inline compare links; old entries stay intact.
python3 - "$VERSION" "$TODAY" "$REPO" "$PREV" <<'PY'
import re, sys
version, today, repo, prev = sys.argv[1:]
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
label = f"[{version}](https://github.com/{repo}/compare/v{prev}...v{version})" if prev else version
open(path, "w", encoding="utf-8").write(
    text[: match.start()] + "## Unreleased\n\n" + f"## {label} ({today})\n" + body.rstrip("\n") + "\n\n" + rest.lstrip("\n")
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
git commit -m "chore(release): release v$VERSION"
echo
echo "✅ Staged v$VERSION. Review, then publish (see docs/release.md#staging-a-release):"
echo "   git push origin $(git rev-parse --abbrev-ref HEAD)  # open a PR, merge, sync main"
echo "   git tag v$VERSION  # on post-merge main, then push the tag"
