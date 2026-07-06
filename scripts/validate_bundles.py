"""
Validates every repo listed in repos.txt.

Plain "owner/repo" entries are treated as GitHub. GitLab entries can be written
as "gitlab.com/owner/repo" or "https://gitlab.com/owner/repo".

Checks:
  - duplicate repo entries after normalization
  - patches-bundle.json exists on main or master
  - bundle response is valid JSON
  - bundle JSON contains at least one real .mpp reference
"""

import os
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, SCRIPT_DIR)

from add_repos_to_bundles import BRANCHES_TO_TRY, bundle_url, load_repos, validate_bundle_url

REPOS_FILE = os.environ.get("OUTPUT_FILE", "repos.txt")


def normalized_key(repo):
    return f"{repo.host}/{repo.path}".lower()


def validate_repo(repo):
    reasons = []
    for branch in BRANCHES_TO_TRY:
        url = bundle_url(repo, branch)
        valid, reason = validate_bundle_url(url)
        if valid:
            return True, branch, url, None
        reasons.append(f"{branch}: {reason}")
    return False, None, None, "; ".join(reasons)


def main():
    repos_file = sys.argv[1] if len(sys.argv) > 1 else REPOS_FILE
    repos = load_repos(repos_file)

    seen = {}
    duplicates = []
    invalid = []
    valid_count = 0

    for repo in repos:
        key = normalized_key(repo)
        if key in seen:
            duplicates.append((repo.display, seen[key]))
            continue
        seen[key] = repo.display

        ok, branch, url, reason = validate_repo(repo)
        if ok:
            valid_count += 1
            print(f"[ok] {repo.display} ({branch})")
        else:
            invalid.append((repo.display, reason))
            print(f"[bad] {repo.display} - {reason}")

    if duplicates:
        print("\nDuplicate repo entries:")
        for duplicate, original in duplicates:
            print(f"  - {duplicate} duplicates {original}")

    if invalid:
        print("\nInvalid bundle entries:")
        for repo, reason in invalid:
            print(f"  - {repo}: {reason}")

    print(
        f"\nChecked {len(repos)} entries: {valid_count} valid, "
        f"{len(invalid)} invalid, {len(duplicates)} duplicate."
    )

    if invalid or duplicates:
        sys.exit(1)


if __name__ == "__main__":
    main()
