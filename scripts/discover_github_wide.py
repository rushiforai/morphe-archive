"""
Searches GitHub for repositories that look like Morphe patch sources, then
verifies each candidate by fetching its actual patches-bundle.json.

New discoveries can be written to a pending review file instead of directly
changing repos.txt by setting REVIEW_DISCOVERIES=true.
"""

import json
import os
import time

import requests

from add_repos_to_bundles import RepoRef, bundle_url, validate_bundle_url

OUTPUT_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")
CUSTOM_FILE = os.environ.get("CUSTOM_FILE", "custom_repos.txt")
IGNORE_FILE = os.environ.get("IGNORE_FILE", "ignore_repos.txt")
REJECTED_FILE = os.environ.get("REJECTED_FILE", "rejected_repos.txt")
PENDING_FILE = os.environ.get("PENDING_FILE", "pending_repos.txt")
PENDING_EVIDENCE_FILE = os.environ.get("PENDING_EVIDENCE_FILE", "pending_repos.json")
REVIEW_DISCOVERIES = os.environ.get("REVIEW_DISCOVERIES", "").lower() in ("1", "true", "yes")

HEADERS = {
    "Accept": "application/vnd.github.v3+json",
    "User-Agent": "MorpheRepoTracker-Pipeline",
}
token = os.environ.get("GITHUB_TOKEN")
if token:
    HEADERS["Authorization"] = f"token {token}"

CODE_SEARCH_QUERIES = [
    "filename:patches-bundle.json",
]
FALLBACK_BRANCHES = ("main", "master")


def request_with_backoff(url, params=None):
    for attempt in range(1, 4):
        resp = requests.get(url, headers=HEADERS, params=params, timeout=30)
        if resp.status_code == 200:
            return resp
        if resp.status_code in (403, 429):
            wait = int(resp.headers.get("Retry-After", 10))
            reset_at = resp.headers.get("X-RateLimit-Reset")
            if reset_at and wait == 10:
                wait = max(int(reset_at) - int(time.time()), 10)
            print(f"Rate limited, waiting {wait}s...")
            time.sleep(wait)
            continue
        print(f"Error {resp.status_code} for {url}: {resp.text}")
        return None
    return None


def search_code(query):
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

        items = resp.json().get("items", [])
        results.extend(items)

        if len(items) < per_page or page >= 10:
            break
        page += 1
        time.sleep(2)

    return results


def get_repo_metadata(full_name, search_metadata):
    resp = request_with_backoff(f"https://api.github.com/repos/{full_name}")
    if resp is None:
        return search_metadata or {}
    return resp.json()


def branch_candidates(default_branch):
    branches = []
    if default_branch:
        branches.append(default_branch)
    for branch in FALLBACK_BRANCHES:
        if branch not in branches:
            branches.append(branch)
    return branches


def validate_repo_bundle(full_name, default_branch):
    repo_ref = RepoRef(host="github.com", path=full_name)
    failures = []

    for branch in branch_candidates(default_branch):
        url = bundle_url(repo_ref, branch)
        valid, reason = validate_bundle_url(url)
        if valid:
            return {
                "repo": full_name,
                "branch": branch,
                "bundle_url": url,
                "source": "GitHub code search",
            }
        failures.append(f"{branch}: {reason}")

    return None, "; ".join(failures)


def collect_candidate_repos():
    candidates = {}

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


def filter_verified_repos(candidates, rejected_repos):
    verified = {}

    for full_name in sorted(candidates):
        if full_name in rejected_repos:
            print(f"Skipping rejected repo: {full_name}")
            continue

        print(f"Checking https://github.com/{full_name} bundle JSON...")
        metadata = get_repo_metadata(full_name, candidates[full_name])
        canonical_name = metadata.get("full_name") or full_name
        if canonical_name in rejected_repos:
            print(f"Skipping rejected repo: {canonical_name}")
            continue

        evidence = validate_repo_bundle(canonical_name, metadata.get("default_branch"))
        if isinstance(evidence, tuple):
            _, reason = evidence
            print(f"  [-] {canonical_name} has no valid .mpp bundle: {reason}")
        else:
            if metadata.get("fork"):
                evidence["fork"] = True
                evidence["note"] = "Fork accepted because its bundle JSON validates."
            print(f"  [+] {canonical_name} has a valid .mpp bundle on {evidence['branch']}")
            verified[canonical_name] = evidence
        time.sleep(1)

    return verified


def load_lines(path):
    if not os.path.exists(path):
        return set()
    with open(path, encoding="utf-8") as f:
        return {
            line.strip() for line in f
            if line.strip() and not line.strip().startswith("#")
        }


def append_pending_repos(path, repos):
    if not repos:
        return
    existing = load_lines(path)
    combined = sorted(existing | set(repos), key=str.lower)
    with open(path, "w", encoding="utf-8") as f:
        for repo in combined:
            f.write(repo + "\n")


def append_pending_evidence(path, evidence_by_repo):
    if not evidence_by_repo:
        return
    existing = {}
    if os.path.exists(path) and os.path.getsize(path) > 0:
        with open(path, encoding="utf-8") as f:
            try:
                existing = {item["repo"]: item for item in json.load(f)}
            except json.JSONDecodeError:
                existing = {}
    existing.update(evidence_by_repo)
    with open(path, "w", encoding="utf-8") as f:
        json.dump([existing[key] for key in sorted(existing, key=str.lower)], f, indent=2)
        f.write("\n")


def main():
    if not token:
        print("Warning: no GITHUB_TOKEN set, search rate limits will be very low.")

    existing_repos = load_lines(OUTPUT_FILE)
    custom_repos = load_lines(CUSTOM_FILE)
    ignore_repos = load_lines(IGNORE_FILE)
    rejected_repos = load_lines(REJECTED_FILE)

    candidates = collect_candidate_repos()
    verified_evidence = filter_verified_repos(candidates, ignore_repos | rejected_repos)
    verified = set(verified_evidence)

    new_discoveries = verified - existing_repos - custom_repos - ignore_repos - rejected_repos
    new_evidence = {repo: verified_evidence[repo] for repo in new_discoveries}

    verified_to_add = set() if REVIEW_DISCOVERIES else verified
    combined = sorted((existing_repos | verified_to_add | custom_repos) - ignore_repos - rejected_repos)

    with open(OUTPUT_FILE, "w", encoding="utf-8") as f:
        for repo in combined:
            f.write(repo + "\n")

    if REVIEW_DISCOVERIES:
        append_pending_repos(PENDING_FILE, new_discoveries)
        append_pending_evidence(PENDING_EVIDENCE_FILE, new_evidence)

    print(f"Found {len(candidates)} candidates, {len(verified)} with valid .mpp bundle JSON.")
    print(
        f"Existing: {len(existing_repos)}. Custom: {len(custom_repos)}. "
        f"Ignored: {len(ignore_repos)}. Rejected: {len(rejected_repos)}. "
        f"Saved {len(combined)} total repos to {OUTPUT_FILE}."
    )
    if REVIEW_DISCOVERIES:
        print(f"Queued {len(new_discoveries)} newly discovered repos for review in {PENDING_FILE}.")


if __name__ == "__main__":
    main()
