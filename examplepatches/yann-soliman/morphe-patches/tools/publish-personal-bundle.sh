#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${1:?usage: publish-personal-bundle.sh VERSION}"
DIST_BRANCH="${PERSONAL_DIST_BRANCH:-personal-dist}"
REPOSITORY="${GITHUB_REPOSITORY:-yann-soliman/morphe-patches}"
WORK="$(mktemp -d "${TMPDIR:-/tmp}/morphe-personal.XXXXXX")"

cleanup() {
  rm -rf "$WORK"
}
trap cleanup EXIT

cd "$ROOT"

bash "$ROOT/tools/build-personal-bundle.sh" "$WORK"

python3 - "$WORK/patches-bundle.json" "$VERSION" "$REPOSITORY" <<'PY'
import json
import sys
from datetime import datetime, timezone
from pathlib import Path

output = Path(sys.argv[1])
version = sys.argv[2]
repository = sys.argv[3]

payload = {
    "created_at": datetime.now(timezone.utc).replace(tzinfo=None, microsecond=0).isoformat(),
    "description": "Personal Keepcool bundle.",
    "download_url": (
        f"https://raw.githubusercontent.com/{repository}/refs/heads/personal-dist/"
        "personal/patches-personal.mpp"
    ),
    "signature_download_url": "",
    "version": version,
}
output.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
PY

git fetch origin main "$DIST_BRANCH"
git checkout -B "$DIST_BRANCH" origin/main

rm -rf personal
mkdir -p personal
cp "$WORK/patches-bundle.json" personal/patches-bundle.json
cp "$WORK/patches-list.json" personal/patches-list.json
cp "$WORK/patches-personal.mpp" personal/patches-personal.mpp

git config user.name "github-actions[bot]"
git config user.email "41898282+github-actions[bot]@users.noreply.github.com"

git add personal/patches-bundle.json personal/patches-list.json
git add -f personal/patches-personal.mpp

if git diff --cached --quiet; then
  echo "Personal bundle is already up to date."
else
  git commit -m "chore: update personal bundle $VERSION [skip ci]"
fi

git push --force-with-lease origin "$DIST_BRANCH"

echo "Personal source:"
echo "https://raw.githubusercontent.com/$REPOSITORY/refs/heads/$DIST_BRANCH/personal/patches-bundle.json"
