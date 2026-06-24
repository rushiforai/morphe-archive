"""
Searches GitHub for repositories that look like Morphe patch sources, then
verifies each candidate actually has a GitHub Release with a `.mpp` asset
attached (the real signal that it's a Morphe patch bundle, since Morphe
bundles are distributed as release assets, not regular repo files).

Steps:
  1. Code search for `patches-bundle.json` files (excludes forks)
  2. For each candidate repo, check its Releases API for any asset
     ending in `.mpp`
  3. Only repos that pass step 2 are kept

Results are merged with whatever is already in repos.txt (e.g. from
fetch_org_repos.py) and the de-duplicated, sorted list is written back out.

Note: GitHub's Search API requires authentication for decent rate limits
(code search: 10/min unauthenticated, higher with a token) and only
indexes the default branch of repos under a certain size, so this is a
best-effort discovery pass, not a guarantee of completeness.
"""

import os
import time
import requests

OUTPUT_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
CUSTOM_FILE = os.environ.get("CUSTOM_FILE", "custom_repos.txt")
IGNORE_FILE = os.environ.get("IGNORE_FILE", "ignore_repos.txt")

HEADERS = {
    "Accept": "application/vnd.github.v3+json",
    "User-Agent": "MorpheRepoTracker-Pipeline",
}
token = os.environ.get("GITHUB_TOKEN")
if token:
    HEADERS["Authorization"] = f"token {token}"

# Note: GitHub code search does NOT support the `fork:` qualifier
# (that's repo-search only). Forks are filtered out afterward using
# each result's repository metadata instead.
CODE_SEARCH_QUERIES = [
    "filename:patches-bundle.json",
]


def request_with_backoff(url, params=None):
    for attempt in range(1, 4):
        resp = requests.get(url, headers=HEADERS, params=params, timeout=30)
        if resp.status_code == 200:
            return resp
        if resp.status_code in (403, 429):
            wait = int(resp.headers.get("Retry-After", 10))
            print(f"Rate limited, waiting {wait}s...")
            time.sleep(wait)
            continue
        print(f"Error {resp.status_code} for {url}: {resp.text}")
        return None
    return None


def search_code(query):
    """Paginate through GitHub code search results for a given query."""
    results = []
    page = 1
    per_page = 100

    while True:
        resp = request_with_backoff(
            "https://api.github.com/search/code",
            params={"q": query, "per_page": per_page, "page": page},
        )
        if resp is None:
            break

        data = resp.json()
        items = data.get("items", [])
        results.extend(items)

        if len(items) < per_page or page >= 10:  # Search API caps at 1000 results
            break
        page += 1
        time.sleep(2)

    return results


def is_fork(full_name):
    """Check whether the repo is a fork via the repo API (code search
    results don't reliably include this field)."""
    url = f"https://api.github.com/repos/{full_name}"
    resp = request_with_backoff(url)
    if resp is None:
        return False  # if we can't tell, don't exclude it
    data = resp.json()
    return bool(data.get("fork", False))


def repo_has_mpp_release(full_name):
    """Check the repo's releases for any asset ending in .mpp."""
    url = f"https://api.github.com/repos/{full_name}/releases"
    resp = request_with_backoff(url, params={"per_page": 10})
    if resp is None:
        return False

    releases = resp.json()
    if not isinstance(releases, list):
        return False

    for release in releases:
        for asset in release.get("assets", []):
            name = asset.get("name", "")
            if name.lower().endswith(".mpp"):
                return True

    return False


def collect_candidate_repos():
    candidates = {}  # full_name -> repo metadata (to filter forks defensively too)

    for query in CODE_SEARCH_QUERIES:
        print(f"Searching code for: {query}")
        items = search_code(query)
        print(f"  -> {len(items)} results")

        for item in items:
            repo = item.get("repository", {})
            full_name = repo.get("full_name")
            if full_name:
                candidates[full_name] = repo

        time.sleep(2)

    return candidates


def filter_verified_repos(candidates):
    verified = set()

    for full_name in sorted(candidates):
        print(f"Checking https://github.com/{full_name} for .mpp releases...")

        if is_fork(full_name):
            print(f"  [-] {full_name} is a fork, skipping")
            continue

        if repo_has_mpp_release(full_name):
            print(f"  [+] {full_name} has a .mpp release asset")
            verified.add(full_name)
        else:
            print(f"  [-] {full_name} has no .mpp release asset, skipping")
        time.sleep(1)

    return verified


def load_lines(path):
    """Read a newline-separated list file, ignoring blanks and # comments."""
    if not os.path.exists(path):
        return set()
    with open(path) as f:
        return {
            line.strip() for line in f
            if line.strip() and not line.strip().startswith("#")
        }


def main():
    if not token:
        print("Warning: no GITHUB_TOKEN set, search rate limits will be very low.")

    candidates = collect_candidate_repos()
    verified = filter_verified_repos(candidates)

    existing_repos = load_lines(OUTPUT_FILE)
    custom_repos = load_lines(CUSTOM_FILE)
    ignore_repos = load_lines(IGNORE_FILE)

    # Merge: keep what's already in repos.txt, add newly verified +
    # custom repos, then drop anything explicitly ignored. A repo that
    # no longer shows up in search is NOT auto-removed -- add it to
    # ignore_repos.txt if it should actually be dropped.
    combined = sorted((existing_repos | verified | custom_repos) - ignore_repos)

    with open(OUTPUT_FILE, "w") as f:
        for repo in combined:
            f.write(repo + "\n")

    print(f"Found {len(candidates)} candidates, {len(verified)} verified with .mpp releases.")
    print(
        f"Existing: {len(existing_repos)}. Custom: {len(custom_repos)}. "
        f"Ignored: {len(ignore_repos)}. Saved {len(combined)} total repos to {OUTPUT_FILE}."
    )


if __name__ == "__main__":
    main()