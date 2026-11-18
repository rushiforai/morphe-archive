"""
Imports every GitHub and GitLab source listed in the Morphe catalog.

The registry, GitHub-wide search and star-list import all start from GitHub,
so a GitLab-only bundle can be live in the catalog and still never reach
repos.txt. The catalog already normalizes both hosts, so reading it directly
closes that gap without guessing GitLab project paths.

Environment:
    CATALOG_URL       = catalog endpoint (default: bundles.json on morphe-patches.software)
    OUTPUT_FILE       = repo list to merge into (default: repos.txt)
    CUSTOM_FILE       = always-included repos (default: custom_repos.txt)
    IGNORE_FILE       = always-excluded repos (default: ignore_repos.txt)
    REJECTED_FILE     = rejected repos (default: rejected_repos.txt)
    PENDING_FILE      = review queue when REVIEW_DISCOVERIES is enabled
    REVIEW_DISCOVERIES = write new repos to PENDING_FILE instead of repos.txt
"""

import json
import os
import sys
import urllib.error
import urllib.parse
import urllib.request

from add_repos_to_bundles import parse_repo_ref

CATALOG_URL = os.environ.get(
    "CATALOG_URL",
    "https://morphe-patches.software/data/bundles.json",
)
OUTPUT_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
CUSTOM_FILE = os.environ.get("CUSTOM_FILE", "custom_repos.txt")
IGNORE_FILE = os.environ.get("IGNORE_FILE", "ignore_repos.txt")
REJECTED_FILE = os.environ.get("REJECTED_FILE", "rejected_repos.txt")
PENDING_FILE = os.environ.get("PENDING_FILE", "pending_repos.txt")
REVIEW_DISCOVERIES = os.environ.get("REVIEW_DISCOVERIES", "").lower() in ("1", "true", "yes")
TIMEOUT_SECONDS = 30


def fetch_catalog():
    request = urllib.request.Request(
        CATALOG_URL,
        headers={
            "Accept": "application/json",
            "User-Agent": "MorpheArchive-CatalogImporter/1.0",
        },
    )
    try:
        with urllib.request.urlopen(request, timeout=TIMEOUT_SECONDS) as response:
            if response.status != 200:
                print(f"Catalog returned HTTP {response.status}: {CATALOG_URL}")
                sys.exit(1)
            charset = response.headers.get_content_charset() or "utf-8"
            data = json.loads(response.read().decode(charset))
    except (urllib.error.URLError, urllib.error.HTTPError, TimeoutError, ValueError) as error:
        print(f"Could not read catalog {CATALOG_URL}: {error}")
        sys.exit(1)

    bundles = data.get("bundles") if isinstance(data, dict) else None
    if not isinstance(bundles, list):
        print(f"Catalog has no bundles list: {CATALOG_URL}")
        sys.exit(1)
    return bundles


def catalog_entry(bundle):
    """Return a canonical repos.txt entry for a catalog bundle, or None."""
    if not isinstance(bundle, dict):
        return None
    repo = str(bundle.get("repo") or "").strip().strip("/")
    source = str(bundle.get("source") or "").strip().lower()
    if not repo:
        return None

    if repo.lower().startswith(("https://", "http://")):
        parsed = urllib.parse.urlparse(repo)
        host = parsed.netloc.lower()
        repo = parsed.path.strip("/").removesuffix(".git")
        if host not in ("github.com", "gitlab.com"):
            return None
        entry = repo if host == "github.com" else f"{host}/{repo}"
    elif repo.lower().startswith("gitlab.com/"):
        entry = repo
    elif source == "gitlab":
        entry = f"gitlab.com/{repo}"
    else:
        entry = repo

    try:
        return parse_repo_ref(entry).display
    except ValueError:
        return None


def normalize_key(value):
    try:
        return parse_repo_ref(value).display.lower()
    except ValueError:
        return value.strip().lower()


def load_entries(path):
    entries = {}
    if not os.path.exists(path):
        return entries
    with open(path, encoding="utf-8") as file:
        for line in file:
            value = line.strip()
            if not value or value.startswith("#"):
                continue
            entries.setdefault(normalize_key(value), value)
    return entries


def write_pending(path, entries):
    if not entries:
        return
    existing = load_entries(path)
    combined = dict(existing)
    for key, value in entries.items():
        combined.setdefault(key, value)
    with open(path, "w", encoding="utf-8") as file:
        for value in sorted(combined.values(), key=str.lower):
            file.write(value + "\n")


def main():
    bundles = fetch_catalog()
    catalog = {}
    for bundle in bundles:
        entry = catalog_entry(bundle)
        if entry:
            catalog.setdefault(normalize_key(entry), entry)

    existing = load_entries(OUTPUT_FILE)
    custom = load_entries(CUSTOM_FILE)
    ignored = load_entries(IGNORE_FILE)
    rejected = load_entries(REJECTED_FILE)
    excluded = set(ignored) | set(rejected)

    new_entries = {
        key: value
        for key, value in catalog.items()
        if key not in existing and key not in custom and key not in excluded
    }

    to_add = {} if REVIEW_DISCOVERIES else new_entries
    combined = dict(existing)
    for key, value in custom.items():
        combined.setdefault(key, value)
    for key, value in to_add.items():
        combined.setdefault(key, value)
    combined = {key: value for key, value in combined.items() if key not in excluded}

    with open(OUTPUT_FILE, "w", encoding="utf-8") as file:
        for value in sorted(combined.values(), key=str.lower):
            file.write(value + "\n")

    if REVIEW_DISCOVERIES:
        write_pending(PENDING_FILE, new_entries)

    print(
        f"Catalog bundles: {len(bundles)}. Catalog repos: {len(catalog)}. "
        f"Existing: {len(existing)}. Custom: {len(custom)}. "
        f"Ignored: {len(ignored)}. Rejected: {len(rejected)}. "
        f"New: {len(new_entries)}. Saved: {len(combined)}."
    )
    if REVIEW_DISCOVERIES:
        print(f"Queued {len(new_entries)} new repos in {PENDING_FILE}.")


if __name__ == "__main__":
    main()