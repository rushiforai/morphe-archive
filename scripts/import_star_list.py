"""
Imports repositories from a GitHub star list (e.g. Jman-Github/revanced) into
repos.txt, applying the same validation the GitHub-wide discovery uses: a repo
is only added when patches-bundle.json exists on `main` or `master` and the
JSON contains at least one .mpp reference.

The star list is scraped from the public page
https://github.com/stars/<user>/lists/<name> (paginated). Repos already present
in repos.txt, custom_repos.txt, ignore_repos.txt or rejected_repos.txt are
skipped. Validated new repos are merged into repos.txt sorted case-insensitively
with LF endings, exactly like discover_github_wide.py writes it, so the two
steps are idempotent together.

Usage:
    python scripts/import_star_list.py

Environment:
    STAR_LIST_USER  = GitHub user owning the star list (default: Jman-Github)
    STAR_LIST_NAME  = Star list slug (default: revanced)
    OUTPUT_FILE     = repo list to merge into (default: repos.txt)
    CUSTOM_FILE     = always-included repos (default: custom_repos.txt)
    IGNORE_FILE     = always-excluded repos (default: ignore_repos.txt)
    REJECTED_FILE   = rejected repos (default: rejected_repos.txt)
    MAX_PAGES       = max star-list pages to fetch (default: 15)
    WORKERS         = concurrent bundle validations (default: 8)
"""

import html
import os
import re
import sys
import time
import urllib.request
from concurrent.futures import ThreadPoolExecutor, as_completed

from add_repos_to_bundles import RepoRef, BRANCHES_TO_TRY, bundle_url, validate_bundle_url

STAR_LIST_USER = os.environ.get("STAR_LIST_USER", "Jman-Github")
STAR_LIST_NAME = os.environ.get("STAR_LIST_NAME", "revanced")
OUTPUT_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
CUSTOM_FILE = os.environ.get("CUSTOM_FILE", "custom_repos.txt")
IGNORE_FILE = os.environ.get("IGNORE_FILE", "ignore_repos.txt")
REJECTED_FILE = os.environ.get("REJECTED_FILE", "rejected_repos.txt")
MAX_PAGES = int(os.environ.get("MAX_PAGES", "15"))
WORKERS = int(os.environ.get("WORKERS", "8"))

HEADERS = {
    "Accept": "text/html,application/xhtml+xml",
    "User-Agent": "Mozilla/5.0 (MorpheRepoStarListImporter)",
}

# GitHub chrome/footer links appear as /<owner>/<repo> too; drop known junk.
BAD_OWNERS = {
    "about", "collections", "contact", "copilot", "enterprise", "events",
    "explore", "features", "login", "marketplace", "orgs", "pricing",
    "settings", "site", "sponsors", "starred", "stars", "topics", "users",
}
BAD_REPOS = {
    "followers", "following", "packages", "projects", "repositories",
    "sponsoring", "sponsors", "stars",
}

REPO_LINK_RE = re.compile(r'href="/([A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+)"')


def fetch_page(page):
    url = f"https://github.com/stars/{STAR_LIST_USER}/lists/{STAR_LIST_NAME}?page={page}"
    req = urllib.request.Request(url, headers=HEADERS)
    try:
        with urllib.request.urlopen(req, timeout=30) as resp:
            return resp.read().decode("utf-8", errors="ignore")
    except Exception as e:
        print(f"  Error fetching {url}: {e}")
        return None


def extract_repos(html_text):
    repos = set()
    for match in REPO_LINK_RE.finditer(html_text):
        owner, repo = match.group(1).split("/", 1)
        if owner.lower() in BAD_OWNERS or repo.lower() in BAD_REPOS:
            continue
        repos.add(f"{owner}/{repo}")
    return repos


def collect_star_list():
    repos = set()
    for page in range(1, MAX_PAGES + 1):
        text = fetch_page(page)
        if text is None:
            break
        found = extract_repos(html.unescape(text))
        new = found - repos
        repos |= found
        print(f"  Page {page}: {len(found)} repo links ({len(new)} new, total {len(repos)})")
        if not found:
            break
        time.sleep(0.5)
    if not repos:
        print(
            f"  ERROR: no repos extracted from star list "
            f"({STAR_LIST_USER}/{STAR_LIST_NAME}). The page may require login."
        )
        sys.exit(1)
    return repos


def load_lines(path):
    if not os.path.exists(path):
        return set()
    with open(path, encoding="utf-8") as f:
        return {
            line.strip()
            for line in f
            if line.strip() and not line.strip().startswith("#")
        }


def check_bundle(repo):
    ref = RepoRef(host="github.com", path=repo)
    last_reason = "unknown"
    for branch in BRANCHES_TO_TRY:
        valid, reason = validate_bundle_url(bundle_url(ref, branch))
        if valid:
            return repo, branch, None
        last_reason = reason
    return repo, None, last_reason


def main():
    print(f"Importing star list: github.com/stars/{STAR_LIST_USER}/lists/{STAR_LIST_NAME}")
    star_repos = collect_star_list()

    existing = load_lines(OUTPUT_FILE)
    custom = load_lines(CUSTOM_FILE)
    ignore = load_lines(IGNORE_FILE)
    rejected = load_lines(REJECTED_FILE)
    print(
        f"Existing: {len(existing)}. Custom: {len(custom)}. "
        f"Ignored: {len(ignore)}. Rejected: {len(rejected)}."
    )

    existing_keys = {r.lower() for r in existing}
    custom_keys = {r.lower() for r in custom}
    excluded_keys = {r.lower() for r in ignore | rejected}

    candidates = [
        repo
        for repo in sorted(star_repos)
        if repo.lower() not in existing_keys
        and repo.lower() not in custom_keys
        and repo.lower() not in excluded_keys
    ]
    already_present = sorted(
        repo for repo in star_repos if repo.lower() in existing_keys
    )
    print(f"Star list repos: {len(star_repos)}. Already present: {len(already_present)}. "
          f"Candidates to validate: {len(candidates)}.")

    added = []
    invalid = []
    with ThreadPoolExecutor(max_workers=WORKERS) as executor:
        futures = [executor.submit(check_bundle, repo) for repo in candidates]
        for future in as_completed(futures):
            repo, branch, reason = future.result()
            if branch:
                added.append(repo)
                print(f"  [+] {repo} (bundle on {branch})")
            else:
                invalid.append((repo, reason))
                print(f"  [-] {repo}: {reason}")

    print(f"\nValid: {len(added)}. Invalid: {len(invalid)}.")

    new_entries = set(added)
    if not new_entries:
        print("Nothing to add; repos.txt unchanged.")
        return

    combined = sorted((existing | new_entries | custom) - ignore - rejected, key=str.lower)
    with open(OUTPUT_FILE, "w", encoding="utf-8", newline="") as f:
        for repo in combined:
            f.write(repo + "\n")

    print(f"Saved {len(combined)} repos to {OUTPUT_FILE} "
          f"(added {len(new_entries)} new, was {len(existing)}).")
    if already_present:
        print(f"Skipped {len(already_present)} already in the list.")
    if invalid:
        print(f"Skipped {len(invalid)} with invalid/no .mpp bundle on main/master:")


if __name__ == "__main__":
    main()